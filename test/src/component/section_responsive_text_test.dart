import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_test/flutter_test.dart';

import '../app.dart';

void main() {
  const position = Offset(20, 30);

  testWidgets('Display Text Test', (WidgetTester tester) async {
    await Launch.pumpApp(tester, position);
    final displayTextFinder = find.byType(DisplayText);
    expect(displayTextFinder, findsOneWidget);
    final displayText = find.text('Dummy Text');
    expect(displayText, findsOneWidget);
  });

  testWidgets('tapping DisplayText widget replaces it with ReplacementWidget',
      (WidgetTester tester) async {
    await Launch.pumpApp(tester, position);
    final displayTextFinder = find.byType(DisplayText);
    expect(displayTextFinder, findsOneWidget);
    final displayText = find.text('Dummy Text');
    expect(displayText, findsOneWidget);
    await tester.tap(displayText);
    await tester.pump();
    expect(find.byType(TextField), findsOneWidget);
  });
}
