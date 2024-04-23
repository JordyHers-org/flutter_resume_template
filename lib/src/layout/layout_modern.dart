import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/components/section_bottom_buttons.dart';
import 'package:flutter_resume_template/src/components/section_rating_widget.dart';
import 'package:flutter_resume_template/src/components/section_shaking.dart';
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
  LayoutModern({
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
    this.hobbiesPadding,
    this.socialMediaPlaceholder,
    this.imageHeight,
    this.imageWidth,
    this.imageBoxFit,
    this.imageRadius,
    this.height,
    this.width,
    this.backgroundColorLeftSection,
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
  final Color? backgroundColorLeftSection;

  final String? aboutMePlaceholder;
  final String? educationPlaceHolder;
  final String? hobbiesPlaceholder;
  final String? emailPlaceHolder;
  final String? telPlaceHolder;
  final String? experiencePlaceHolder;
  final String? languagePlaceHolder;
  final bool? enableDividers;
  final EdgeInsetsGeometry? hobbiesPadding;
  final Widget? socialMediaPlaceholder;

  final SaveResume<GlobalKey>? onSaveResume;

  @override
  State<LayoutModern> createState() => _LayoutModernState();
}

class _LayoutModernState extends State<LayoutModern> {
  GlobalKey globalKey = GlobalKey();
  late bool enableEditingMode = true;
  late bool isDragged = false;
  late bool absorbing = false;
  late TransformationController _controller;

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
              boundaryMargin: EdgeInsets.all(Config.mediumSpacer),
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
                        height: widget.height ?? widget.h * 1.5,
                        width: widget.width ?? widget.w * 1.05,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: Config.padding.padding,
                                    height: widget.h * 1.2,
                                    color: widget.backgroundColorLeftSection ??
                                        Theme.of(context).primaryColor,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Config.spaceBox(Config.largeSpacer),
                                        AnimatedShakingBuilder(
                                          autoPlay: isDragged,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                widget.imageRadius ?? 100.0),
                                            child: Image.network(
                                              widget.data.image ??
                                                  Str.resumeHeader,
                                              height: widget.imageHeight ?? 100,
                                              width: widget.imageWidth ?? 90,
                                              fit: widget.imageBoxFit ??
                                                  BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                        Config.spaceBox(Config.smallSpacer),
                                        AnimatedShakingBuilder(
                                          autoPlay: isDragged,
                                          child: DisplayText(
                                            maxFontSize: 30,
                                            text: widget.aboutMePlaceholder ??
                                                'ABOUT ME',
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
                                                    fontSize: 12,
                                                    color: Colors.white),
                                          ),
                                        ),
                                        Config.spaceBox(Config.smallSpacer),
                                        if (widget.enableDividers!)
                                          Padding(
                                            padding: Config.padding.padding,
                                            child: const SHDivider(),
                                          )
                                        else
                                          Padding(
                                            padding: Config.padding.padding,
                                          ),
                                        AnimatedShakingBuilder(
                                          autoPlay: isDragged,
                                          child: DisplayText(
                                            maxFontSize: 20,
                                            text: widget.hobbiesPlaceholder ??
                                                'Hobbies',
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
                                              children: widget.data.hobbies !=
                                                      null
                                                  ? List.generate(
                                                      widget
                                                          .data.hobbies!.length,
                                                      (index) => Column(
                                                        children: [
                                                          Padding(
                                                            padding: widget
                                                                    .hobbiesPadding ??
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        8.0),
                                                            child: DisplayText(
                                                              text: widget.data
                                                                      .hobbies?[
                                                                  index],
                                                              maxLines: 10,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleSmall
                                                                  ?.copyWith(
                                                                      fontSize:
                                                                          14),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : [
                                                      Column(
                                                        children: [
                                                          Config.spaceBox(Config
                                                              .smallSpacer),
                                                          DisplayText(
                                                            text: 'Running',
                                                            maxLines: 10,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleSmall,
                                                          ),
                                                          Config.spaceBox(Config
                                                              .smallSpacer),
                                                          DisplayText(
                                                            text: 'Languages',
                                                            maxLines: 10,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleSmall,
                                                          ),
                                                          Config.spaceBox(Config
                                                              .smallSpacer),
                                                          DisplayText(
                                                            text: 'Programming',
                                                            maxLines: 10,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleSmall,
                                                          ),
                                                        ],
                                                      ),
                                                    ]),
                                        ),
                                        Config.spaceBox(Config.largeSpacer),
                                        AnimatedShakingBuilder(
                                          autoPlay: isDragged,
                                          child: widget
                                                  .socialMediaPlaceholder ??
                                              const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Icon(
                                                    Icons.tiktok,
                                                    color: Colors.deepOrange,
                                                    size: 18,
                                                  ),
                                                  Icon(
                                                    Icons.facebook,
                                                    color: Colors.deepOrange,
                                                    size: 18,
                                                  ),
                                                  Icon(
                                                    Icons.telegram,
                                                    color: Colors.deepOrange,
                                                    size: 18,
                                                  ),
                                                  Icon(
                                                    Icons.messenger,
                                                    color: Colors.deepOrange,
                                                    size: 18,
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
                                    height: widget.h * 1.2,
                                    width: widget.w,
                                    child: Padding(
                                      padding: Config.dtHorPad.padding,
                                      child: Wrap(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Config.spaceBox(
                                                  Config.smallSpacer),
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
                                                  text: widget
                                                      .data.currentPosition,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium
                                                      ?.copyWith(
                                                          letterSpacing: 1.2),
                                                ),
                                              ),
                                              Config.spaceBox(
                                                  Config.mediumSpacer),
                                              AnimatedShakingBuilder(
                                                autoPlay: isDragged,
                                                child: SizedBox(
                                                  width: widget.w,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          DisplayText(
                                                            maxFontSize: 16,
                                                            text: widget
                                                                    .emailPlaceHolder ??
                                                                'Email',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headlineLarge
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        14),
                                                          ),
                                                          DisplayText(
                                                            maxFontSize: 16,
                                                            text: widget
                                                                .data.email,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .displaySmall
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        14),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          DisplayText(
                                                            maxFontSize: 16,
                                                            text: widget
                                                                    .telPlaceHolder ??
                                                                'Tel:',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleSmall
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        14),
                                                          ),
                                                          DisplayText(
                                                            maxFontSize: 16,
                                                            text: widget.data
                                                                .phoneNumber,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .displaySmall
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        14),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Config.spaceBox(
                                                  Config.smallSpacer),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  if (widget.enableDividers!)
                                                    const SHDivider(),
                                                ],
                                              ),
                                              Config.spaceBox(
                                                  Config.mediumSpacer),
                                              AnimatedShakingBuilder(
                                                autoPlay: isDragged,
                                                child: DisplayText(
                                                  text: widget
                                                          .experiencePlaceHolder ??
                                                      'Experience',
                                                  maxFontSize: 16,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge
                                                      ?.copyWith(fontSize: 14),
                                                ),
                                              ),
                                              Config.spaceBox(
                                                  Config.smallSpacer),
                                              if (widget.data.experience !=
                                                      null &&
                                                  widget.data.experience!
                                                      .isNotEmpty)
                                                ...List<Widget>.generate(
                                                  widget
                                                      .data.experience!.length,
                                                  (i) => Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AnimatedShakingBuilder(
                                                        autoPlay: isDragged,
                                                        child: SizedBox(
                                                          width: widget.w,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              DisplayText(
                                                                maxFontSize: 16,
                                                                maxLines: 4,
                                                                text: widget
                                                                    .data
                                                                    .experience![
                                                                        i]
                                                                    .experienceTitle,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleSmall
                                                                    ?.copyWith(
                                                                        fontSize:
                                                                            14,
                                                                        letterSpacing:
                                                                            1.2,
                                                                        color: Colors
                                                                            .deepOrange),
                                                              ),
                                                              DisplayText(
                                                                  text: widget
                                                                      .data
                                                                      .experience![
                                                                          i]
                                                                      .experiencePeriod,
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodySmall
                                                                      ?.copyWith(
                                                                          fontSize:
                                                                              13)),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      AnimatedShakingBuilder(
                                                        autoPlay: isDragged,
                                                        child: DisplayText(
                                                          text: widget
                                                              .data
                                                              .experience![i]
                                                              .experienceLocation,
                                                          maxLines: 10,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleSmall
                                                                  ?.copyWith(
                                                                    fontSize:
                                                                        14,
                                                                  ),
                                                        ),
                                                      ),
                                                      Config.spaceBox(
                                                          Config.smallSpacer),
                                                      AnimatedShakingBuilder(
                                                        autoPlay: isDragged,
                                                        child: DisplayText(
                                                          maxFontSize: 14,
                                                          text: widget
                                                              .data
                                                              .experience![i]
                                                              .experienceDescription,
                                                          maxLines: widget
                                                                  .maxLinesExperience ??
                                                              5,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleSmall,
                                                        ),
                                                      ),
                                                      Config.spaceBox(
                                                          Config.mediumSpacer),
                                                    ],
                                                  ),
                                                ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  if (widget.enableDividers!)
                                                    const SHDivider(),
                                                ],
                                              ),
                                              Config.spaceBox(
                                                  Config.mediumSpacer),
                                              AnimatedShakingBuilder(
                                                autoPlay: isDragged,
                                                child: DisplayText(
                                                  text: widget
                                                          .educationPlaceHolder ??
                                                      'Education',
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
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      DisplayText(
                                                        text: widget
                                                                .data
                                                                .educationDetails?[
                                                                    0]
                                                                .schoolName ??
                                                            'University Name ',
                                                        maxLines: 10,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleSmall
                                                            ?.copyWith(
                                                                fontSize: 12),
                                                      ),
                                                      DisplayText(
                                                        text: widget
                                                                .data
                                                                .educationDetails?[
                                                                    0]
                                                                .schoolLevel ??
                                                            'Bachelor Degree',
                                                        maxLines: 10,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall
                                                            ?.copyWith(
                                                                fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Config.spaceBox(
                                                  Config.smallSpacer),
                                              AnimatedShakingBuilder(
                                                autoPlay: isDragged,
                                                child: SizedBox(
                                                  width: widget.w,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      DisplayText(
                                                        text: widget
                                                                .data
                                                                .educationDetails?[
                                                                    0]
                                                                .schoolName ??
                                                            'Yale University',
                                                        maxLines: 10,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleSmall
                                                            ?.copyWith(
                                                                fontSize: 12),
                                                      ),
                                                      DisplayText(
                                                        text: widget
                                                                .data
                                                                .educationDetails?[
                                                                    1]
                                                                .schoolLevel ??
                                                            'Post Graduate',
                                                        maxLines: 10,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall
                                                            ?.copyWith(
                                                                fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Config.spaceBox(
                                                  Config.mediumSpacer),
                                              AnimatedShakingBuilder(
                                                autoPlay: isDragged,
                                                child: DisplayText(
                                                  maxFontSize: 18,
                                                  text: widget
                                                          .languagePlaceHolder ??
                                                      'Languages',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge
                                                      ?.copyWith(
                                                        fontSize: 14,
                                                      ),
                                                ),
                                              ),
                                              Config.spaceBox(Config.eightPx),
                                              if (widget.data.languages != null)
                                                ...List.generate(
                                                    widget
                                                        .data.languages!.length,
                                                    (index) => Column(
                                                          children: [
                                                            AnimatedShakingBuilder(
                                                              autoPlay:
                                                                  isDragged,
                                                              child: SizedBox(
                                                                  width:
                                                                      widget.w,
                                                                  child:
                                                                      RatingWidget(
                                                                    autoplay:
                                                                        isDragged,
                                                                    title: widget
                                                                            .data
                                                                            .languages?[index]
                                                                            .language ??
                                                                        'English',
                                                                    rating: widget
                                                                            .data
                                                                            .languages?[index]
                                                                            .level ??
                                                                        5,
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .titleSmall
                                                                        ?.copyWith(
                                                                            fontSize:
                                                                                13,
                                                                            letterSpacing:
                                                                                0.8,
                                                                            color:
                                                                                Colors.grey),
                                                                  )),
                                                            ),
                                                            Config.spaceBox(
                                                                Config.eightPx),
                                                          ],
                                                        ))
                                              else
                                                AnimatedShakingBuilder(
                                                  autoPlay: isDragged,
                                                  child: SizedBox(
                                                    width: widget.w,
                                                    child: RatingWidget(
                                                      autoplay: isDragged,
                                                      title: 'French',
                                                      rating: 4,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall
                                                          ?.copyWith(
                                                              fontSize: 13,
                                                              letterSpacing:
                                                                  0.8,
                                                              color:
                                                                  Colors.grey),
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
