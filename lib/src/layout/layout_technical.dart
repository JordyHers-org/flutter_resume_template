import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/components/section_bottom_buttons.dart';
import 'package:flutter_resume_template/src/components/section_rating_widget.dart';
import 'package:flutter_resume_template/src/components/section_shaking.dart';
import 'package:flutter_resume_template/src/utils/helper.dart';
import 'package:flutter_resume_template/src/utils/strings.dart';
import 'package:flutter_resume_template/src/utils/typedef_utils.dart';

/// A stateful widget that provides a technical-style layout for displaying content.
///
/// This widget, named LayoutTechnical, is designed to display technical documentation, code snippets, and other content
/// in a modern, streamlined format. The template includes a sidebar section for navigation links, a main content area
/// for displaying documentation or code, and a footer section for additional information or attribution.
///
/// The widget is customizable, with options for adjusting font sizes, colors, and other visual elements to match the
/// user's branding or preferences. It also supports dynamic data binding, allowing users to easily update the content of
/// their layout without needing to modify the underlying widget code.
///
/// To use this widget, simply create an instance of LayoutTechnical and pass in the required parameters. The widget will
/// automatically render the technical-style layout based on the provided data.

class LayoutTechnical extends StatefulWidget {
  const LayoutTechnical({
    super.key,
    this.onSaveResume,
    required this.mode,
    required this.data,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;
  final TemplateData data;
  final TemplateMode mode;
  final SaveResume<GlobalKey>? onSaveResume;

  @override
  State<LayoutTechnical> createState() => _LayoutTechnicalState();
}

class _LayoutTechnicalState extends State<LayoutTechnical> {
  GlobalKey globalKey = GlobalKey();

  late bool enableEditingMode = true;

  late bool isDragged = false;

  late TransformationController _controller;

  late bool absorbing = false;

  @override
  void initState() {
    setMode();
    _controller = TransformationController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void setMode() {
    switch (widget.mode) {
      case TemplateMode.onlyEditableMode:
        enableEditingMode = true;
        isDragged = false;
        absorbing = enableEditingMode && isDragged;
        break;
      case TemplateMode.readOnlyMode:
        enableEditingMode = false;
        isDragged = false;
        absorbing = true;
        break;
      case TemplateMode.shakeEditAndSaveMode:
        enableEditingMode = true;
        isDragged = false;
        absorbing = enableEditingMode && isDragged;
        break;
    }
  }

  void _save() {
    if (widget.onSaveResume != null &&
        widget.mode == TemplateMode.shakeEditAndSaveMode) {
      widget.onSaveResume!(globalKey);
      _controller.value = Matrix4.identity();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AbsorbPointer(
          absorbing: absorbing,
          child: InteractiveViewer(
            transformationController: _controller,
            panEnabled: false,
            boundaryMargin: EdgeInsets.all(Config.smallWidth),
            maxScale: Config.fourPx,
            child: Align(
              alignment: Alignment.topCenter,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  height: widget.h < 670 ? widget.h * 1.2 : widget.h * 1.05,
                  width: widget.w < 400 ? widget.w : widget.w * 0.8,
                  constraints: BoxConstraints(
                    minWidth: widget.w < 400 ? widget.w * 1.2 : widget.w * 1,
                    minHeight: widget.h < 670 ? widget.h * 1.2 : widget.h * 0.9,
                  ),
                  child: RepaintBoundary(
                    key: globalKey,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: SizedBox(
                        height: widget.h * 1.5,
                        width: widget.w * 1.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (Helper.isTestMode)
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(Str.backgroundImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 400,
                                  child: Container(
                                    alignment: const Alignment(0.0, 1.3),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          widget.data.image ??
                                              Str.resumeHeader),
                                      radius: 70.0,
                                    ),
                                  ),
                                ),
                              ),
                            Config.spaceBox(60.0),
                            Center(
                              child: AnimatedShakingBuilder(
                                autoPlay: isDragged,
                                child: DisplayText(
                                  text: widget.data.fullName,
                                  style: const TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.blueGrey,
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Config.spaceBox(20.0),
                            Padding(
                              padding: Config.dtHorPad.padding,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AnimatedShakingBuilder(
                                    autoPlay: isDragged,
                                    child: const DisplayText(
                                      text: "Address",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.blueGrey,
                                        letterSpacing: 1.5,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  AnimatedShakingBuilder(
                                    autoPlay: isDragged,
                                    child: const DisplayText(
                                      text: "Country",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.blueGrey,
                                        letterSpacing: 1.5,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Config.spaceBox(10),
                            Padding(
                              padding: Config.dtHorPad.padding,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AnimatedShakingBuilder(
                                    autoPlay: isDragged,
                                    child: DisplayText(
                                      text: widget.data.address,
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black54,
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  AnimatedShakingBuilder(
                                    autoPlay: isDragged,
                                    child: DisplayText(
                                      text: widget.data.street,
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black54,
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Config.spaceBox(30.0),
                            Padding(
                              padding: Config.dtHorPad.padding,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AnimatedShakingBuilder(
                                    autoPlay: isDragged,
                                    child: const DisplayText(
                                      text: "Work Experience",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.blueGrey,
                                        letterSpacing: 1.5,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  AnimatedShakingBuilder(
                                    autoPlay: isDragged,
                                    child: const DisplayText(
                                      text: "Education",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.blueGrey,
                                        letterSpacing: 1.5,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Config.spaceBox(10),
                            Padding(
                              padding: Config.dtHorPad.padding,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AnimatedShakingBuilder(
                                    autoPlay: isDragged,
                                    child: DisplayText(
                                      text: widget.data.experienceTitle,
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black54,
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  AnimatedShakingBuilder(
                                    autoPlay: isDragged,
                                    child: DisplayText(
                                      text: widget.data.education,
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black54,
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Config.spaceBox(30.0),
                            Padding(
                              padding: Config.dtHorPad.padding,
                              child: AnimatedShakingBuilder(
                                autoPlay: isDragged,
                                child: const DisplayText(
                                  text: "About Me",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.blueGrey,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Config.spaceBox(10.0),
                            Padding(
                              padding: Config.dtHorPad.padding,
                              child: AnimatedShakingBuilder(
                                autoPlay: isDragged,
                                child: DisplayText(
                                  text: widget.data.bio,
                                  minFontSize: 16,
                                  maxLines: 20,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            Config.spaceBox(40.0),
                            Padding(
                              padding: Config.dtHorPad.padding,
                              child: AnimatedShakingBuilder(
                                autoPlay: isDragged,
                                child: const DisplayText(
                                  text: "Hobbies",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.blueGrey,
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Config.spaceBox(10.0),
                            Padding(
                              padding: Config.dtHorPad.padding,
                              child: AnimatedShakingBuilder(
                                autoPlay: isDragged,
                                child: const DisplayText(
                                  text: ' BasketBall',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black54,
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                            Config.spaceBox(40.0),
                            Padding(
                              padding: Config.dtHorPad.padding,
                              child: AnimatedShakingBuilder(
                                autoPlay: isDragged,
                                child: const DisplayText(
                                  text: "Languages",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.blueGrey,
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Config.spaceBox(10.0),
                            Padding(
                              padding: Config.dtHorPad.padding,
                              child: AnimatedShakingBuilder(
                                autoPlay: isDragged,
                                child: const RatingWidget(
                                  rating: 5,
                                  title: 'English',
                                ),
                              ),
                            ),
                            Config.spaceBox(10.0),
                            Padding(
                              padding: Config.dtHorPad.padding,
                              child: AnimatedShakingBuilder(
                                autoPlay: isDragged,
                                child: const RatingWidget(
                                  rating: 4,
                                  title: 'French',
                                ),
                              ),
                            ),
                            Config.spaceBox(10.0),
                            Padding(
                              padding: Config.dtHorPad.padding,
                              child: AnimatedShakingBuilder(
                                autoPlay: isDragged,
                                child: const RatingWidget(
                                  rating: 3,
                                  title: 'German',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (widget.mode == TemplateMode.shakeEditAndSaveMode)
          AnimateButton(
              onDragged: () => setState(
                    () {
                      _controller.value = Matrix4.identity();
                      isDragged = !isDragged;
                    },
                  ),
              onSave: _save,
              isDragged: isDragged)
      ],
    );
  }
}
