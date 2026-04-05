import 'package:flutter/material.dart';
import '../../../../../core/widgets/section_wrapper.dart';
import '../../../../../core/constants/spacing.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  final String imageUrl =
      "https://www.matawebsite.com/images/blog/627_flutter_vs_kotlin.png";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SectionWrapper(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Text(
            "Flutter & Mobile Developer",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            "Specialized in Flutter and Kotlin for the development of applications based on requirements.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              height: 1.5,
            ),
          ),

          SizedBox(height: AppSpacing.contentSpacing * 2),

          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 500,
              maxHeight: height * 0.35,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}