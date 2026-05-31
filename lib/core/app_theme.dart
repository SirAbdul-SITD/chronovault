import 'package:flutter/material.dart';

class AppTheme {
  static const Color bgDeep      = Color(0xFF090E1A);
  static const Color bgCard      = Color(0xFF111827);
  static const Color bgPanel     = Color(0xFF1A2235);
  static const Color goldPrime   = Color(0xFFD4A843);
  static const Color goldLight   = Color(0xFFF0C96B);
  static const Color goldDim     = Color(0xFF8A6A1E);
  static const Color inkLight    = Color(0xFFE8DECA);
  static const Color inkMid      = Color(0xFFB0A080);
  static const Color inkFaint    = Color(0xFF5C5040);
  static const Color accentTeal  = Color(0xFF3DD6C8);
  static const Color accentRed   = Color(0xFFE84848);
  static const Color accentGreen = Color(0xFF4EC97A);

  static TextStyle displayTitle({double size = 36, Color? color}) => TextStyle(
    fontFamily: 'CinzelDecorative',
    fontSize: size,
    color: color ?? goldPrime,
    fontWeight: FontWeight.w700,
    letterSpacing: 2.0,
  );

  static TextStyle heading({double size = 20, Color? color}) => TextStyle(
    fontFamily: 'Cinzel',
    fontSize: size,
    color: color ?? inkLight,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
  );

  static TextStyle body({double size = 15, Color? color}) => TextStyle(
    fontFamily: 'Lora',
    fontSize: size,
    color: color ?? inkLight,
    fontWeight: FontWeight.w400,
  );

  static TextStyle label({double size = 12, Color? color}) => TextStyle(
    fontFamily: 'Cinzel',
    fontSize: size,
    color: color ?? inkMid,
    letterSpacing: 1.5,
    fontWeight: FontWeight.w500,
  );

  static TextStyle number({double size = 28, Color? color}) => TextStyle(
    fontFamily: 'PlayfairDisplay',
    fontSize: size,
    color: color ?? goldLight,
    fontWeight: FontWeight.w700,
  );

  static BoxDecoration cardDecoration({bool highlight = false}) => BoxDecoration(
    color: highlight ? bgPanel : bgCard,
    borderRadius: BorderRadius.circular(14),
    border: Border.all(
      color: highlight ? goldPrime : goldDim.withOpacity(0.35),
      width: highlight ? 1.5 : 1.0,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.45),
        blurRadius: 12,
        offset: const Offset(0, 4),
      ),
    ],
  );

  static BoxDecoration goldButton() => BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient: const LinearGradient(
      colors: [Color(0xFFC8962A), Color(0xFFE8B840), Color(0xFFC8962A)],
      stops: [0.0, 0.5, 1.0],
    ),
    boxShadow: [
      BoxShadow(
        color: goldPrime.withOpacity(0.35),
        blurRadius: 14,
        offset: const Offset(0, 4),
      ),
    ],
  );

  static ThemeData theme() => ThemeData(
    scaffoldBackgroundColor: bgDeep,
    colorScheme: const ColorScheme.dark(
      primary: goldPrime,
      secondary: accentTeal,
      surface: bgCard,
      background: bgDeep,
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
  );
}
