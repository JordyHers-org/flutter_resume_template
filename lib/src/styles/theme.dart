import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:google_fonts/google_fonts.dart';

enum TemplateType {
  modernResume,

  classicResume,

  technicalResume,

  businessResume,
}

class TemplateTheme {
  /// templateType
  final TemplateType type;
  // template themeData
  final ThemeData themeData;

  //singleton instance
  static TemplateTheme? _instance;

  // factory setter
  factory TemplateTheme(TemplateType type, ThemeData themeData) {
    _instance = TemplateTheme._internal(type, themeData);
    return _instance!;
  }

  TemplateTheme._internal(this.type, this.themeData);

  static TextTheme globalTextTheme = TextTheme(
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
      shadowColor: Colors.indigo,
      primarySwatch: Colors.indigo,
      fontFamily: GoogleFonts.inter().fontFamily,
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
          shadowColor: Colors.green,
          primarySwatch: Colors.green,
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

  @override
  String toString() => ' Type: $type, ThemeData: $themeData';
}
