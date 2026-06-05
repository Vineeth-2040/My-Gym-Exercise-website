import 'package:flutter/material.dart';

class AppTheme {
  // Color palette matching style.css
  static const Color bg = Color(0xFFF3EFE7);
  static const Color text = Color(0xFF1F1B16);
  static const Color muted = Color(0xFF6A6258);
  static const Color accent = Color(0xFFD56F3E);
  static const Color accentDeep = Color(0xFF8C3B1A);
  static const Color line = Color(0x171F1B16); // rgba(31, 27, 22, 0.09)
  static const Color shadow = Color(0x1E4C3114); // rgba(76, 49, 20, 0.12)
  static const Color panel = Color(0xD1FFFFFF); // rgba(255, 255, 255, 0.82)
  static const Color panelStrong = Color(0xFFFFFAF2); // #fffaf2
  static const Color badgeBg = Color(0xFFFFF8E9); // #fff8e9
  
  // Font Family
  static const String fontFamily = 'Outfit';

  // Gradient background decoration representing the original CSS background
  static BoxDecoration get backgroundDecoration => const BoxDecoration(
    color: bg,
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFF7F1E7),
        Color(0xFFEEE6D8),
      ],
    ),
  );

  // Radial overlay simulation
  static Widget radialBackgroundOverlay() {
    return Positioned(
      top: -100,
      left: -100,
      width: 400,
      height: 400,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              const Color(0xFFD56F3E).withOpacity(0.18),
              Colors.transparent,
            ],
            stops: const [0.0, 0.7],
          ),
        ),
      ),
    );
  }

  // Text Styles
  static const TextStyle eyebrowStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 2.2,
    color: accentDeep,
  );

  static const TextStyle heroTitleStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 34.0,
    fontWeight: FontWeight.w800,
    height: 1.1,
    color: text,
  );

  static const TextStyle heroDescriptionStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0,
    color: muted,
    height: 1.5,
  );

  static const TextStyle cycleTitleStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: text,
  );

  static const TextStyle cycleNoteStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13.0,
    color: muted,
  );

  static const TextStyle dayTitleStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
    color: text,
  );

  static const TextStyle exerciseNameStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: text,
    height: 1.2,
  );

  static const TextStyle badgeStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11.5,
    fontWeight: FontWeight.w600,
    color: muted,
  );
}
