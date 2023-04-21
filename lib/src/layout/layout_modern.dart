import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/components/auto_size_text.dart';
import 'package:flutter_resume_template/src/components/section_shaking.dart';
import 'package:flutter_resume_template/src/repository/pdf_saver.dart';
import 'package:flutter_resume_template/src/utils/strings.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

class LayoutModern extends StatefulWidget {
  const LayoutModern({
    super.key,
    this.withButtons,
    required this.data,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;
  final TemplateData data;
  final bool? withButtons;

  @override
  State<LayoutModern> createState() => _LayoutModernState();
}

class _LayoutModernState extends State<LayoutModern> {
  GlobalKey globalKey = GlobalKey();

  final shakingConstant = ShakeSlowConstant1();

  bool enableEditingMode = true;

  bool isButtonVisible = true;

  bool isDragged = false;

  late TransformationController _controller;

  @override
  void initState() {
    _controller = TransformationController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AbsorbPointer(
          absorbing: enableEditingMode && !isDragged,
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
                  alignment: Alignment.centerRight,
                  height: widget.h < 670 ? widget.h * 1.2 : widget.h * 1.05,
                  width: widget.w < 400 ? widget.w : widget.w * 0.8,
                  margin: Config.margin,
                  constraints: BoxConstraints(
                    minWidth: widget.w < 400 ? widget.w * 1.2 : widget.w * 1,
                    minHeight: widget.h < 670 ? widget.h * 1.2 : widget.h * 0.9,
                  ),
                  decoration: Config.decoration(context),
                  child: RepaintBoundary(
                      key: globalKey,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: Config.margin,
                              padding: Config.padding.padding,
                              height: widget.h,
                              color: Theme.of(context).primaryColor,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Config.spaceBox(Config.largeSpacer),
                                  AnimatedShakingBuilder(
                                    autoPlay: isDragged,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
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
                                      maxLines: 25,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                              fontSize: 17,
                                              color: Colors.white),
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
                                      text: 'Hobbies',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
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
                            child: Container(
                              height: widget.h,
                              width: widget.w,
                              color: Colors.white,
                              child: Padding(
                                padding: Config.dtHorPad.padding,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Config.spaceBox(Config.largeSpacer),
                                    AnimatedShakingBuilder(
                                      autoPlay: isDragged,
                                      child: DisplayText(
                                        text: widget.data.fullName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge,
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
                                    Config.spaceBox(Config.largeSpacer),
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
                                                  text: 'Email',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge,
                                                ),
                                                DisplayText(
                                                  text: widget.data.email,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall,
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
                                                  text: 'Tel:',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                                DisplayText(
                                                  text: widget.data.phoneNumber,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displaySmall,
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge,
                                      ),
                                    ),
                                    Config.spaceBox(Config.smallSpacer),
                                    AnimatedShakingBuilder(
                                      autoPlay: isDragged,
                                      child: SizedBox(
                                        width: widget.w,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            DisplayText(
                                              text: widget.data.experienceTitle,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(
                                                      letterSpacing: 1.2,
                                                      color: Colors.deepOrange),
                                            ),
                                            DisplayText(
                                                text: widget
                                                    .data.experiencePeriod,
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
                                        text: widget.data.experienceLocation,
                                        maxLines: 10,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ),
                                    Config.spaceBox(Config.smallSpacer),
                                    AnimatedShakingBuilder(
                                      autoPlay: isDragged,
                                      child: DisplayText(
                                        text: widget.data.experienceDescription,
                                        maxLines: 14,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ),
                                    Config.spaceBox(Config.mediumSpacer),
                                    AnimatedShakingBuilder(
                                      autoPlay: isDragged,
                                      child: SizedBox(
                                        width: widget.w,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            DisplayText(
                                              text: widget.data.experienceTitle,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(
                                                      letterSpacing: 1.2,
                                                      color: Colors.deepOrange),
                                            ),
                                            DisplayText(
                                                text: widget
                                                    .data.experiencePeriod,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall),
                                          ],
                                        ),
                                      ),
                                    ),
                                    AnimatedShakingBuilder(
                                      autoPlay: isDragged,
                                      child: DisplayText(
                                        text: widget.data.experienceLocation,
                                        maxLines: 10,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ),
                                    Config.spaceBox(Config.smallSpacer),
                                    AnimatedShakingBuilder(
                                      autoPlay: isDragged,
                                      child: DisplayText(
                                        text: widget.data.experienceDescription,
                                        maxLines: 10,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ),
                                    Config.spaceBox(Config.mediumSpacer),
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
                                            .headlineLarge,
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
                                              text: widget.data.education,
                                              maxLines: 10,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                            DisplayText(
                                              text: 'Bachelor Degree',
                                              maxLines: 10,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ),
        ),
        if (widget.withButtons ?? false)
          Visibility(
            visible: isButtonVisible,
            child: Positioned(
              bottom: 20,
              right: 20,
              child: Row(
                children: [
                  OutlinedButton(
                    onPressed: () => setState(() {
                      enableEditingMode = !enableEditingMode;
                      if (enableEditingMode) {
                        _controller.value = Matrix4.identity();
                      }
                    }),
                    style: !enableEditingMode
                        ? OutlinedButton.styleFrom(backgroundColor: Colors.grey)
                        : null,
                    child: Text(
                      enableEditingMode ? 'Edit template' : 'Editing ...',
                      style: enableEditingMode
                          ? Theme.of(context).textTheme.titleSmall
                          : Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: Config.tenPx),
                  enableEditingMode
                      ? OutlinedButton(
                          onPressed: () async {
                            setState(() {
                              isButtonVisible = false;
                            });
                            await Future.delayed(
                                    const Duration(milliseconds: 300))
                                .then((value) => PdfHandler()
                                    .createResume(globalKey)
                                    .whenComplete(() => setState(() {
                                          isButtonVisible = true;
                                        })));
                          },
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white),
                          child: Text(
                            'Download CV ',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: Colors.white),
                          ),
                        )
                      : const SizedBox.shrink(),
                  enableEditingMode
                      ? IconButton(
                          onPressed: () async {
                            setState(() {
                              isDragged = !isDragged;
                            });
                          },
                          icon: const Icon(Icons.drag_indicator),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
