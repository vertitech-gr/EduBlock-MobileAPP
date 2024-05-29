/// Creating custom color palettes is part of creating a custom app. The idea is to create
/// your class of custom colors, in this case `CompanyColors` and then create a `ThemeData`
/// object with those colors you just defined.
///
/// Resource:
/// A good resource would be this website: http://mcg.mbitson.com/
/// You simply need to put in the colour you wish to use, and it will generate all shades
/// for you. Your primary colour will be the `500` value.
///
/// Colour Creation:
/// In order to create the custom colours you need to create a `Map<int, Color>` object
/// which will have all the shade values. `const Color(0xFF...)` will be how you create
/// the colours. The six character hex code is what follows. If you wanted the colour
/// #114488 or #D39090 as primary colours in your setting, then you would have
/// `const Color(0x114488)` and `const Color(0xD39090)`, respectively.
///
/// Usage:
/// In order to use this newly created setting or even the colours in it, you would just
/// `import` this file in your project, anywhere you needed it.
/// `import 'path/to/setting.dart';`
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      // Matches manifest.json colors and background color.
      backgroundColor:colorScheme.secondaryContainer ,
      // checkboxTheme: CheckboxThemeData(
      //   shape: BeveledRectangleBorder(),
      //   checkColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      //     if (states.contains(MaterialState.selected)) {
      //       // Color when the checkbox is checked
      //       return Colors.white;  // Replace with your desired color
      //     }
      //     // Color when the checkbox is unchecked
      //     return null; // You can return null for the default color
      //   }),
      // ),

      primaryColor: colorScheme.primary,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.inversePrimary,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFFFAFBFB)),
      ),
      // badgeTheme: colorScheme.secondaryContainer,
      iconTheme: IconThemeData(color: colorScheme.onSurface),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.primaryContainer,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      dividerColor: Color.fromRGBO(147, 147, 147, 1),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: _textTheme.subtitle1!.apply(color: _darkFillColor),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFFAFBFB),
    primaryContainer: Color.fromRGBO(15, 25, 34, 1),
    // secondary: Color.fromRGBO(19, 196, 159, 1),
    secondary: Color.fromRGBO(61, 61, 61, 1),
    secondaryContainer: Color.fromRGBO(19, 196, 159, 1),
    background: Color.fromRGBO(15, 25, 34, 1),
    surface: Color(0xFFFAFBFB),
    onBackground: Color.fromRGBO(221, 221, 221, 1),
    inversePrimary: Color.fromRGBO(30, 46, 59, 1),
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: Color.fromRGBO(217, 217, 217, 1),
    onSecondary: Color.fromRGBO(9, 53, 44, 1),
    onSurface: Color(0xFF000000),
    brightness: Brightness.light,
        onErrorContainer: Color.fromRGBO(217, 21, 21, 1),
    outline: Color.fromRGBO(116, 125, 128, 0.50),
    onPrimaryContainer: Color.fromRGBO(156, 156, 156, 1),
    onSecondaryContainer:Color.fromRGBO(53, 78, 99, 1),
    inverseSurface: Color.fromRGBO(68, 67, 67, 1),
    onInverseSurface: Color.fromRGBO(142, 142, 142, 1),
    


  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFF1E2E3B),
    primaryContainer: Color.fromRGBO(15, 25, 34, 1),
    secondary: Colors.red,
    secondaryContainer: Color(0xFF451B6F),

    background: Color(0xFF241E30),
    surface: Color(0xFF1F1929),
    onBackground: Color(0x0DFFFFFF),
    // White with 0.05 opacity
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme _textTheme = TextTheme(
    headlineMedium: GoogleFonts.lato(fontWeight: _bold, fontSize: 20.0),
    bodySmall: GoogleFonts.lato(fontWeight: _semiBold, fontSize: 16.0),
    headlineSmall: GoogleFonts.lato(fontWeight: _medium, fontSize: 16.0),
    titleMedium: GoogleFonts.lato(fontWeight: _medium, fontSize: 16.0),
    labelSmall: GoogleFonts.lato(fontWeight: _medium, fontSize: 10.0),
    bodyLarge: GoogleFonts.lato(fontWeight: _regular, fontSize: 14.0),
    titleSmall: GoogleFonts.lato(fontWeight: _medium, fontSize: 14.0),
    bodyMedium: GoogleFonts.lato(fontWeight: _regular, fontSize: 16.0),
    titleLarge: GoogleFonts.lato(fontWeight: _regular, fontSize: 24.0),
    labelLarge: GoogleFonts.lato(fontWeight: _semiBold, fontSize: 14.0),
    labelMedium: GoogleFonts.lato(fontWeight: _regular, fontSize: 12.0),
  );
}
