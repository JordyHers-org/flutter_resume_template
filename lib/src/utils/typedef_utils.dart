import 'package:flutter_resume_template/flutter_resume_template.dart';

typedef ResumeBuilder<T> = T Function(BuildContext context);
typedef SaveResume<T> = Future<T> Function(GlobalKey key);
