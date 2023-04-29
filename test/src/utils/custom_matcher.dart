import 'package:flutter/animation.dart';
import 'package:flutter_test/flutter_test.dart';

Matcher shakes(int count) {
  return _ShakesMatcher(count);
}

class _ShakesMatcher extends Matcher {
  final int count;

  _ShakesMatcher(this.count);

  @override
  bool matches(dynamic item, Map<dynamic, dynamic> matchState) {
    final shakeAnimation = item
        .getElementForTesting()
        .animationController
        .view
        .animation as TweenSequence<double>;

    return shakeAnimation.toString().length > 10;
  }

  @override
  Description describe(Description description) {
    return description.add('shakes $count times');
  }
}
