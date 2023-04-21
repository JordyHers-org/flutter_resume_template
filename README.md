# Flutter Resume Template Plugin
<br/>

[![Coverage Status](https://coveralls.io/repos/github/JordyHers/flutter_resume_template/badge.svg?branch=master)](https://coveralls.io/github/JordyHers/flutter_resume_template?branch=master)
![CI/CD for Flutter release](https://github.com/JordyHers/flutter_resume_template/workflows/CI/CD%20for%20Flutter%20release/badge.svg)
![Flutter CI](https://github.com/JordyHers/flutter_resume_template/workflows/Flutter%20CI/badge.svg)
![Publish Flutter Plugin](https://github.com/JordyHers/flutter_resume_template/workflows/Publish%20Flutter%20Plugin/badge.svg)

<br/>

The `flutter_resume_template` plugin provides a customizable resume template that can be easily integrated into a Flutter application. This plugin provides a `FlutterResumeTemplate` widget that takes four parameters, `withButtons`, `templateType`, `onEmpty()`, and `style`, to customize the template according to your needs.

<br/>

## Features

- Customizable resume template with multiple styles.
- Ability to add or remove buttons based on user needs.
- Easy to integrate and customize with the existing Flutter application.

 
<br/>




## Editing Mode Features

| Feature | Description |
|---------|-------------|
| Drag and Drop | Allows users to drag and drop widgets to reposition them within the layout. |
| Zoom | Enables users to zoom in or out of the layout to see more or less of the widgets. |
| Widget Shake | When editing mode is selected, widgets on the canvas will shake to indicate that they can be moved or modified. |

You can modify the table format and content to fit your specific needs, but this should give you a good starting point.
<br/>

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
<br/>

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
<br/>

### Parameters

- `withButtons` (required): A boolean value that determines whether or not to show the action buttons at the bottom of the template.
- `templateType` (optional): A string value that determines the template style. The available styles are `minimal`, `creative`, `modern`, and `classic`.
- `onEmpty` (optional): A callback function that will be called when there is no data to display in the template.
- `style` (optional): A TextStyle object that defines the style of the text in the template.

<br/>

## Screenshots

<img width="818" align="center" alt="Template Business" src="https://user-images.githubusercontent.com/49708438/233688118-5b6969e0-6434-4e9a-a8dc-6b1000b0316d.png">


### Example Code

Check out the [example](example) directory for a sample application that uses the `FlutterResumeTemplate` widget.
<br/>

## Contributions

Contributions to this plugin are welcome. Please create issues and pull requests on the [GitHub repository](https://github.com/jordyhers/flutter_resume_template).

<br/>

  <h2>⚠️ Warning ⚠️</h2>

Experimental Feature: [Edit Template]
 This plugin package includes an experimental feature that is still in development and may not be stable or fully functional.
 This feature is provided as-is, without any guarantees or warranties of any kind, and is not recommended for use in production environments.

 Please note that this experimental feature may be changed, removed, 
 or replaced in future versions of the plugin package, without prior notice. 
 If you choose to use this feature, you do so at your own risk.

 We recommend that you only use this experimental feature for testing and evaluation purposes, and not in any critical or sensitive applications.
 If you encounter any issues or problems while using this feature,
 please report them to the plugin developer or community forum, so that they can be addressed in future updates.

 Please be aware that the use of this experimental feature may result in unexpected behavior, crashes, data loss, 
 or other issues. Therefore, we strongly advise that you backup your data and test this feature thoroughly before 
 using it in any important or mission-critical projects.


## Workflows

- CI/CD for Flutter Release: This workflow builds and tests the app for release, and publishes it to the App Store and Google Play.
- Flutter CI: This workflow runs tests on the app for each commit and pull request.
- Publish Flutter Plugin: This workflow publishes the template as a Flutter plugin to the pub.dev package repository.

## License

This plugin is released under the [MIT License](https://github.com/JordyHers/flutter_resume_template/blob/34704667781ba7b286f4b2c667951a261d1e1763/LICENSE). See the [LICENSE.txt](LICENSE) file for more details.





