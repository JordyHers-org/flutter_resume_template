import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';

class DisplayText extends StatefulWidget {
  final String text;
  final int? maxLines;
  final TextStyle? style;
  final double? minFontSize;
  final double? maxFontSize;
  final double? forceFontSize;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  final Function<bool>()? onSubmitted;

  const DisplayText(
      {Key? key,
      required this.text,
      required this.style,
      this.maxLines,
      this.minFontSize,
      this.maxFontSize,
      this.forceFontSize,
      this.controller,
      this.onSubmitted,
      this.focusNode})
      : super(key: key);

  @override
  State<DisplayText> createState() => _DisplayTextState();
}

class _DisplayTextState extends State<DisplayText> {
  bool showFirstWidget = true;
  bool isEmptyField = true;
  late String label;

  @override
  void initState() {
    label = widget.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return showFirstWidget
        ? GestureDetector(
            onTap: () => setState(() {
              showFirstWidget = false;
            }),
            child: AutoSizeText(
              label,
              presetFontSizes: const [14, 15, 16, 17],
              maxFontSize: widget.maxFontSize ?? 30.0,
              minFontSize: widget.minFontSize ?? 10.0,
              maxLines: widget.maxLines ?? 3,
              style: widget.style,
            ),
          )
        : SizedBox(
            width: 110,
            height: 50,
            child: TextField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              cursorColor: Colors.amber,
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() {
                    showFirstWidget = true;
                  });
                }
              },
              onSubmitted: (value) {
                if (widget.controller != null &&
                    widget.controller!.text.isNotEmpty) {
                  label = value;
                }

                showFirstWidget = true;
              },
              onEditingComplete: () => setState(() {
                showFirstWidget = true;
              }),
            ),
          );
  }
}
