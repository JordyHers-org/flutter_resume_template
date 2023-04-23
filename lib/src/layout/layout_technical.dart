import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/utils/strings.dart';
import 'package:flutter_resume_template/src/utils/typedef_utils.dart';

class LayoutTechnical extends StatefulWidget {
  const LayoutTechnical({
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
                  width: widget.w < 400 ? widget.w : widget.w * 0.8,
                  constraints: BoxConstraints(
                    minWidth: widget.w < 400 ? widget.w * 1.2 : widget.w * 1,
                    minHeight: widget.h < 670 ? widget.h * 1.2 : widget.h * 0.9,
                  ),
                  child: RepaintBoundary(
                    key: globalKey,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: SizedBox(
                        height: widget.h * 1.5,
                        width: widget.w * 1.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(Str.backgroundImage),
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
                            const SizedBox(height: 80.0),
                            Center(
                              child: Text(
                                widget.data.fullName,
                                style: const TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.blueGrey,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Address",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.blueGrey,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "Country",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.blueGrey,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.data.address ?? '',
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black54,
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    widget.data.street ?? ' ',
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black54,
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Work Experience",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.blueGrey,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "Education",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.blueGrey,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.data.experienceTitle ?? '',
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black54,
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    widget.data.education ?? '',
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black54,
                                      letterSpacing: 1.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40.0),
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                "About Me",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.blueGrey,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                widget.data.bio ?? '',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black54,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            const SizedBox(height: 40.0),
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                "Hobbies",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.blueGrey,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                ' BasketBall',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black54,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            const SizedBox(height: 40.0),
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                "Languages",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.blueGrey,
                                  letterSpacing: 2.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                'English',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black54,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w300,
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
                  isDragged ? 'Reset' : 'Animate',
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
