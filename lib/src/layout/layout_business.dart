import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/components/section_bio_container.dart';
import 'package:flutter_resume_template/src/components/section_bottom_buttons.dart';
import 'package:flutter_resume_template/src/components/section_rating_widget.dart';
import 'package:flutter_resume_template/src/components/section_shaking.dart';
import 'package:flutter_resume_template/src/utils/typedef_utils.dart';

import '../utils/strings.dart';

/// A stateful widget that provides a resume template designed to look like a business curriculum vitae.
///
/// This widget, named LayoutBusiness, can be used to display personal information, work experience, education, and other
/// relevant details in a professional format suitable for job applications and career-oriented websites. The template
/// includes a header section with the user's name and contact information, a summary section highlighting key skills and
/// qualifications, and sections for listing work experience, education, and other achievements.
///
/// The widget is designed to be customizable, with options for adjusting font sizes, colors, and other visual elements to
/// match the user's branding or preferences. It also supports dynamic data binding, allowing users to easily update the
/// content of their resume without needing to modify the underlying widget code.
///
/// To use this widget, simply create an instance of LayoutBusiness and pass in the required parameters. The widget will
/// automatically render the resume template based on the provided data.

class LayoutBusiness extends StatefulWidget {
  LayoutBusiness({
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
  State<LayoutBusiness> createState() => _LayoutBusinessState();
}

class _LayoutBusinessState extends State<LayoutBusiness> {
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
              child: Align(
                alignment: Alignment.topCenter,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Container(
                    color: widget.backgroundColor,
                    height: widget.h < 670 ? widget.h * 1.2 : widget.h * 1.7,
                    width: widget.w < 400 ? widget.w : widget.w * 1.2,
                    constraints: BoxConstraints(
                      minWidth: widget.w < 400 ? widget.w * 1.2 : widget.w * 1,
                      minHeight:
                          widget.h < 670 ? widget.h * 1.2 : widget.h * 0.5,
                      maxHeight: double.maxFinite,
                      maxWidth: double.maxFinite,
                    ),
                    child: RepaintBoundary(
                      key: globalKey,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: SizedBox(
                          height: widget.height ?? widget.h * 2.5,
                          width: widget.width ?? widget.w * 1.6,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Config.tenPx,
                                vertical: Config.threePx),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AnimatedShakingBuilder(
                                          autoPlay: isDragged,
                                          child: DisplayText(
                                            maxFontSize: 20,
                                            text: widget.data.fullName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge,
                                          ),
                                        ),
                                        AnimatedShakingBuilder(
                                          autoPlay: isDragged,
                                          child: DisplayText(
                                            maxFontSize: 14,
                                            text: widget.data.currentPosition,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        AnimatedShakingBuilder(
                                          autoPlay: isDragged,
                                          child: DisplayText(
                                            maxFontSize: 14,
                                            text: widget.data.street,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                        ),
                                        AnimatedShakingBuilder(
                                          autoPlay: isDragged,
                                          child: DisplayText(
                                            maxFontSize: 14,
                                            text: widget.data.address,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                        ),
                                        AnimatedShakingBuilder(
                                          autoPlay: isDragged,
                                          child: DisplayText(
                                            maxFontSize: 14,
                                            text: widget.data.country,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                        ),
                                        AnimatedShakingBuilder(
                                          autoPlay: isDragged,
                                          child: DisplayText(
                                            maxFontSize: 14,
                                            text: widget.data.phoneNumber,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                        ),
                                        AnimatedShakingBuilder(
                                          autoPlay: isDragged,
                                          child: DisplayText(
                                            maxFontSize: 14,
                                            text: widget.data.email,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Config.spaceBox(Config.mediumSpacer),
                                if (widget.enableDividers!) const SHDivider(),
                                Config.spaceBox(Config.smallSpacer),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AnimatedShakingBuilder(
                                      autoPlay: isDragged,
                                      child: SBContainer(
                                        child: DisplayText(
                                          maxFontSize: 16,
                                          text: widget.aboutMePlaceholder ??
                                              'Short bio',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge,
                                        ),
                                      ),
                                    ),
                                    AnimatedShakingBuilder(
                                      autoPlay: isDragged,
                                      child: SBContainer(
                                        child: DisplayText(
                                          text: widget.data.bio,
                                          maxFontSize: 14,
                                          maxLines: 10,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(height: 1.2),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Config.spaceBox(Config.smallSpacer),
                                if (widget.enableDividers!) const SHDivider(),
                                Config.spaceBox(Config.smallSpacer),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AnimatedShakingBuilder(
                                      autoPlay: isDragged,
                                      child: DisplayText(
                                        maxFontSize: 16,
                                        text: widget.experiencePlaceHolder ??
                                            'Work Experience',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                      ),
                                    ),
                                    if (widget.data.experience != null &&
                                        widget.data.experience!.isNotEmpty)
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: List<Widget>.generate(
                                              widget.data.experience!.length,
                                              (index) => Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AnimatedShakingBuilder(
                                                        autoPlay: isDragged,
                                                        child: DisplayText(
                                                          maxFontSize: 16,
                                                          text: widget
                                                              .data
                                                              .experience![
                                                                  index]
                                                              .experienceTitle,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .displayLarge,
                                                        ),
                                                      ),
                                                      Config.spaceBox(
                                                          Config.fourPx),
                                                      AnimatedShakingBuilder(
                                                        autoPlay: isDragged,
                                                        child: DisplayText(
                                                          maxFontSize: 14,
                                                          text: widget
                                                              .data
                                                              .experience![
                                                                  index]
                                                              .experienceLocation,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .displayLarge,
                                                        ),
                                                      ),
                                                      Config.spaceBox(
                                                          Config.eightPx),
                                                      AnimatedShakingBuilder(
                                                        autoPlay: isDragged,
                                                        child: DisplayText(
                                                          maxFontSize: 14,
                                                          text: widget
                                                              .data
                                                              .experience![
                                                                  index]
                                                              .experiencePeriod,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall,
                                                        ),
                                                      ),
                                                      AnimatedShakingBuilder(
                                                        autoPlay: isDragged,
                                                        child: DisplayText(
                                                          maxFontSize: 14,
                                                          maxLines: widget
                                                                  .maxLinesExperience ??
                                                              10,
                                                          text: widget
                                                              .data
                                                              .experience![
                                                                  index]
                                                              .experienceLocation,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall,
                                                        ),
                                                      ),
                                                      Config.spaceBox(
                                                          Config.tenPx),
                                                      AnimatedShakingBuilder(
                                                        autoPlay: isDragged,
                                                        child: SBContainer(
                                                          child: DisplayText(
                                                            text: widget
                                                                .data
                                                                .experience![
                                                                    index]
                                                                .experienceDescription,
                                                            maxLines: 15,
                                                            minFontSize: 16,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleMedium
                                                                ?.copyWith(
                                                                    height:
                                                                        1.2),
                                                          ),
                                                        ),
                                                      ),
                                                      Config.spaceBox(
                                                          Config.fortyPx),
                                                    ],
                                                  ))),
                                  ],
                                ),
                                Config.spaceBox(Config.smallSpacer),
                                if (widget.enableDividers!) const SHDivider(),
                                Config.spaceBox(Config.smallSpacer),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AnimatedShakingBuilder(
                                      autoPlay: isDragged,
                                      child: DisplayText(
                                        maxFontSize: 16,
                                        text: widget.educationPlaceHolder ??
                                            'Education',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                      ),
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: List.generate(
                                            widget
                                                .data.educationDetails!.length,
                                            (index) => Column(
                                                  children: [
                                                    AnimatedShakingBuilder(
                                                      autoPlay: isDragged,
                                                      child: SBContainer(
                                                        child: DisplayText(
                                                          maxFontSize: 14,
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
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .displayLarge,
                                                        ),
                                                      ),
                                                    ),
                                                    Config.spaceBox(
                                                        Config.threePx),
                                                    AnimatedShakingBuilder(
                                                      autoPlay: isDragged,
                                                      child: SBContainer(
                                                        child: DisplayText(
                                                          text: widget
                                                              .data
                                                              .educationDetails?[
                                                                  index]
                                                              .schoolLevel,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleSmall,
                                                        ),
                                                      ),
                                                    ),
                                                    Config.spaceBox(
                                                        Config.smallSpacer),
                                                  ],
                                                )))
                                  ],
                                ),
                                Config.spaceBox(Config.smallSpacer),
                                if (widget.enableDividers!) const SHDivider(),
                                Config.spaceBox(Config.smallSpacer),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    AnimatedShakingBuilder(
                                      autoPlay: isDragged,
                                      child: DisplayText(
                                        maxFontSize: 16,
                                        text: widget.languagePlaceHolder ??
                                            'Languages',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                      ),
                                    ),
                                  ],
                                ),
                                if (widget.data.languages != null)
                                  ...List.generate(
                                      widget.data.languages!.length,
                                      (index) => Column(
                                            children: [
                                              Config.spaceBox(Config.eightPx),
                                              RatingWidget(
                                                rating: widget.data
                                                    .languages![index].level,
                                                title: widget.data
                                                    .languages![index].language,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall
                                                    ?.copyWith(fontSize: 15),
                                                autoplay: isDragged,
                                              ),
                                              Config.spaceBox(Config.eightPx),
                                            ],
                                          ))
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
