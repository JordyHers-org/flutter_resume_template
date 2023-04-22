import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:google_fonts/google_fonts.dart';

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
        shadowColor: Colors.brown,
        primarySwatch: Colors.brown,
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
