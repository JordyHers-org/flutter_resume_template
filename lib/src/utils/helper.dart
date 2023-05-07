import 'dart:io';

class Helper {
  static bool get isTestMode =>
      !Platform.environment.containsKey('FLUTTER_TEST');
}
