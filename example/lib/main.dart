import 'dart:math';

import 'package:flutter/material.dart';
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
  late TemplateTheme theme = TemplateTheme.modern;
  List<TemplateTheme> list = [
    TemplateTheme.none,
    TemplateTheme.classic,
    TemplateTheme.modern,
    TemplateTheme.technical,
    TemplateTheme.business,
  ];

  TemplateTheme getRandomItem() {
    final random = Random();
    final index = random.nextInt(5);
    theme = list[index];
    return list[index];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: FlutterResumeTemplate(
            data: data,
            templateTheme: TemplateTheme.modern,
            mode: TemplateMode.onlyEditableMode,
          ),
        ),
      ),
    );
  }
}
