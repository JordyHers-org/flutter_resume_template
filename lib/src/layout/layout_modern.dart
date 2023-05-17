import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/components/section_bottom_buttons.dart';
import 'package:flutter_resume_template/src/components/section_rating_widget.dart';
import 'package:flutter_resume_template/src/components/section_shaking.dart';
import 'package:flutter_resume_template/src/utils/helper.dart';
import 'package:flutter_resume_template/src/utils/strings.dart';
import 'package:flutter_resume_template/src/utils/typedef_utils.dart';

/// A stateful widget that provides a modern-style layout for displaying content.
///
/// This widget, named LayoutModern, is designed to display text, images, and other content in a clean, minimalist format.
/// The template includes a hero section with a large background image or video, a main content area for displaying
/// additional content, and a footer section for additional information or navigation links.
///
/// The widget is customizable, with options for adjusting font sizes, colors, and other visual elements to match the
/// user's branding or preferences. It also supports dynamic data binding, allowing users to easily update the content of
/// their layout without needing to modify the underlying widget code.
///
/// To use this widget, simply create an instance of LayoutModern and pass in the required parameters. The widget will
/// automatically render the modern-style layout based on the provided data.

class LayoutModern extends StatefulWidget {
  const LayoutModern({
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
  State<LayoutModern> createState() => _LayoutModernState();
}

class _LayoutModernState extends State<LayoutModern> {
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
            boundaryMargin: EdgeInsets.all(Config.mediumSpacer),
            maxScale: Config.fourPx,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Container(
                height: widget.h < 670 ? widget.h * 1.2 : widget.h * 1.05,
                width: widget.w < 400 ? widget.w : widget.w * 0.9,
                constraints: BoxConstraints(
                  minWidth: widget.w < 400 ? widget.w * 1.2 : widget.w * 1.1,
                  minHeight: widget.h < 670 ? widget.h * 1.2 : widget.h * 0.9,
                ),
                child: RepaintBoundary(
                  key: globalKey,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: Config.padding.padding,
                          height: widget.h,
                          color: Theme.of(context).primaryColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Config.spaceBox(Config.largeSpacer),
                              if (Helper.isTestMode)
                                AnimatedShakingBuilder(
                                  autoPlay: isDragged,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.network(
                                      widget.data.image ?? Str.resumeHeader,
                                      height: 100,
                                      width: 90,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              Config.spaceBox(Config.smallSpacer),
                              AnimatedShakingBuilder(
                                autoPlay: isDragged,
                                child: DisplayText(
                                  maxFontSize: 30,
                                  text: 'ABOUT ME',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.copyWith(
                                        letterSpacing: 1.2,
                                        color: Colors.deepOrange,
                                      ),
                                ),
                              ),
                              Config.spaceBox(Config.smallSpacer),
                              AnimatedShakingBuilder(
                                autoPlay: isDragged,
                                child: DisplayText(
                                  text: widget.data.bio,
                                  maxFontSize: 15,
                                  maxLines: 25,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          fontSize: 12, color: Colors.white),
                                ),
                              ),
                              Config.spaceBox(Config.smallSpacer),
                              Padding(
                                padding: Config.padding.padding,
                                child: const SHDivider(),
                              ),
                              AnimatedShakingBuilder(
                                autoPlay: isDragged,
                                child: DisplayText(
                                  maxFontSize: 20,
                                  text: 'Hobbies',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(fontSize: 17),
                                ),
                              ),
                              AnimatedShakingBuilder(
                                autoPlay: isDragged,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Config.spaceBox(Config.smallSpacer),
                                    DisplayText(
                                      text: 'Running',
                                      maxLines: 10,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    Config.spaceBox(Config.smallSpacer),
                                    DisplayText(
                                      text: 'Languages',
                                      maxLines: 10,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    Config.spaceBox(Config.smallSpacer),
                                    DisplayText(
                                      text: 'Programming',
                                      maxLines: 10,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: SizedBox(
                          height: widget.h,
                          width: widget.w,
                          child: Padding(
                            padding: Config.dtHorPad.padding,
                            child: Wrap(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Config.spaceBox(Config.smallSpacer),
                                    AnimatedShakingBuilder(
                                      autoPlay: isDragged,
                                      child: DisplayText(
                                        maxFontSize: 20,
                                        text: widget.data.fullName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge
                                            ?.copyWith(
                                              letterSpacing: 1.2,
                                              fontSize: 18,
                                            ),
                                      ),
                                    ),
                                    Config.spaceBox(Config.fourPx),
                                    AnimatedShakingBuilder(
                                      autoPlay: isDragged,
                                      child: DisplayText(
                                        text: widget.data.currentPosition,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(letterSpacing: 1.2),
                                      ),
                                    ),
                                    Config.spaceBox(Config.mediumSpacer),
                                    AnimatedShakingBuilder(
                                      autoPlay: isDragged,
                                      child: SizedBox(
                                        width: widget.w,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                DisplayText(
                                                  maxFontSize: 16,
                                                  text: 'Email',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge
                                                      ?.copyWith(fontSize: 14),
                                                ),
                                                DisplayText(
                                                  maxFontSize: 16,
                                                  text: widget.data.email,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall
                                                      ?.copyWith(fontSize: 14),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                DisplayText(
                                                  maxFontSize: 16,
                                                  text: 'Tel:',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall
                                                      ?.copyWith(fontSize: 14),
                                                ),
                                                DisplayText(
                                                  maxFontSize: 16,
                                                  text: widget.data.phoneNumber,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall
                                                      ?.copyWith(fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Config.spaceBox(Config.smallSpacer),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        SHDivider(),
                                      ],
                                    ),
                                    Config.spaceBox(Config.mediumSpacer),
                                    AnimatedShakingBuilder(
                                      autoPlay: isDragged,
                                      child: DisplayText(
                                        text: 'Experience',
                                        maxFontSize: 16,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge
                                            ?.copyWith(fontSize: 14),
                                      ),
                                    ),
                                    Config.spaceBox(Config.smallSpacer),
                                    for(int i=0;i<widget.data.experience.length;i++)
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        AnimatedShakingBuilder(
                                          autoPlay: isDragged,
                                          child: SizedBox(
                                            width: widget.w,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                DisplayText(
                                                  maxFontSize: 16,
                                                  text: widget.data.experience[i].experienceTitle,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall
                                                      ?.copyWith(
                                                      fontSize: 14,
                                                      letterSpacing: 1.2,
                                                      color: Colors.deepOrange),
                                                ),
                                                DisplayText(
                                                    text: widget
                                                        .data.experience[i].experiencePeriod,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall
                                                        ?.copyWith(fontSize: 13)),
                                              ],
                                            ),
                                          ),
                                        ),
                                        AnimatedShakingBuilder(
                                          autoPlay: isDragged,
                                          child: DisplayText(
                                            text: widget.data.experience[i].experienceLocation,
                                            maxLines: 10,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                                ?.copyWith(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Config.spaceBox(Config.smallSpacer),
                                        AnimatedShakingBuilder(
                                          autoPlay: isDragged,
                                          child: DisplayText(
                                            maxFontSize: 14,
                                            text: widget.data.experience[i].experienceDescription,
                                            maxLines: 20,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                        ),
                                        Config.spaceBox(Config.mediumSpacer),
                                      ],
                                    ),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        SHDivider(),
                                      ],
                                    ),
                                    Config.spaceBox(Config.mediumSpacer),
                                    AnimatedShakingBuilder(
                                      autoPlay: isDragged,
                                      child: DisplayText(
                                        text: 'Education',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge
                                            ?.copyWith(fontSize: 14),
                                      ),
                                    ),
                                    Config.spaceBox(Config.eightPx),
                                    AnimatedShakingBuilder(
                                      autoPlay: isDragged,
                                      child: SizedBox(
                                        width: widget.w,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            DisplayText(
                                              text: widget.data.education,
                                              maxLines: 10,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(fontSize: 12),
                                            ),
                                            DisplayText(
                                              text: 'Bachelor Degree',
                                              maxLines: 10,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Config.spaceBox(Config.smallSpacer),
                                    AnimatedShakingBuilder(
                                      autoPlay: isDragged,
                                      child: SizedBox(
                                        width: widget.w,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            DisplayText(
                                              text: 'Yale University',
                                              maxLines: 10,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(fontSize: 12),
                                            ),
                                            DisplayText(
                                              text: 'Post Graduate',
                                              maxLines: 10,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Config.spaceBox(Config.mediumSpacer),
                                    AnimatedShakingBuilder(
                                      autoPlay: isDragged,
                                      child: DisplayText(
                                        maxFontSize: 18,
                                        text: 'Languages',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge
                                            ?.copyWith(
                                              fontSize: 14,
                                            ),
                                      ),
                                    ),
                                    Config.spaceBox(Config.eightPx),
                                    AnimatedShakingBuilder(
                                      autoPlay: isDragged,
                                      child: SizedBox(
                                          width: widget.w,
                                          child: RatingWidget(
                                            title: 'English',
                                            rating: 5,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                                ?.copyWith(
                                                    fontSize: 13,
                                                    letterSpacing: 0.8,
                                                    color: Colors.grey),
                                          )),
                                    ),
                                    Config.spaceBox(Config.eightPx),
                                    AnimatedShakingBuilder(
                                      autoPlay: isDragged,
                                      child: SizedBox(
                                        width: widget.w,
                                        child: RatingWidget(
                                          title: 'French',
                                          rating: 4,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                  fontSize: 13,
                                                  letterSpacing: 0.8,
                                                  color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
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
