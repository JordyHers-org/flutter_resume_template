import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template/src/components/auto_size_text.dart';
import 'package:flutter_test/flutter_test.dart';

class Launch {
  static pumpApp(WidgetTester tester, Offset position) async =>
      await tester.pumpWidget(
        MaterialApp(
          home: Stack(
            children: [
              Positioned(
                left: position.dx,
                top: position.dy,
                child: const Material(
                  child: DisplayText(
                    text: 'Dummy Text',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  static pumpWidget(Widget child) => MaterialApp(
        home: Scaffold(body: child),
      );
}
