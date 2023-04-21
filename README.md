# Flutter Resume Template Plugin

[![Coverage Status](https://coveralls.io/repos/github/jordyhers/flutter_resume_template/badge.svg?branch=master)](https://coveralls.io/github/jordyhers/flutter_resume_template?branch=master)
![Build and Test](https://github.com/jordyhers/flutter_resume_template/workflows/Build%20and%20Test/badge.svg)

The `flutter_resume_template` plugin provides a customizable resume template that can be easily integrated into a Flutter application. This plugin provides a `FlutterResumeTemplate` widget that takes four parameters, `withButtons`, `templateType`, `OnEmpty()`, and `style`, to customize the template according to your needs.

## Features

- Customizable resume template with multiple styles.
- Ability to add or remove buttons based on user needs.
- Easy to integrate and customize with the existing Flutter application.

## Installation

To use this plugin, add `flutter_resume_template` as a dependency in your project's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_resume_template: ^1.0.0
```

Then, run the following command to install the dependencies:

```bash
$ flutter packages get
```

## Usage

To use `FlutterResumeTemplate` widget, simply import the `flutter_resume_template` package and create a new instance of the widget, providing the required parameters.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';

class MyResumePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Resume'),
      ),
      body: FlutterResumeTemplate(
        withButtons: true,
        templateTheme: TemplateTheme.modern,
        onEmpty: () {
          return Text('No data found.');
        },
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
```

### Parameters

- `withButtons` (required): A boolean value that determines whether or not to show the action buttons at the bottom of the template.
- `templateType` (optional): A string value that determines the template style. The available styles are `minimal`, `creative`, `modern`, and `classic`.
- `onEmpty` (optional): A callback function that will be called when there is no data to display in the template.
- `style` (optional): A TextStyle object that defines the style of the text in the template.

### Screenshots

Here are some examples of the `FlutterResumeTemplate` widget with different styles:

![Minimal style template](screenshots/minimal.png)

![Creative style template](screenshots/creative.png)

![Modern style template](screenshots/modern.png)

![Classic style template](screenshots/classic.png)

### Example Code

Check out the [example](example) directory for a sample application that uses the `FlutterResumeTemplate` widget.

## Contributions

Contributions to this plugin are welcome. Please create issues and pull requests on the [GitHub repository](https://github.com/jordyhers/flutter_resume_template).


## License

This plugin is released under the [MIT License](LICENSE.txt). See the [LICENSE.txt](LICENSE.txt) file for more details.

