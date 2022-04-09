import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// In a custom theme page we have described color and fonts
/// We may add more custom theme-features later
///

class HappyTheme {
  static TextStyle titleStyle = GoogleFonts.langar(
    textStyle: const TextStyle(
      color: HappyTheme.shrineBrown600,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  );

  static TextStyle greedStyle = GoogleFonts.laila(
    textStyle: const TextStyle(
      color: HappyTheme.shrinePink100,
      fontSize: 60.0,
      fontWeight: FontWeight.bold,
    ),
  );

  static TextStyle genderStyle = GoogleFonts.antic(
    textStyle: const TextStyle(
      color: HappyTheme.shrineSurfaceWhite,
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
    ),
  );

  static TextStyle postContentStyle = GoogleFonts.lato(
    textStyle: const TextStyle(
      color: HappyTheme.shrineBrown600,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  );

  static TextStyle appbarStyle = GoogleFonts.lato(
    textStyle: const TextStyle(
      color: HappyTheme.shrineSurfaceWhite,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  );

  static TextStyle contentStyle = GoogleFonts.lato(
    textStyle: const TextStyle(
      color: HappyTheme.shrineBrown900,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
  );

  static TextStyle postTitleStyle = GoogleFonts.laila(
    textStyle: const TextStyle(
      color: HappyTheme.shrinePink400,
      fontSize: 35.0,
      fontWeight: FontWeight.bold,
    ),
  );

  static TextStyle happinessIndexStyle = GoogleFonts.antic(
    textStyle: const TextStyle(
      color: HappyTheme.shrineSurfaceWhite,
      fontSize: 80.0,
      fontWeight: FontWeight.bold,
    ),
  );

  static TextStyle happinessResultStyle = GoogleFonts.lato(
    textStyle: const TextStyle(
      color: HappyTheme.shrineSurfaceWhite,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
  );

  ThemeData _buildShrineTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: _shrineColorScheme,
      toggleableActiveColor: shrinePink400,
      primaryColor: shrinePink100,
      primaryColorLight: shrinePink100,
      scaffoldBackgroundColor: shrineBackgroundWhite,
      cardColor: shrineBackgroundWhite,
      textSelectionTheme:
          const TextSelectionThemeData(selectionColor: shrinePink100),
      errorColor: shrineErrorRed,
      buttonTheme: ButtonThemeData(
        colorScheme: _shrineColorScheme.copyWith(primary: shrinePink400),
        textTheme: ButtonTextTheme.normal,
      ),
      primaryIconTheme: _customIconTheme(base.iconTheme),
      textTheme: _buildShrineTextTheme(base.textTheme),
      primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
      iconTheme: _customIconTheme(base.iconTheme),
    );
  }

  ThemeData buildTheme() {
    return _buildShrineTheme();
  }

  IconThemeData _customIconTheme(IconThemeData original) {
    return original.copyWith(color: shrineBrown900);
  }

  TextTheme _buildShrineTextTheme(TextTheme base) {
    return base
        .copyWith(
          caption: base.caption!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            letterSpacing: defaultLetterSpacing,
          ),
          button: base.button!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            letterSpacing: defaultLetterSpacing,
          ),
        )
        .apply(
          fontFamily: 'Rubik',
          displayColor: shrineBrown900,
          bodyColor: shrineBrown900,
        );
  }

  static const ColorScheme _shrineColorScheme = ColorScheme(
    primary: shrinePink100,
    secondary: shrinePink50,
    surface: shrineSurfaceWhite,
    background: shrineBackgroundWhite,
    error: shrineErrorRed,
    onPrimary: shrineBrown900,
    onSecondary: shrineBrown900,
    onSurface: shrineBrown900,
    onBackground: shrineBrown900,
    onError: shrineSurfaceWhite,
    brightness: Brightness.light,
  );

  static const answerColor = Color(0xFFFFFFFF);

  static const Color activeCoor = Color(0xFFaa1111);
  static const Color inactiveCoor = Color(0xFF893131);

  static const Color shrinePink50 = Color(0xFFFEEAE6);
  static const Color shrinePink100 = Color(0xFFFEDBD0);
  static const Color shrinePink300 = Color(0xFFFBB8AC);
  static const Color shrinePink400 = Color(0xFFEAA4A4);

  static const Color shrineBrown900 = Color(0xFF4f0808);
  static const Color shrineBrown600 = Color(0xFF893131);

  static const Color shrineErrorRed = Color(0xFFC5032B);

  static const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
  static const Color shrineBackgroundWhite = Colors.white;

  static const defaultLetterSpacing = 0.03;
}
