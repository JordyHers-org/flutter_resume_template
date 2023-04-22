import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/components/auto_size_text.dart';
import 'package:flutter_resume_template/src/components/section_shaking.dart';
import 'package:flutter_resume_template/src/utils/strings.dart';
import 'package:flutter_resume_template/src/utils/typedef_utils.dart';

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
            boundaryMargin: EdgeInsets.all(Config.smallWidth),
            maxScale: Config.fourPx,
            child: Align(
              alignment: Alignment.topCenter,
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
                                            fontSize: 17, color: Colors.white),
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
                          child: SizedBox(
                            height: widget.h,
                            width: widget.w,
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
                                                MainAxisAlignment.spaceBetween,
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
                                                MainAxisAlignment.spaceBetween,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                              text:
                                                  widget.data.experiencePeriod,
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
                                              text:
                                                  widget.data.experiencePeriod,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (widget.mode == TemplateMode.shakeEditAndSaveMode)
          Positioned(
            bottom: 20,
            right: 20,
            child: Row(children: [
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    _controller.value = Matrix4.identity();
                    isDragged = !isDragged;
                  });
                },
                style: OutlinedButton.styleFrom(
                    backgroundColor: isDragged
                        ? Colors.grey
                        : Theme.of(context).primaryColor,
                    foregroundColor: Colors.white),
                child: Text(
                  isDragged ? 'Stop Editing' : 'Edit',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.white),
                ),
              ),
              IconButton(
                onPressed: () => _save(),
                icon: const Icon(Icons.download),
              ),
            ]),
          )
      ],
    );
  }
}
