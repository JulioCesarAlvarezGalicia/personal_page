import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/portfolio_provider.dart';
import 'repo_card.dart';
import '../../../../core/widgets/section_wrapper.dart';

class PortfolioSection extends ConsumerWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reposAsync = ref.watch(portfolioProvider);

    return SectionWrapper(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Text(
            "Portfolio",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 40),

          reposAsync.when(
            data: (repos) {
              if (repos.isEmpty) {
                return const Text(
                  "No repositories available",
                  style: TextStyle(color: Colors.grey),
                );
              }     

              return LayoutBuilder(
                      builder: (context, constraints) {
                      final isMobile = constraints.maxWidth < 700;
                      return Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: repos.map((repo) {
                        return SizedBox(
                          width: isMobile
                            ? constraints.maxWidth
                            : (constraints.maxWidth / 2) - 10, // 🔥 2 columnas con gap 20
                        child: RepoCard(repo: repo),
                      );
                    }).toList(),
                  );
                },
              );
            },

            loading: () => const Padding(
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(),
            ),

            error: (e, _) => Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Error: $e",
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}