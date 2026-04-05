import 'package:flutter/material.dart';
import '../../domain/entities/repo_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoCard extends StatefulWidget {
  final RepoEntity repo;

  const RepoCard({super.key, required this.repo});

  @override
  State<RepoCard> createState() => _RepoCardState();
}

class _RepoCardState extends State<RepoCard> {
  bool isHovering = false;

  Future<void> openUrl() async {
    final uri = Uri.parse(widget.repo.url);
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: openUrl,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          constraints: const BoxConstraints(
            maxWidth: 450,
          ),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: isHovering ? const Color(0xFF222222) : const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isHovering ? 0.6 : 0.3),
                blurRadius: isHovering ? 20 : 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          transform: Matrix4.identity()
            ..translate(0.0, isHovering ? -5.0 : 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.repo.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                widget.repo.description,
                style: const TextStyle(
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}