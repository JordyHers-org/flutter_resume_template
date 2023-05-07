import 'package:flutter/material.dart';
import 'package:flutter_resume_template/src/components/section_bio_container.dart';
import 'package:flutter_test/flutter_test.dart';

import '../app.dart';

void main() {
  testWidgets('SbContainer should have the passed child',
      (WidgetTester tester) async {
    const passedChild = SBContainer(
      child: Text('child'),
    );
    // Create a test widget that has SbContainer with a Text widget as its child
    final widget = await Launch.pumpWidget(passedChild);

    // Build the widget tree
    await tester.pumpWidget(widget);

    // Find the Text widget inside SbContainer
    final textFinder = find.text('child');

    // expected Child
    final expectedChild = tester.widget<SBContainer>(find.byType(SBContainer));

    // Expect the Text widget to be found and be equal to the passed child
    expect(textFinder, findsOneWidget);
    expect(passedChild, equals(expectedChild));
  });
}
