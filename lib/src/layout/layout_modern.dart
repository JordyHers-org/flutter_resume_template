import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/components/auto_size_text.dart';
import 'package:flutter_resume_template/src/repository/pdf_saver.dart';
import 'package:flutter_resume_template/src/utils/strings.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

class LayoutModern extends StatefulWidget {
  const LayoutModern({
    super.key,
    required this.data,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;
  final TemplateData data;

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
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  margin: Config.margin,
                                  height: widget.h,
                                  decoration: Config.decoration(context),
                                  child: Column(
                                    children: [
                                      SizedBox(height: Config.heightPx),
                                      ShakeWidget(
                                        shakeConstant: shakingConstant,
                                        autoPlay: isDragged,
                                        child: DisplayText(
                                          text: 'ABOUT ME',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge
                                              ?.copyWith(fontSize: 23),
                                        ),
                                      ),
                                      SizedBox(height: Config.heightPx),
                                      ShakeWidget(
                                        shakeConstant: shakingConstant,
                                        autoPlay: isDragged,
                                        child: DisplayText(
                                          text: Str.bioText,
                                          maxLines: 25,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                  fontSize: 17,
                                                  color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(height: Config.heightPx),
                                      Padding(
                                          padding: Config.padding.padding,
                                          child: const SHDivider()),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  height: widget.h,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
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
