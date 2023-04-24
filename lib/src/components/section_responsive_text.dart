import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/components/section_bio_container.dart';

class DisplayText extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String? text;
  final int? maxLines;
  final TextStyle? style;
  final double? minFontSize;
  final double? maxFontSize;
  final double? forceFontSize;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  const DisplayText(
      {Key? key,
      required this.text,
      required this.style,
      this.maxLines,
      this.minFontSize,
      this.maxFontSize,
      this.forceFontSize,
      this.controller,
      this.focusNode,
      this.padding})
      : super(key: key);

  @override
  State<DisplayText> createState() => _DisplayTextState();
}

class _DisplayTextState extends State<DisplayText> {
  bool showFirstWidget = true;
  bool isEmptyField = true;
  late String label;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    label = widget.text ?? '';
    _textEditingController = widget.controller ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return showFirstWidget
        ? LongPressDraggable(
            dragAnchorStrategy: pointerDragAnchorStrategy,
            childWhenDragging: Config.spaceBox(Config.tenPx),
            feedback: Material(
              child: SBContainer(
                child: AutoSizeText(
                  label,
                  minFontSize: 11,
                  maxFontSize: 23,
                  maxLines: 3,
                  style: widget.style,
                ),
              ),
            ),
            child: Padding(
              padding: widget.padding ?? EdgeInsets.zero,
              child: GestureDetector(
                onTap: () => setState(() {
                  showFirstWidget = false;
                }),
                child: AutoSizeText(
                  label,
                  maxFontSize: widget.maxFontSize ?? 30.0,
                  minFontSize: widget.minFontSize ?? 10.0,
                  maxLines: widget.maxLines ?? 3,
                  style: widget.style,
                ),
              ),
            ),
          )
        : SizedBox(
            width: 110,
            height: 50,
            child: TextField(
              maxLines: null, // Set this
              expands: true,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: _textEditingController.text,
                border: const OutlineInputBorder(),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              ), // and this
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.done,
              controller: _textEditingController,
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
                if (_textEditingController.text.isNotEmpty) {
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
