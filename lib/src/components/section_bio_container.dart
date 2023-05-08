import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';

///[SBContainer] is a section biography container
/// This container helps create responsive spacing between
/// elements in the layout.
///
///
class SBContainer extends StatelessWidget {
  final Widget child;
  const SBContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      constraints: BoxConstraints(
        minHeight: Config.dynamicHeight(context) / Config.fortyPx,
        maxHeight: Config.dynamicHeight(context) / Config.twoPx,
        minWidth: Config.dynamicWidth(context) / Config.fourPx,
        maxWidth: Config.dynamicWidth(context) / Config.twoPx,
      ),
      child: child,
    );
  }
}
