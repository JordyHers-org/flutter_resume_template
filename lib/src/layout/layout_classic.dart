import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/components/auto_size_text.dart';
import 'package:flutter_resume_template/src/components/section_bio_container.dart';
import 'package:flutter_resume_template/src/repository/pdf_saver.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

class LayoutClassic extends StatefulWidget {
  const LayoutClassic({
    super.key,
    required this.data,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;
  final TemplateData data;

  @override
  State<LayoutClassic> createState() => _LayoutClassicState();
}

class _LayoutClassicState extends State<LayoutClassic> {
  GlobalKey globalKey = GlobalKey();

  final shakingConstant = ShakeSlowConstant1();

  bool enableEditingMode = true;

  bool isButtonVisible = true;

  bool isDragged = false;

  late TransformationController _controller;

  final TextEditingController _currentPositionController =
      TextEditingController();

  final TextEditingController _experienceTitleController =
      TextEditingController();

  final TextEditingController _experienceLocationController =
      TextEditingController();

  final TextEditingController _experiencePeriodController =
      TextEditingController();

  final TextEditingController _experienceDescriptionController =
      TextEditingController();

  final TextEditingController _workExperienceTitleController =
      TextEditingController();

  final TextEditingController _educationTitleController =
      TextEditingController();

  final TextEditingController _streetController = TextEditingController();

  final TextEditingController _bioTitleController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _countryController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _bioController = TextEditingController();

  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _educationController = TextEditingController();

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
          absorbing: enableEditingMode,
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
                  decoration: Config.decoration(context),
                  child: RepaintBoundary(
                    key: globalKey,
                    child: Stack(
                      children: [
                        //Header top left
                        Positioned(
                          top: 30,
                          left: 30,
                          child: ShakeWidget(
                            shakeConstant: shakingConstant,
                            autoPlay: isDragged,
                            child: DisplayText(
                              text: widget.data.fullName,
                              controller: _fullNameController,
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 30,
                          child: ShakeWidget(
                            shakeConstant: shakingConstant,
                            autoPlay: isDragged,
                            child: DisplayText(
                              controller: _currentPositionController,
                              text: widget.data.currentPosition,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),

                        Positioned(
                          top: 10,
                          right: 30,
                          child: ShakeWidget(
                            shakeConstant: shakingConstant,
                            autoPlay: isDragged,
                            child: DisplayText(
                              controller: _streetController,
                              text: widget.data.street,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 30,
                          right: 30,
                          child: ShakeWidget(
                            shakeConstant: shakingConstant,
                            autoPlay: isDragged,
                            child: DisplayText(
                              controller: _addressController,
                              text: widget.data.address,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          right: 30,
                          child: ShakeWidget(
                            shakeConstant: shakingConstant,
                            autoPlay: isDragged,
                            child: DisplayText(
                              controller: _countryController,
                              text: widget.data.country,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 80,
                          right: 30,
                          child: ShakeWidget(
                            shakeConstant: shakingConstant,
                            autoPlay: isDragged,
                            child: DisplayText(
                              controller: _phoneNumberController,
                              text: widget.data.phoneNumber,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 100,
                          right: 30,
                          child: ShakeWidget(
                            shakeConstant: shakingConstant,
                            autoPlay: isDragged,
                            child: DisplayText(
                              controller: _emailController,
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
                          child: ShakeWidget(
                            shakeConstant: shakingConstant,
                            autoPlay: isDragged,
                            child: SBContainer(
                              child: DisplayText(
                                text: 'Short bio',
                                controller: _bioTitleController,
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          top: 150,
                          right: 30,
                          child: ShakeWidget(
                            shakeConstant: shakingConstant,
                            autoPlay: isDragged,
                            child: SBContainer(
                              child: DisplayText(
                                controller: _bioController,
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
                          child: ShakeWidget(
                            shakeConstant: shakingConstant,
                            autoPlay: isDragged,
                            child: DisplayText(
                              text: 'Work Experience',
                              controller: _workExperienceTitleController,
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 370,
                          right: 130,
                          child: ShakeWidget(
                            shakeConstant: shakingConstant,
                            autoPlay: isDragged,
                            child: SBContainer(
                              child: DisplayText(
                                controller: _experienceTitleController,
                                text: widget.data.experienceTitle,
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 390,
                          right: 130,
                          child: ShakeWidget(
                            shakeConstant: shakingConstant,
                            autoPlay: isDragged,
                            child: SBContainer(
                              child: DisplayText(
                                controller: _experienceLocationController,
                                text: widget.data.experienceLocation,
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 410,
                          right: 130,
                          child: ShakeWidget(
                            shakeConstant: shakingConstant,
                            autoPlay: isDragged,
                            child: SBContainer(
                              child: DisplayText(
                                controller: _experiencePeriodController,
                                text: widget.data.experiencePeriod,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 430,
                          right: 130,
                          child: ShakeWidget(
                            shakeConstant: shakingConstant,
                            autoPlay: isDragged,
                            child: SBContainer(
                              child: DisplayText(
                                controller: _experienceLocationController,
                                text: widget.data.experienceLocation,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 460,
                          right: 30,
                          child: ShakeWidget(
                            shakeConstant: shakingConstant,
                            autoPlay: isDragged,
                            child: SBContainer(
                              child: DisplayText(
                                controller: _experienceDescriptionController,
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
                          child: ShakeWidget(
                            shakeConstant: shakingConstant,
                            autoPlay: isDragged,
                            child: DisplayText(
                              text: 'Education',
                              controller: _educationTitleController,
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 570,
                          right: 110,
                          child: ShakeWidget(
                            shakeConstant: shakingConstant,
                            autoPlay: isDragged,
                            child: SBContainer(
                              child: DisplayText(
                                controller: _educationController,
                                text: widget.data.education,
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 590,
                          right: 120,
                          child: ShakeWidget(
                            shakeConstant: shakingConstant,
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
                          child: ShakeWidget(
                            shakeConstant: shakingConstant,
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
                        icon: const Icon(Icons.drag_indicator),
                        onPressed: () async {
                          setState(() {
                            isDragged = !isDragged;
                          });
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
