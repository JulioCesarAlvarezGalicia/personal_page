import 'package:flutter/material.dart';
import 'nav_item.dart';
import '../../../../core/utils/responsive.dart';

class Navbar extends StatelessWidget {
  final Function(String) onItemSelected;
  final VoidCallback onMenuTap;
  const Navbar({super.key, required this.onItemSelected, required this.onMenuTap,});

  @override
Widget build(BuildContext context) {
  final isMobile = Responsive.isMobile(context);

  return Container(
    height: 70,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    color: const Color(0xFF0D0D0D),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (!isMobile)
          Row(
            children: [
              NavItem(
                text: "Home",
                section: "home",
                onTap: onItemSelected,
              ),
              NavItem(
                text: "About Me",
                section: "about me",
                onTap: onItemSelected,
              ),
              NavItem(
                text: "Portfolio",
                section: "portfolio",
                onTap: onItemSelected,
              ),
              NavItem(
                text: "Resume",
                section: "resume",
                onTap: onItemSelected,
              ),
              NavItem(
                text: "Work Experience",
                section: "work experience",
                onTap: onItemSelected,
              ),
              NavItem(
                text: "Tech Stack",
                section: "tech stack",
                onTap: onItemSelected,
              ),
            ],
          )
        else
          IconButton(
          icon: const Icon(Icons.menu),
          onPressed: onMenuTap,
        )
      ],
    ),
  );
}

}