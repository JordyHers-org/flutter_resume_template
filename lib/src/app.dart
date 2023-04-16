import 'package:flutter_resume_template/flutter_resume_template.dart';

class FlutterResumeTemplate extends StatefulWidget {
  final TemplateTheme templateTheme;

  const FlutterResumeTemplate({Key? key, required this.templateTheme})
      : super(key: key);

  @override
  State<FlutterResumeTemplate> createState() => _FlutterResumeTemplateState();
}

class _FlutterResumeTemplateState extends State<FlutterResumeTemplate> {
  @override
  Widget build(BuildContext context) {
    final double h = Config.dynamicHeight(context);
    final double w = Config.dynamicWidth(context);

    return LayoutBuilder(builder: (context, _) {
      switch (widget.templateTheme.type) {
        case TemplateType.modernResume:
          return LayoutModern(h: h, w: w);
        case TemplateType.classicResume:
          return LayoutClassic(h: h, w: w);
        case TemplateType.technicalResume:
          return LayoutTechnical(h: h, w: w);
        case TemplateType.businessResume:
          return LayoutBusiness(h: h, w: w);
      }
    });
  }
}
