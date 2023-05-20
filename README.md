




<p align="center">
  <img align="center" height="400"  src="https://github.com/JordyHers/flutter_resume_template/assets/49708438/0091f85d-d869-433b-8221-19a8e51a4412">
 </p>
  
# flutter resume template 
[![CI/CD for Flutter release](https://github.com/JordyHers/flutter_resume_template/actions/workflows/ci.yml/badge.svg)](https://github.com/JordyHers/flutter_resume_template/actions/workflows/ci.yml)
[![Flutter CI](https://github.com/JordyHers/flutter_resume_template/actions/workflows/main.yml/badge.svg)](https://github.com/JordyHers/flutter_resume_template/actions/workflows/main.yml)
[![Publish Flutter Plugin](https://github.com/JordyHers/flutter_resume_template/actions/workflows/release.yml/badge.svg)](https://github.com/JordyHers/flutter_resume_template/actions/workflows/release.yml)




The `flutter_resume_template` plugin provides a customizable resume template that can be easily integrated into a Flutter application. This plugin provides a `FlutterResumeTemplate` widget that takes the parameters, `TemplateMode`, `TemplateTheme`, `onSaveResume`, `TemplateData` and `onEmpty()`, to customize the template according to your needs.






<img width="287" alt="templates" src="https://github.com/JordyHers/flutter_resume_template/assets/49708438/c0097b65-be62-4d24-a862-d17be6a7c12d">

## Features

- Customizable resume template with multiple styles.
- Ability to add or remove buttons based on user needs.
- Easy to integrate and customize with the existing Flutter application.




## Editing Mode Features

| Feature | Description |
|---------|-------------|
| Drag and Drop | Allows users to drag and drop widgets to reposition them within the layout. |
| Zoom | Enables users to zoom in or out of the layout to see more or less of the widgets. |
| Widget Shake | When editing mode is selected, widgets on the canvas will shake to indicate that they can be moved or modified. |

You can modify the table format and content to fit your specific needs, but this should give you a good starting point.

## Installation

To use this plugin, add `flutter_resume_template` as a dependency in your project's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_resume_template: ^1.0.3
```

Then, run the following command to install the dependencies:

```bash
$ flutter packages get
```

## Usage

To use `FlutterResumeTemplate` widget, simply import the `flutter_resume_template` package and 
create a new instance of the widget, providing the required parameters.

 create a dart file called **data.dart**


```dart

TemplateData data = TemplateData(
    fullName: 'Jordy Hershel',
    currentPosition: 'Flutter Developer',
    street: '56B Wellington',
    address: 'Toronto, 14568',
    country: 'CANADA',
    email: 'jordyhershel@email.com',
    phoneNumber: '+1 (106)341 753 12',
    bio: 'I am a talented young mobile application developer .'
        ' I have been developing Mobile application for several years now and'
        ' I do have a solid background in Developing tools. I am keen to '
        'learn and that would be a pleasure to be a member of your company.'
        ' I am currently working at This awesome company',
    experience: experience

  );


    ExperienceData(
    experienceTitle: 'Software Engineer',
    experienceLocation: 'at UberEats',
    experiencePeriod: 'Aug 2021 - Dec 2023',
    experiencePlace: 'Berlin',
    experienceDescription:
    '''Worked hand to hand with backend dev and UI/Ux designer to deliver medical device. • GraphQL • GitLab • Posthog • Fastlane • Dynamic element ''',
    education: 'Yale University',
    image:
    'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');

   

```




Then import **data.dart** and use :

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
            data: data,
            templateTheme: TemplateTheme.modern,
            mode: TemplateMode.shakeEditAndSaveMode,
            onSaveResume: (globalKey) async =>
                await PdfHandler().createResume(globalKey),
          ),
    );
  }
}
```

```dart
// To create your own template set the [TemplateTheme.none]
FlutterResumeTemplate(
data: data,
templateTheme: TemplateTheme.none,
 onEmpty: () => YourCustomTemplate(), //just make sure you pass the data to your widget

```

### Parameters

- `mode` (required): That determines the different states of the Template which are `[TemplateMode.onlyEditableMode]` , `[TemplateMode.shakeEditAndSaveMode]`, `[TemplateMode.readOnlyMode]`
- `TemplateTheme` (required): A string value that determines the template style. The available styles are `business`, `technical`, `modern`, and `classic`.
- `TemplateData` (optional): An Object that receives all the props of the resume suh as experience, address, name, current position etc and will be displayed on the Resume
- `onEmpty` (optional): A callback function that allow the user to render his own template
- `onSaveResume` (optional): A callback function that will save a PDF version of the resume in the local download path.



### Example Code

Check out the [example](example) directory for a sample application that uses the `FlutterResumeTemplate` widget.

## Contributions

Contributions to this plugin are welcome. Please create issues and pull requests on the [GitHub repository](https://github.com/jordyhers/flutter_resume_template).



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





