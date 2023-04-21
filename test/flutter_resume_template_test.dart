import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Positioned widget is correctly positioned',
      (WidgetTester tester) async {
    const position = Offset(20, 30);

    await tester.pumpWidget(
      MaterialApp(
        home: Stack(
          children: [
            Positioned(
              left: position.dx,
              top: position.dy,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );

    final positionedFinder = find.byType(Positioned);
    expect(positionedFinder, findsOneWidget);

    final positionedWidget =
        positionedFinder.evaluate().first.widget as Positioned;
    expect(positionedWidget.left, equals(position.dx));
    expect(positionedWidget.top, equals(position.dy));
  });
  testWidgets('Positioned widget is correctly positioned',
      (WidgetTester tester) async {
    const position = Offset(20, 30);

    await tester.pumpWidget(
      MaterialApp(
        home: Stack(
          children: [
            Positioned(
              left: position.dx,
              top: position.dy,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );

    final positionedFinder = find.byType(Positioned);
    expect(positionedFinder, findsOneWidget);

    final positionedWidget =
        positionedFinder.evaluate().first.widget as Positioned;
    expect(positionedWidget.left, equals(position.dx));
    expect(positionedWidget.top, equals(position.dy));
  });
  testWidgets('Positioned widget is correctly positioned',
      (WidgetTester tester) async {
    const position = Offset(20, 30);

    await tester.pumpWidget(
      MaterialApp(
        home: Stack(
          children: [
            Positioned(
              left: position.dx,
              top: position.dy,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );

    final positionedFinder = find.byType(Positioned);
    expect(positionedFinder, findsOneWidget);

    final positionedWidget =
        positionedFinder.evaluate().first.widget as Positioned;
    expect(positionedWidget.left, equals(position.dx));
    expect(positionedWidget.top, equals(position.dy));
  });

  testWidgets('Positioned widget is correctly positioned',
      (WidgetTester tester) async {
    const position = Offset(20, 30);

    await tester.pumpWidget(
      MaterialApp(
        home: Stack(
          children: [
            Positioned(
              left: position.dx,
              top: position.dy,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );

    final positionedFinder = find.byType(Positioned);
    expect(positionedFinder, findsOneWidget);

    final positionedWidget =
        positionedFinder.evaluate().first.widget as Positioned;
    expect(positionedWidget.left, equals(position.dx));
    expect(positionedWidget.top, equals(position.dy));
  });
}
