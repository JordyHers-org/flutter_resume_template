import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/utils/strings.dart';

class FlutterResumeTemplate extends StatefulWidget {
  /// The [TemplateTheme] class holds two main information:
  /// The template type and the theme data;
  ///The theme and visual appearance depend on the selected
  /// TemplateType.
  final TemplateTheme templateTheme;

  /// If  [withButtons] is true the buttons to edit and and
  /// save the resume will be displayed at the bottom of the page.
  /// Do not worry the buttons will not be displayed on the final PDF
  /// version of the resume.
  final bool? withButtons;

  /// The [TemplateData] class holds the general values available on the
  /// on the resume. They are specifically separated to make them quite
  /// modular. the [fullName] and [currentPosition] are on the top left.
  ///
  /// The  [street] , [address], [country], [email] and [phoneNumber] are
  /// all at the top right corner. Although the location depend on the
  /// template type.
  ///
  final TemplateData? data;

  const FlutterResumeTemplate({
    Key? key,
    required this.templateTheme,
    this.data,
    this.withButtons,
  }) : super(key: key);

  @override
  State<FlutterResumeTemplate> createState() => _FlutterResumeTemplateState();
}

class _FlutterResumeTemplateState extends State<FlutterResumeTemplate> {
  @override
  Widget build(BuildContext context) {
    final double h = Config.dynamicHeight(context);
    final double w = Config.dynamicWidth(context);

    return Theme(
      data: widget.templateTheme.themeData,
      child: LayoutBuilder(builder: (context, _) {
        switch (widget.templateTheme.type) {
          case TemplateType.modernResume:
            return LayoutModern(
              h: h,
              w: w,
              withButtons: widget.withButtons,
              data: widget.data ?? Str.mockData,
            );
          case TemplateType.classicResume:
            return LayoutClassic(
              h: h,
              w: w,
              withButtons: widget.withButtons,
              data: widget.data ?? Str.mockData,
            );
          case TemplateType.technicalResume:
            return LayoutTechnical(
              h: h,
              w: w,
              withButtons: widget.withButtons,
              data: widget.data ?? Str.mockData,
            );
          case TemplateType.businessResume:
            return LayoutBusiness(
              h: h,
              w: w,
              withButtons: widget.withButtons,
              data: widget.data ?? Str.mockData,
            );
          case TemplateType.none:
            return LayoutBusiness(
              h: h,
              w: w,
              withButtons: widget.withButtons,
              data: widget.data ?? Str.mockData,
            );
        }
      }),
    );
  }
}
