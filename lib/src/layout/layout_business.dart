import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/components/auto_size_text.dart';
import 'package:flutter_resume_template/src/components/section_bio_container.dart';
import 'package:flutter_resume_template/src/components/section_shaking.dart';
import 'package:flutter_resume_template/src/repository/pdf_saver.dart';

class LayoutBusiness extends StatefulWidget {
  const LayoutBusiness({
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
  State<LayoutBusiness> createState() => _LayoutBusinessState();
}

class _LayoutBusinessState extends State<LayoutBusiness> {
  GlobalKey globalKey = GlobalKey();

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
                  width: widget.w < 400 ? widget.w : widget.w * 0.2,
                  margin: Config.margin,
                  constraints: BoxConstraints(
                    minWidth: widget.w < 400 ? widget.w * 1.2 : widget.w * 1,
                    minHeight: widget.h < 670 ? widget.h * 1.2 : widget.h * 0.5,
                    maxHeight: double.maxFinite,
                    maxWidth: double.maxFinite,
                  ),
                  decoration: Config.decoration(context, color: Colors.white),
                  child: RepaintBoundary(
                    key: globalKey,
                    child: Stack(
                      children: [
                        //Header top left
                        Positioned(
                          top: 30,
                          left: 30,
                          child: AnimatedShakingBuilder(
                            autoPlay: isDragged,
                            child: DisplayText(
                              text: widget.data.fullName,
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 30,
                          child: AnimatedShakingBuilder(
                            autoPlay: isDragged,
                            child: DisplayText(
                              text: widget.data.currentPosition,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),

                        Positioned(
                          top: 10,
                          right: 30,
                          child: AnimatedShakingBuilder(
                            autoPlay: isDragged,
                            child: DisplayText(
                              text: widget.data.street,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 30,
                          right: 30,
                          child: AnimatedShakingBuilder(
                            autoPlay: isDragged,
                            child: DisplayText(
                              text: widget.data.address,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          right: 30,
                          child: AnimatedShakingBuilder(
                            autoPlay: isDragged,
                            child: DisplayText(
                              text: widget.data.country,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 80,
                          right: 30,
                          child: AnimatedShakingBuilder(
                            autoPlay: isDragged,
                            child: DisplayText(
                              text: widget.data.phoneNumber,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 100,
                          right: 30,
                          child: AnimatedShakingBuilder(
                            autoPlay: isDragged,
                            child: DisplayText(
                              text: widget.data.email,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ),

                        const Positioned(
                          top: 130,
                          left: 30,
                          right: 30,
                          child: SHDivider(),
                        ),

                        Positioned(
                          top: 150,
                          left: 30,
                          child: AnimatedShakingBuilder(
                            autoPlay: isDragged,
                            child: SBContainer(
                              child: DisplayText(
                                text: 'Short bio',
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          top: 150,
                          right: 30,
                          child: AnimatedShakingBuilder(
                            autoPlay: isDragged,
                            child: SBContainer(
                              child: DisplayText(
                                text: widget.data.bio,
                                maxLines: 20,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(height: 1.2),
                              ),
                            ),
                          ),
                        ),

                        const Positioned(
                          top: 350,
                          left: 30,
                          right: 30,
                          child: SHDivider(),
                        ),
                        Positioned(
                          top: 370,
                          left: 30,
                          child: AnimatedShakingBuilder(
                            autoPlay: isDragged,
                            child: DisplayText(
                              text: 'Work Experience',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 370,
                          right: 130,
                          child: AnimatedShakingBuilder(
                            autoPlay: isDragged,
                            child: SBContainer(
                              child: DisplayText(
                                text: widget.data.experienceTitle,
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 390,
                          right: 130,
                          child: AnimatedShakingBuilder(
                            autoPlay: isDragged,
                            child: SBContainer(
                              child: DisplayText(
                                text: widget.data.experienceLocation,
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 410,
                          right: 130,
                          child: AnimatedShakingBuilder(
                            autoPlay: isDragged,
                            child: SBContainer(
                              child: DisplayText(
                                text: widget.data.experiencePeriod,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 430,
                          right: 130,
                          child: AnimatedShakingBuilder(
                            autoPlay: isDragged,
                            child: SBContainer(
                              child: DisplayText(
                                text: widget.data.experienceLocation,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 460,
                          right: 30,
                          child: AnimatedShakingBuilder(
                            autoPlay: isDragged,
                            child: SBContainer(
                              child: DisplayText(
                                text: widget.data.experienceDescription,
                                maxLines: 15,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(height: 1.2),
                              ),
                            ),
                          ),
                        ),

                        const Positioned(
                          top: 560,
                          left: 30,
                          right: 30,
                          child: SHDivider(),
                        ),
                        Positioned(
                          top: 570,
                          left: 30,
                          child: AnimatedShakingBuilder(
                            autoPlay: isDragged,
                            child: DisplayText(
                              text: 'Education',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 570,
                          right: 110,
                          child: AnimatedShakingBuilder(
                            autoPlay: isDragged,
                            child: SBContainer(
                              child: DisplayText(
                                text: widget.data.education,
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 590,
                          right: 120,
                          child: AnimatedShakingBuilder(
                            autoPlay: isDragged,
                            child: SBContainer(
                              child: DisplayText(
                                text: 'Bachelor Degree',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                          ),
                        ),

                        const Positioned(
                          top: 620,
                          left: 30,
                          right: 30,
                          child: SHDivider(),
                        ),

                        Positioned(
                          top: 640,
                          left: 30,
                          child: AnimatedShakingBuilder(
                            autoPlay: isDragged,
                            child: SBContainer(
                              child: DisplayText(
                                text: 'Social Media',
                                style: Theme.of(context).textTheme.displayLarge,
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
