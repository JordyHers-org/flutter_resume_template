import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/components/section_bottom_buttons.dart';
import 'package:flutter_resume_template/src/components/section_rating_widget.dart';
import 'package:flutter_resume_template/src/components/section_shaking.dart';
import 'package:flutter_resume_template/src/utils/helper.dart';
import 'package:flutter_resume_template/src/utils/strings.dart';
import 'package:flutter_resume_template/src/utils/typedef_utils.dart';

/// A stateful widget that provides a classic-style layout for displaying content.
///
/// This widget, named LayoutClassic, is designed to display text, images, and other content in a simple, elegant format.
/// The template includes a header section with a title and subtitle, a main content area, and a footer section for
/// additional information or navigation links.
///
/// The widget is customizable, with options for adjusting font sizes, colors, and other visual elements to match the
/// user's branding or preferences. It also supports dynamic data binding, allowing users to easily update the content of
/// their layout without needing to modify the underlying widget code.
///
/// To use this widget, simply create an instance of LayoutClassic and pass in the required parameters. The widget will
/// automatically render the classic-style layout based on the provided data.

class LayoutClassic extends StatefulWidget {
  const LayoutClassic({
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
  State<LayoutClassic> createState() => _LayoutClassicState();
}

class _LayoutClassicState extends State<LayoutClassic> {
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
                  margin: Config.margin,
                  height: widget.h < 670 ? widget.h * 1.2 : widget.h * 1.05,
                  width: widget.w < 400 ? widget.w : widget.w * 0.2,
                  constraints: BoxConstraints(
                    minWidth: widget.w < 400 ? widget.w * 1.2 : widget.w * 1,
                    minHeight: widget.h < 670 ? widget.h * 1.2 : widget.h * 0.5,
                    maxHeight: double.maxFinite,
                    maxWidth: double.maxFinite,
                  ),
                  child: RepaintBoundary(
                    key: globalKey,
                    child: Wrap(
                      children: [
                        if (Helper.isTestMode)
                          Container(
                            height: Config.smallHeight,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(Str.backgroundImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedShakingBuilder(
                              autoPlay: isDragged,
                              child: DisplayText(
                                text: widget.data.fullName,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(
                                        letterSpacing: 1,
                                        color: Theme.of(context).primaryColor),
                              ),
                            ),
                            Config.spaceBox(Config.tenPx),
                            AnimatedShakingBuilder(
                              autoPlay: isDragged,
                              child: DisplayText(
                                text: widget.data.email,
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                            Config.spaceBox(Config.tenPx),
                            AnimatedShakingBuilder(
                              autoPlay: isDragged,
                              child: DisplayText(
                                maxFontSize: 16,
                                text:
                                    '${widget.data.street}, ${widget.data.address}',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            Config.spaceBox(Config.mediumSpacer),
                            AnimatedShakingBuilder(
                              autoPlay: isDragged,
                              child: DisplayText(
                                text: 'About Me',
                                maxFontSize: 20,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(letterSpacing: 1),
                              ),
                            ),
                            Config.spaceBox(Config.tenPx),
                            AnimatedShakingBuilder(
                              autoPlay: isDragged,
                              child: DisplayText(
                                text: widget.data.bio,
                                maxFontSize: 16,
                                maxLines: 20,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                            Config.spaceBox(Config.mediumSpacer),
                            AnimatedShakingBuilder(
                              autoPlay: isDragged,
                              child: DisplayText(
                                text: 'Hobbies',
                                maxFontSize: 20,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(letterSpacing: 1),
                              ),
                            ),
                            Config.spaceBox(Config.tenPx),
                            AnimatedShakingBuilder(
                              autoPlay: isDragged,
                              child: DisplayText(
                                maxFontSize: 16,
                                text: 'Playing football',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                            Config.spaceBox(Config.mediumSpacer),
                            AnimatedShakingBuilder(
                              autoPlay: isDragged,
                              child: DisplayText(
                                maxFontSize: 20,
                                text: 'Work Experience',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(letterSpacing: 1),
                              ),
                            ),
                            Config.spaceBox(Config.eightPx),
                            AnimatedShakingBuilder(
                              autoPlay: isDragged,
                              child: DisplayText(
                                maxFontSize: 16,
                                text: widget.data.experience.first.experienceDescription,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                            Config.spaceBox(Config.mediumSpacer),
                            AnimatedShakingBuilder(
                              autoPlay: isDragged,
                              child: DisplayText(
                                maxFontSize: 20,
                                text: 'Education',
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                            ),
                            Config.spaceBox(Config.eightPx),
                            AnimatedShakingBuilder(
                              autoPlay: isDragged,
                              child: DisplayText(
                                maxFontSize: 16,
                                text: widget.data.education,
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                            Config.spaceBox(Config.mediumSpacer),
                            AnimatedShakingBuilder(
                              autoPlay: isDragged,
                              child: DisplayText(
                                maxFontSize: 20,
                                text: 'Languages',
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                            ),
                            Config.spaceBox(Config.eightPx),
                            AnimatedShakingBuilder(
                              autoPlay: isDragged,
                              child: RatingWidget(
                                title: 'English',
                                rating: 5,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
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
