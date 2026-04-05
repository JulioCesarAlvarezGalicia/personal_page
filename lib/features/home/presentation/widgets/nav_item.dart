import 'package:flutter/material.dart';

class NavItem extends StatefulWidget {
  final String text;
  final String section;
  final Function(String) onTap;

  const NavItem({
    super.key,
    required this.text,
    required this.section,
    required this.onTap,
  });

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: GestureDetector(
        onTap: () => widget.onTap(widget.section),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              fontSize: 16,
              color: isHovering ? Colors.blue : Colors.white,
              fontWeight: isHovering ? FontWeight.bold : FontWeight.normal,
            ),
            child: Text(widget.text),
          ),
        ),
      ),
    );
  }
}