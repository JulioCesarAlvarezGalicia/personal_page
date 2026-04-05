class AppSpacing {
  static double horizontalPadding(double width) {
    if (width > 1200) return 120;
    if (width > 800) return 80;
    return 20;
  }

  static double sectionSpacing(double height) {
    if (height > 900) return 120;
    if (height > 700) return 100;
    return 80;
  }

  static double contentSpacing = 24;
}