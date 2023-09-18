import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_test/flutter_test.dart';

import '../app.dart';
import '../mocks/mock_data.dart';

void main() {
  testWidgets('Test launching widget and shaking children widgets',
      (WidgetTester tester) async {
    // Create the widget that contains the button to test
    final testWidget = Launch.pumpWidget(LayoutClassic(
      mode: TemplateMode.shakeEditAndSaveMode,
      data: MockData.data,
      h: 1000,
      w: 1000,
      showButtons: false,
    ));

    // Launch the widget
    await tester.pumpWidget(await testWidget);

    // Verify that the widget is displayed on the screen
    expectLater(find.text('Animate'), findsOneWidget);

    // Pan the widget to the right
    final gesture = await tester.startGesture(Offset.zero);
    await gesture.moveBy(const Offset(200, 0));
    await gesture.up();

    // Tap the button
    await tester.tap(find.text('Animate'));
  }, skip: true);
}
