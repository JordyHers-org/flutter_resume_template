import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';

class DisplayText extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextStyle? style;
  final double? minFontSize;
  final double? maxFontSize;
  final double? forceFontSize;

  const DisplayText({
    Key? key,
    required this.text,
    required this.style,
    this.maxLines,
    this.minFontSize,
    this.maxFontSize,
    this.forceFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      presetFontSizes: const [14, 15, 16, 17],
      maxFontSize: maxFontSize ?? 30.0,
      minFontSize: minFontSize ?? 10.0,
      maxLines: maxLines ?? 3,
      style: style,
    );
  }
}
