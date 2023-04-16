import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_resume_template_example/data/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TemplateTheme.business.themeData,
      home: SafeArea(
        child: Scaffold(
          body: FlutterResumeTemplate(
            templateTheme: TemplateTheme.business,
            data: data,
          ),
        ),
      ),
    );
  }
}
