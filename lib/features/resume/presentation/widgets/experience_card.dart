import 'package:flutter/material.dart';

class ExperienceCard extends StatefulWidget {
  final String title;
  final String company;
  final String period;
  final String description;
  final List<String> bullets;
  final List<String> tech;

  const ExperienceCard({
    super.key,
    required this.title,
    required this.company,
    required this.period,
    required this.description,
    required this.bullets,
    required this.tech,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 320,
        padding: const EdgeInsets.all(20),
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
          ..translate(0.0, isHovering ? -6.0 : 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              widget.company,
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 4),

            Text(
              widget.period,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              widget.description,
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 12),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.bullets.map((b) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    "• $b",
                    style: const TextStyle(color: Colors.grey),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.tech.map((t) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white12),
                  ),
                  child: Text(
                    t,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}