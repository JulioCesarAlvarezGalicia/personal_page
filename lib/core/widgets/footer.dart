import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  final String email = "cubotes81@gmail.com";
  final String phone = "+522228644703";

  Future<void> sendEmail() async {
    final uri = Uri.parse("mailto:$email");
    await launchUrl(uri);
  }

  Future<void> callPhone() async {
    final uri = Uri.parse("tel:$phone");
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: const Color(0xFF0A0A0A),
      child: Column(
        children: [
          const Divider(color: Colors.white24),

          const SizedBox(height: 20),

          const Text(
            "Contact",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 20),

          Wrap(
            spacing: 40,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _ContactItem(
                icon: Icons.email,
                text: email,
                onTap: sendEmail,
              ),
              _ContactItem(
                icon: Icons.phone,
                text: phone,
                onTap: callPhone,
              ),
              const Text(
                "© 2026 Cesar Galicia",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _ContactItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(color: Color.fromARGB(255, 101, 82, 82)),
          ),
        ],
      ),
    );
  }
}