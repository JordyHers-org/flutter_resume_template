import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

class AnimatedShakingBuilder extends StatelessWidget {
  final Widget child;
  final bool autoPlay;

  const AnimatedShakingBuilder(
      {Key? key, required this.child, required this.autoPlay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShakeWidget(
      shakeConstant: Config.shakingConstant,
      duration: Config.shakingDuration,
      autoPlay: autoPlay,
      child: child,
    );
  }
}
