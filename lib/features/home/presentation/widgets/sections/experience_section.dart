import 'package:flutter/material.dart';
import '../../../../../core/widgets/section_wrapper.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../resume/presentation/widgets/experience_card.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 🧠 TITLE
          const Text(
            "Work Experience",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          SizedBox(height: AppSpacing.contentSpacing * 2),

          // 📦 GRID RESPONSIVE
          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 700;

              final experiences = const [
                ExperienceCard(
                  title: "Mobile Developer",
                  company: "Nairda Robot Programming",
                  period: "Apr 2023 – Jan 2024",
                  description:
                      "Flutter mobile application development and maintenance.",
                  bullets: [
                    "Implemented new features",
                    "Resolved performance issues",
                    "Collaborated with team",
                  ],
                  tech: ["Flutter", "Dart"],
                ),
                ExperienceCard(
                  title: "Web & Mobile Developer",
                  company: "Poliment",
                  period: "Oct 2022 – May 2023",
                  description: "Cross-platform app development.",
                  bullets: [
                    "Developed mobile/web apps",
                    "Integrated REST APIs",
                    "Optimized performance",
                  ],
                  tech: ["Flutter", "REST API"],
                ),
                ExperienceCard(
                  title: "Assistant Professor",
                  company: "BUAP",
                  period: "Jan 2022 – May 2022",
                  description: "Academic support in programming.",
                  bullets: [
                    "Taught programming basics",
                    "Helped students with logic",
                  ],
                  tech: ["C", "Algorithms"],
                ),
                ExperienceCard(
                  title: "Electronic Developer",
                  company: "Poliment",
                  period: "2018 – 2021",
                  description: "Prototype development.",
                  bullets: [
                    "Designed CAD models",
                    "Built prototypes",
                    "Performed testing",
                  ],
                  tech: ["Arduino", "Hardware"],
                ),
              ];

              return Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: experiences.map((exp) {
                    return SizedBox(
                      width: isMobile ? constraints.maxWidth : 420,
                      child: exp,
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}