import 'package:flutter/material.dart';
import '../../../../../core/widgets/section_wrapper.dart';
import '../../../../../core/constants/spacing.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const Text(
            "About Me",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: const [
                Text(
                  "I'm a software developer specialized in mobile and web application development using Flutter and Kotlin.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    height: 1.6,
                  ),
                ),

                SizedBox(height: 16),

                Text(
                  "Focused on building scalable, maintainable, and high-performance applications with clean architecture principles and modern development practices.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    height: 1.6,
                  ),
                ),

                SizedBox(height: 16),

                Text(
                  "Experienced in API integration, debugging, and optimization, with a strong emphasis on delivering efficient and user-centered solutions.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: AppSpacing.contentSpacing),
        ],
      ),
    );
  }
}