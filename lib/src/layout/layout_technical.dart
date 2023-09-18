import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/components/section_bottom_buttons.dart';
import 'package:flutter_resume_template/src/components/section_shaking.dart';
import 'package:flutter_resume_template/src/utils/strings.dart';
import 'package:flutter_resume_template/src/utils/typedef_utils.dart';

import '../components/section_rating_widget.dart';

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
  LayoutTechnical({
    super.key,
    required this.showButtons,
    required this.mode,
    required this.data,
    required this.h,
    required this.w,
    this.backgroundColor,
    this.maxLinesExperience,
    this.onSaveResume,
    this.aboutMePlaceholder,
    this.hobbiesPlaceholder,
    this.emailPlaceHolder,
    this.telPlaceHolder,
    this.experiencePlaceHolder,
    this.educationPlaceHolder,
    this.languagePlaceHolder,
    this.enableDividers = true,
    this.imageHeight,
    this.imageWidth,
    this.imageBoxFit,
    this.imageRadius,
    this.height,
    this.width,
  })  : assert(data.experience != null && data.experience!.length <= 4),
        assert(data.educationDetails != null &&
            data.educationDetails!.length <= 2),
        assert(data.languages != null && data.languages!.length <= 5);

  final double h;
  final double w;

  final double? height;
  final double? width;

  final bool showButtons;

  final int? maxLinesExperience;
  final double? imageHeight;
  final double? imageWidth;
  final double? imageRadius;
  final BoxFit? imageBoxFit;

  final TemplateData data;
  final TemplateMode mode;
  final Color? backgroundColor;

  final String? aboutMePlaceholder;
  final String? educationPlaceHolder;
  final String? hobbiesPlaceholder;
  final String? emailPlaceHolder;
  final String? telPlaceHolder;
  final String? experiencePlaceHolder;
  final String? languagePlaceHolder;
  final bool? enableDividers;

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
        isDragged = true;
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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Stack(
        children: [
          AbsorbPointer(
            absorbing: absorbing,
            child: InteractiveViewer(
              transformationController: _controller,
              panEnabled: false,
              boundaryMargin: EdgeInsets.all(Config.smallWidth),
              maxScale: Config.fourPx,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  color: widget.backgroundColor,
                  height: widget.h < 670 ? widget.h * 1.2 : widget.h * 1.7,
                  width: widget.w < 400 ? widget.w : widget.w * 1.2,
                  constraints: BoxConstraints(
                    minWidth: widget.w < 400 ? widget.w * 1.2 : widget.w * 1,
                    minHeight: widget.h < 670 ? widget.h * 1.2 : widget.h * 0.5,
                    maxHeight: double.maxFinite,
                    maxWidth: double.maxFinite,
                  ),
                  child: RepaintBoundary(
                    key: globalKey,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: SizedBox(
                        height: widget.height ?? widget.h * 2.9,
                        width: widget.width ?? widget.w * 1.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      widget.data.backgroundImage ??
                                          Str.backgroundImage),
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
                                        widget.data.image ?? Str.resumeHeader),
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
                                    child: DisplayText(
                                      text: widget.experiencePlaceHolder ??
                                          "Work Experience",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.blueGrey,
                                        letterSpacing: 1.5,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  AnimatedShakingBuilder(
                                    autoPlay: isDragged,
                                    child: DisplayText(
                                      text: widget.educationPlaceHolder ??
                                          "Education",
                                      style: const TextStyle(
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
                                  if (widget.data.experience != null &&
                                      widget.data.experience!.isNotEmpty)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ...List.generate(
                                          widget.data.experience!.length,
                                          (index) => Column(
                                            children: [
                                              AnimatedShakingBuilder(
                                                autoPlay: isDragged,
                                                child: DisplayText(
                                                  text: widget
                                                          .data
                                                          .experience?[index]
                                                          .experienceTitle ??
                                                      Str
                                                          .mockData
                                                          .experience?[index]
                                                          .experienceTitle,
                                                  style: const TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.black54,
                                                    letterSpacing: 1.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                              Config.spaceBox(Config.tenPx),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  if (widget.data.educationDetails != null &&
                                      widget.data.educationDetails!.isNotEmpty)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ...List.generate(
                                          widget.data.educationDetails!.length,
                                          (index) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Config.spaceBox(Config.tenPx),
                                              AnimatedShakingBuilder(
                                                autoPlay: isDragged,
                                                child: DisplayText(
                                                  text: widget
                                                          .data
                                                          .educationDetails?[
                                                              index]
                                                          .schoolName ??
                                                      Str
                                                          .mockData
                                                          .educationDetails?[
                                                              index]
                                                          .schoolName,
                                                  style: const TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                              Config.spaceBox(Config.tenPx),
                                              AnimatedShakingBuilder(
                                                autoPlay: isDragged,
                                                child: DisplayText(
                                                  text: widget
                                                          .data
                                                          .educationDetails?[
                                                              index]
                                                          .schoolLevel ??
                                                      Str
                                                          .mockData
                                                          .educationDetails?[
                                                              index]
                                                          .schoolLevel,
                                                  style: const TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                            Config.spaceBox(30.0),
                            Padding(
                              padding: Config.dtHorPad.padding,
                              child: AnimatedShakingBuilder(
                                autoPlay: isDragged,
                                child: DisplayText(
                                  text: widget.aboutMePlaceholder ?? "About Me",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.blueGrey,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Config.spaceBox(Config.tenPx),
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
                            Config.spaceBox(Config.fortyPx),
                            Padding(
                              padding: Config.dtHorPad.padding,
                              child: AnimatedShakingBuilder(
                                autoPlay: isDragged,
                                child: DisplayText(
                                  text: widget.hobbiesPlaceholder ?? "Hobbies",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.blueGrey,
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Config.spaceBox(Config.tenPx),
                            if (widget.data.hobbies != null &&
                                widget.data.hobbies!.isNotEmpty)
                              ...List.generate(
                                widget.data.hobbies!.length,
                                (index) => Padding(
                                  padding: Config.dtHorPad.padding,
                                  child: AnimatedShakingBuilder(
                                    autoPlay: isDragged,
                                    child: DisplayText(
                                      text: widget.data.hobbies![index],
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black54,
                                        letterSpacing: 1.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            Config.spaceBox(Config.fortyPx),
                            Padding(
                              padding: Config.dtHorPad.padding,
                              child: AnimatedShakingBuilder(
                                autoPlay: isDragged,
                                child: DisplayText(
                                  text:
                                      widget.languagePlaceHolder ?? "Languages",
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.blueGrey,
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Config.spaceBox(Config.tenPx),
                            if (widget.data.languages != null &&
                                widget.data.languages!.isNotEmpty)
                              ...List.generate(
                                widget.data.languages!.length,
                                (index) => Column(
                                  children: [
                                    Padding(
                                      padding: Config.dtHorPad.padding,
                                      child: AnimatedShakingBuilder(
                                        autoPlay: isDragged,
                                        child: RatingWidget(
                                          autoplay: isDragged,
                                          rating: widget
                                              .data.languages![index].level,
                                          title: widget
                                              .data.languages![index].language,
                                        ),
                                      ),
                                    ),
                                    Config.spaceBox(Config.tenPx),
                                  ],
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
          if (widget.mode == TemplateMode.shakeEditAndSaveMode)
            Visibility(
              visible: widget.showButtons,
              child: AnimateButton(
                  onDragged: () => setState(
                        () {
                          _controller.value = Matrix4.identity();
                          isDragged = !isDragged;
                        },
                      ),
                  onSave: _save,
                  isDragged: isDragged),
            )
        ],
      ),
    );
  }
}
