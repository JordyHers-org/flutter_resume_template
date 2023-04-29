import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/utils/strings.dart';
import 'package:flutter_test/flutter_test.dart';

import '../app.dart';

void main() {
  testWidgets('Test launching widget and shaking children widgets',
      (WidgetTester tester) async {
    // Create the widget that contains the button to test
    final testWidget = Launch.pumpWidget(LayoutBusiness(
        mode: TemplateMode.shakeEditAndSaveMode,
        data: Str.mockData,
        h: 1000,
        w: 1000));

    // Launch the widget
    await tester.pumpWidget(testWidget);

    // Verify that the widget is displayed on the screen
    expect(find.text('Animate'), findsOneWidget);

    // Pan the widget to the right
    final gesture = await tester.startGesture(Offset.zero);
    await gesture.moveBy(const Offset(200, 0));
    await gesture.up();

    // Tap the button
    await tester.tap(find.text('Animate'));
  });
}
