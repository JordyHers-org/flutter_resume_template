import 'package:flutter/material.dart';
import 'package:flutter_resume_template/src/components/section_rating_widget.dart';
import 'package:flutter_test/flutter_test.dart';

import '../app.dart';

void main() {
  testWidgets('RatingWidget displays correct number of filled stars',
      (WidgetTester tester) async {
    // Build the RatingWidget with a rating of 3
    await tester.pumpWidget(await Launch.pumpWidget(const RatingWidget(
      rating: 3,
      title: 'English',
      autoplay: true,
    )));

    // Verify that the RatingWidget contains 3 filled stars and 2 empty stars
    expect(find.byIcon(Icons.star), findsNWidgets(3));
    expect(find.byIcon(Icons.star_border), findsNWidgets(2));
    expect(find.text('English'), findsOneWidget);
  });
}
