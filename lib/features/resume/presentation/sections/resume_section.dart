import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/widgets/section_wrapper.dart';
import '../../../../core/constants/spacing.dart';

class ResumeSection extends StatelessWidget {
  const ResumeSection({super.key});

  final String cvUrl =
      "https://drive.google.com/file/d/1Mc46DCTBBKhwK4u5nfc8lI7CjeWPpSwu/view?usp=sharing";
  final String tituloUrl =
      "https://drive.google.com/file/d/1BbTfEOU8cxl0AqO5499908APDgNaK7NC/view?usp=sharing";

  Future<void> downloadCV() async {
    final uri = Uri.parse(cvUrl);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> openTitulo() async {
    final uri = Uri.parse(tituloUrl);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Resume",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Curriculum vitae and professional documentation",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              height: 1.5,
            ),
          ),

          SizedBox(height: AppSpacing.contentSpacing * 2),

          LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 600;

              return Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _buildButton(
                    label: "CV",
                    icon: Icons.download,
                    onTap: downloadCV,
                    isFullWidth: isMobile,
                    maxWidth: constraints.maxWidth,
                  ),
                  _buildButton(
                    label: "Degree",
                    icon: Icons.school,
                    onTap: openTitulo,
                    isFullWidth: isMobile,
                    maxWidth: constraints.maxWidth,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
  required String label,
  required IconData icon,
  required VoidCallback onTap,
  required bool isFullWidth,
  required double maxWidth,
}) {
  final button = OutlinedButton.icon(
    onPressed: onTap,
    icon: Icon(icon, color: Colors.white),
    label: Text(
      label,
      style: const TextStyle(color: Colors.white),
    ),
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: Colors.white),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
    ),
  );

  if (isFullWidth) {
    return SizedBox(
      width: maxWidth,
      child: button,
    );
  }

  return button;
}
}