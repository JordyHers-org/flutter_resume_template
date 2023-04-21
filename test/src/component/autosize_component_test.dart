import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/components/auto_size_text.dart';
import 'package:flutter_test/flutter_test.dart';

import '../app.dart';

void main() {
  const position = Offset(20, 30);

  testWidgets('Display Text Test', (WidgetTester tester) async {
    // PumpApp
    await Launch.pumpApp(tester, position);

    // Find the text Displayed
    final displayTextFinder = find.byType(DisplayText);

    //expected text value
    expect(displayTextFinder, findsOneWidget);

    // textFound
    final displayText = find.text('Dummy Text');

    // expected
    expect(displayText, findsOneWidget);
  });

  testWidgets('tapping DisplayText widget replaces it with ReplacementWidget',
      (WidgetTester tester) async {
    // Build the DisplayText widget and add it to the tester.
    await Launch.pumpApp(tester, position);

    final displayTextFinder = find.byType(DisplayText);

    expect(displayTextFinder, findsOneWidget);

    final displayText = find.text('Dummy Text');

    expect(displayText, findsOneWidget);

    await tester.tap(displayText);

    // Rebuild the widget tree after the tap.
    await tester.pump();

    // Verify that the ReplacementWidget is displayed.
    expect(find.byType(TextField), findsOneWidget);
  });
}
