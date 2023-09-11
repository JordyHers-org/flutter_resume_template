import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/components/section_shaking.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:flutter_test/flutter_test.dart';

import '../app.dart';

void main() {
  testWidgets('AnimatedShakingBuilder applies ShakeWidget to child',
      (WidgetTester tester) async {
    await tester.pumpWidget(await Launch.pumpWidget(
      const AnimatedShakingBuilder(
        autoPlay: true,
        child: Text('Hello, world!'),
      ),
    ));

    final shakeWidgetFinder = find.byType(ShakeWidget);
    expect(shakeWidgetFinder, findsOneWidget);

    final shakeWidget = tester.widget(shakeWidgetFinder) as ShakeWidget;
    expect(shakeWidget.shakeConstant, Config.shakingConstant);
    expect(shakeWidget.duration, Config.shakingDuration);
    expect(shakeWidget.autoPlay, true);

    final childFinder = find.text('Hello, world!');
    expect(childFinder, findsOneWidget);
    expect(tester.widget<ShakeWidget>(shakeWidgetFinder).child,
        equals(tester.widget<Text>(childFinder)));
  });
}
