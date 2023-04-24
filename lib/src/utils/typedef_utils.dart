import 'package:flutter/material.dart';

typedef ResumeBuilder<T> = T Function(BuildContext context);
typedef SaveResume<T> = Future<T> Function(GlobalKey key);
