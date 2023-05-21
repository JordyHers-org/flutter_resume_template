import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:google_fonts/google_fonts.dart';

/// A class that defines a set of custom colors for use in an application.
///
/// The `CustomColors` class provides a static set of color constants that can
/// be used to provide a consistent color scheme throughout an application. These
/// colors are chosen to match the branding or visual design of the application
/// and can be easily referenced from anywhere in the code.
///
/// The color constants defined in this class are static and immutable, and can be
/// accessed using the class name and the dot notation, for example `CustomColors.primaryColor`.
/// This allows for easy and consistent usage of colors
/// throughout the codebase.
///
/// To add additional colors, simply define a new static `Color` constant in the `
/// CustomColors` class. This can be done using the `Color` constructor with a hex
/// code or an RGB value. For example, to define a new color named `accentColor`,
/// you could add `static const Color accentColor = Color(0xFF00FF00);` to the
/// `CustomColors` class.
///
/// This class is intended to be used as a global color theme for the entire application,
/// and should be used in conjunction with a `Theme` widget or a similar mechanism for
/// setting the theme of an application.
///
///

class CustomColors {
  static MaterialColor primaryColorModern =
      buildMaterialColor(const Color(0xFF323b4c));

  // This Function creates a material color from HEX color value
  static MaterialColor buildMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}

/// A class that defines the theme for each resume layout template.
///
/// The `TemplateTheme` class provides a set of constants for the
/// colors, fonts, and other visual elements that are
/// specific to each resume layout template. This class is responsible
/// for handling the theme of each resume layout and
/// ensuring that the correct colors and fonts are used in each template.
///
/// The theme of each resume layout is accessible and handled in this
/// class through a set of static constants. Each
/// constant corresponds to a different theme element, such as
/// `backgroundColor`, `primaryColor`, `secondaryColor`,
/// `headlineFont`, and `bodyFont`. These constants can be used to
/// set the theme of a specific layout by passing them to
/// a `Theme` widget or a similar mechanism for setting the theme
/// of a widget subtree.
///
/// To add a new resume layout template, simply define a new set
/// of constants for the colors, fonts, and other visual
/// elements that are specific to the layout. These constants should
/// be added as static constants to this class and
/// should follow the naming conventions used by the existing constants.
/// Each new layout template should have a unique
/// set of constants to ensure that the correct theme is applied to
/// each layout.
///
/// This class is intended to be used as a global theme for the entire
/// resume generation process, and should be used in
/// conjunction with the layout templates and other widgets that make
/// up the resume generation process.

class TemplateTheme {
  /// templateType
  final TemplateType type;
  // template themeData
  final ThemeData themeData;

  //singleton instance
  static TemplateTheme? _instance;

  factory TemplateTheme(TemplateType type, ThemeData themeData) {
    _instance = TemplateTheme._internal(type, themeData);
    return _instance!;
  }

  TemplateTheme._internal(this.type, this.themeData);

  static TextTheme globalTextTheme = TextTheme(
    headlineLarge: const TextStyle(
      letterSpacing: 2.0,
      fontWeight: FontWeight.w800,
      fontSize: 38,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 17,
        color: Colors.grey.shade900,
        fontStyle: FontStyle.italic),
    titleLarge: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 22,
      color: Colors.grey.shade400,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 17,
      color: Colors.grey.shade400,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 15,
      color: Colors.grey.shade400,
    ),
    displayLarge: const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 18,
      color: Colors.black,
    ),
  );

  //Modern as a theme
  static TemplateTheme modern = TemplateTheme(
    TemplateType.modernResume,
    ThemeData(
      shadowColor: CustomColors.primaryColorModern,
      primarySwatch: CustomColors.primaryColorModern,
      fontFamily: GoogleFonts.bebasNeue().fontFamily,
      dividerColor: Colors.grey.shade300,
      textTheme: globalTextTheme,
    ),
  );

  //Classic as a theme
  static TemplateTheme classic = TemplateTheme(
      TemplateType.classicResume,
      ThemeData(
        shadowColor: CustomColors.buildMaterialColor(Colors.indigo.shade100),
        primarySwatch: CustomColors.buildMaterialColor(Colors.indigo.shade900),
        fontFamily: GoogleFonts.tinos().fontFamily,
        dividerColor: Colors.grey.shade300,
        textTheme: globalTextTheme,
      ));

  //technical as a theme
  static TemplateTheme technical = TemplateTheme(
      TemplateType.technicalResume,
      ThemeData(
          shadowColor: Colors.blueGrey,
          primarySwatch: Colors.blueGrey,
          fontFamily: GoogleFonts.notoSansGeorgian().fontFamily,
          dividerColor: Colors.grey.shade300,
          textTheme: globalTextTheme));

  //Business as a theme
  static TemplateTheme business = TemplateTheme(
      TemplateType.businessResume,
      ThemeData(
        shadowColor: Colors.deepPurple,
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.tinos().fontFamily,
        dividerColor: Colors.grey.shade300,
        textTheme: globalTextTheme,
      ));

  // No custom Theme Applied
  static TemplateTheme none = TemplateTheme(
    TemplateType.none,
    ThemeData(primarySwatch: Colors.blue),
  );

  @override
  String toString() => ' Type: $type, ThemeData: $themeData';
}
