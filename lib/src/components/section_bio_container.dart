import 'package:flutter_resume_template/flutter_resume_template.dart';

///[SBContainer] is a section biography container
class SBContainer extends StatelessWidget {
  final Widget child;
  const SBContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: Config.dynamicHeight(context) / Config.fourPx,
        maxHeight: Config.dynamicHeight(context) / Config.twoPx,
        minWidth: Config.dynamicWidth(context) / Config.fourPx,
        maxWidth: Config.dynamicWidth(context) / Config.twoPx,
      ),
      child: child,
    );
  }
}
