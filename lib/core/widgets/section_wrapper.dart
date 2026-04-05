import 'package:flutter/material.dart';
import '../constants/spacing.dart';

class SectionWrapper extends StatelessWidget {
  final Widget child;

  const SectionWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      constraints: BoxConstraints(
        minHeight: size.height,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.horizontalPadding(size.width),
      ),
      child: Align(
        alignment: const Alignment(0, -0.25), // 🔥 SUBE EL CONTENIDO
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      ),
    );
  }
}