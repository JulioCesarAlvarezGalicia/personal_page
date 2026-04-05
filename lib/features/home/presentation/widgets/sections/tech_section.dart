import 'package:flutter/material.dart';
import '../../../../../core/widgets/section_wrapper.dart';
import '../../../../../core/constants/spacing.dart';

class TechSection extends StatelessWidget {
  const TechSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Tech Stack",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          SizedBox(height: AppSpacing.contentSpacing * 2),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: const [
                _TechChip(label: "Flutter"),
                _TechChip(label: "Dart"),
                _TechChip(label: "Kotlin"),
                _TechChip(label: "Firebase"),
                _TechChip(label: "REST APIs"),
                _TechChip(label: "Clean Architecture"),
                _TechChip(label: "Riverpod"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class _TechChip extends StatefulWidget {
  final String label;

  const _TechChip({required this.label});

  @override
  State<_TechChip> createState() => _TechChipState();
}

class _TechChipState extends State<_TechChip> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isHovering ? Colors.white : Colors.white10,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white24),
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            color: isHovering ? Colors.black : Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}