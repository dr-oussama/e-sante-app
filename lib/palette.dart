import 'package:flutter/material.dart';
class Palette {
  static const MaterialColor greencyan = const MaterialColor(
    0xFF01D0C3, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xFF01D0C3 ),//10%
      100: const Color(0xFF01D0C3),//20%
      200: const Color(0xFF01D0C3),//30%
      300: const Color(0xFF01D0C3),//40%
      400: const Color(0xFF01D0C3),//50%
      500: const Color(0xFF01D0C3),//60%
      600: const Color(0xFF01D0C3),//70%
      700: const Color(0xFF01D0C3),//80%
      800: const Color(0xFF01D0C3),//90%
      900: const Color(0xFF01D0C3),//100%
    },
  );
}