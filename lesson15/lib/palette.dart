import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xFF424242, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xFFFAFAFA),//10%
      100: const Color(0xFFF5F5F5),//20%
      200: const Color(0xFFEEEEEE),//30%
      300: const Color(0xFFE0E0E0),//40%
      400: const Color(0xFFD6D6D6),//50%
      500: const Color(0xFFBDBDBD),//60%
      600: const Color(0xFF9E9E9E),//70%
      700: const Color(0xFF757575),//80%
      800: const Color(0xFF616161),//90%
      900: const Color(0xFF424242),//100%
    },
  );
} //