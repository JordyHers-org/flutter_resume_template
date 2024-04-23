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
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late TemplateTheme theme = TemplateTheme.modern;
  List<TemplateTheme> list = [
    TemplateTheme.classic,
    TemplateTheme.modern,
    TemplateTheme.technical,
    TemplateTheme.business,
  ];

  void getRandomItem(BuildContext context) {
    final random = Random();
    final index = random.nextInt(4);
    theme = list[index];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    getRandomItem(context);
                    _scaffoldKey.currentState?.closeDrawer();
                  });
                },
                child: const Text('Change Theme'),
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: FlutterResumeTemplate(
            data: data,
            imageHeight: 100,
            imageWidth: 100,
            emailPlaceHolder: 'Email:',
            telPlaceHolder: 'No:',
            experiencePlaceHolder: 'Past',
            educationPlaceHolder: 'School',
            languagePlaceHolder: 'Skills',
            aboutMePlaceholder: 'Me',
            hobbiesPlaceholder: 'Past Times',
            mode: TemplateMode.onlyEditableMode,
            showButtons: true,
            imageBoxFit: BoxFit.fitHeight,
            enableDivider: false,
            //backgroundColorLeftSection: Colors.amber,
            templateTheme: theme),
      ),
    );
  }
}
