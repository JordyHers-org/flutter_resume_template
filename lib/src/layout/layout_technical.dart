import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

class LayoutTechnical extends StatefulWidget {
  const LayoutTechnical({
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
  State<LayoutTechnical> createState() => _LayoutTechnicalState();
}

class _LayoutTechnicalState extends State<LayoutTechnical> {
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
    return Container();
  }
}
