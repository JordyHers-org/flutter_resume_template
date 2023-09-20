




<p align="center">
  <img align="center" height="400"  src="https://github.com/JordyHers/flutter_resume_template/assets/49708438/0091f85d-d869-433b-8221-19a8e51a4412">
 </p>
  
# flutter resume template 
[![CI/CD for Flutter release](https://github.com/JordyHers/flutter_resume_template/actions/workflows/ci.yml/badge.svg)](https://github.com/JordyHers/flutter_resume_template/actions/workflows/ci.yml)
[![Flutter CI](https://github.com/JordyHers/flutter_resume_template/actions/workflows/main.yml/badge.svg)](https://github.com/JordyHers/flutter_resume_template/actions/workflows/main.yml)
[![Publish Flutter Plugin](https://github.com/JordyHers/flutter_resume_template/actions/workflows/release.yml/badge.svg)](https://github.com/JordyHers/flutter_resume_template/actions/workflows/release.yml)




The `flutter_resume_template` plugin provides a customizable resume template that can be easily integrated into a Flutter application. This plugin provides a `FlutterResumeTemplate` widget that takes the parameters, `TemplateMode`, `TemplateTheme`, `onSaveResume`, `TemplateData` and `onEmpty()`, to customize the template according to your needs.



<img width="1447" alt="Screenshot 2023-09-18 at 16 39 32" src="https://github.com/JordyHers-org/flutter_resume_template/assets/49708438/52f5be1f-0089-42fb-8e4b-9eaa47778f39">



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
  flutter_resume_template: <latest.version>
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


const String workExperienceCompany1 = '''
Responsibilities:
  - Developed and maintained RESTful APIs using Node.js and Express.js for our web applications.
  - Collaborated with the frontend team to integrate GraphQL APIs into our applications.
  - Utilized Docker for containerization and Kubernetes for orchestration of microservices.
  - Implemented user authentication and authorization using JWT tokens and OAuth2.

  Technologies Used:
  - Node.js, Express.js, GraphQL, RESTful APIs
  - Docker, Kubernetes, JWT, OAuth2
  - PostgreSQL, MongoDB
  - Git, JIRA

  Achievements:
  - Successfully reduced API response times by 30% by optimizing database queries.
  - Led a team of developers in delivering critical features on time.
''';

const String workExperienceCompany2 = '''
Responsibilities:
  - Developed scalable microservices using Java and Spring Boot for our cloud-based applications.
  - Integrated Elasticsearch and Kibana for real-time log monitoring and analysis.
  - Implemented message queuing systems using Apache Kafka for event-driven architecture.
  - Collaborated with the QA team to ensure high code quality and performance.

  Technologies Used:
  - Java, Spring Boot, RESTful APIs
  - Elasticsearch, Kibana, Apache Kafka
  - AWS (Amazon Web Services)
  - Git, Jenkins

  Achievements:
  - Improved application performance by optimizing database queries and reducing response times.
  - Implemented automated deployment pipelines, resulting in a 50% reduction in release time.
''';

const String workExperienceCompany3 = '''
Responsibilities:
  - Designed and developed responsive web applications using React.js and Redux.
  - Implemented serverless architecture using AWS Lambda and API Gateway for cost-effective solutions.
  - Integrated third-party APIs and payment gateways for e-commerce applications.
  - Conducted code reviews and mentored junior developers in best practices.

  Technologies Used:
  - React.js, Redux, GraphQL
  - AWS Lambda, API Gateway
  - MySQL, MongoDB
  - Git, Bitbucket

  Achievements:
  - Successfully launched three web applications, increasing customer engagement by 25%.
  - Implemented a GraphQL API, reducing the number of network requests and improving frontend performance.
''';

const String bio = '''
I am a dedicated Flutter developer with four years of valuable experience in both front-end and back-end development. 
My expertise lies in crafting robust and user-friendly applications using the Flutter framework. 
Having worked on projects of all sizes, I possess a deep understanding of the development 
lifecycle and a proven ability to deliver high-quality solutions.

Currently based in the vibrant city of Berlin, Germany, I enjoy being a part of its thriving tech community.
 As a Computer Engineering graduate, I bring a solid foundation of technical knowledge and problem-solving
  skills to every project I undertake.

Throughout my career, I have consistently demonstrated a passion for creating innovative and efficient applications
 that provide an exceptional user experience. My proficiency in Flutter enables me to build cross-platform 
 applications with beautiful interfaces, seamless functionality, and optimized performance.

I thrive in collaborative environments and enjoy working closely with cross-functional teams to bring ideas to life.
 I am always eager to stay up-to-date with the latest industry trends and technologies, continuously honing 
 my skills to deliver cutting-edge solutions.
''';

TemplateData data = TemplateData(
    fullName: 'Alicia Smith',
    currentPosition: 'Flutter Developer',
    street: 'Curvy Str. 53',
    address: 'Berlin, 14568',
    country: 'Germany',
    email: 'aliciasmith@wuerth.com',
    phoneNumber: '+ 49 (106)341 753 12',
    bio: bio,
    experience: [
      ExperienceData(
        experienceTitle: 'Software Engineer',
        experienceLocation: 'at Mindable Health',
        experiencePeriod: 'Aug 2021 - Dec 2023',
        experiencePlace: 'Berlin',
        experienceDescription: workExperienceCompany1,
      ),
      ExperienceData(
        experienceTitle: 'Product Design',
        experienceLocation: 'Uk . London',
        experiencePeriod: 'Aug 2021 - Dec 2023',
        experiencePlace: 'London',
        experienceDescription: workExperienceCompany2,
      ),
      ExperienceData(
        experienceTitle: 'Flutter Developer',
        experienceLocation: 'Uk . London',
        experiencePeriod: 'Aug 2021 - Dec 2023',
        experiencePlace: 'London',
        experienceDescription: workExperienceCompany3,
      ),
    ],
    educationDetails: [
      Education('Bachelor Degree', 'Oxford University'),
      Education('Post Graduate Degree', 'Oxford University'),
    ],
    languages: [
      Language('English', 5),
      Language('French', 4),
      Language('Spanish', 3),
      Language('Mandarin', 2),
      Language('Russian', 1),
    ],
    hobbies: [
      'Bungee jumping',
      'Fitness Studio',
      'Martial Art',
      'Vintage Art Collection'
    ],
    image:
    'https://images.pexels.com/photos/3768911/pexels-photo-3768911.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    backgroundImage:
    'https://images.pexels.com/photos/3768911/pexels-photo-3768911.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');

   

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

## Additional Information

```dart
// To create your own template set the [TemplateTheme.none]
FlutterResumeTemplate(
data: data,
templateTheme: TemplateTheme.none,
 onEmpty: () => YourCustomTemplate(), //just make sure you pass the data to your widget




// To add your own template style [background color etc...],
// You should define and pass your own ThemeData.
templateTheme: TemplateTheme(
TemplateType.modernResume, // set the template mode that you would like to customise
ThemeData(
primaryColor: Colors.red
//...
  ),
),

```

Sure, I can help you reformat the information into tables.

### Parameters

| Parameter                  | Description                                                                                      |
|----------------------------|--------------------------------------------------------------------------------------------------|
| `mode` (required)          | Determines the different states of the Template: `[TemplateMode.onlyEditableMode]`, `[TemplateMode.shakeEditAndSaveMode]`, `[TemplateMode.readOnlyMode]` |
| `TemplateTheme` (required) | A string value that determines the template style. Available styles are `business`, `technical`, `modern`, and `classic`. |
| `data` (optional)          | An Object that receives all the props of the resume such as experience, address, name, current position, etc., and will be displayed on the Resume |
| `onEmpty` (optional)       | A callback function that allows the user to render their own template                               |
| `onSaveResume` (optional)  | A callback function that will save a PDF version of the resume in the local download path         |
| `maxLinesExperience` (optional) | Maximum lines the experience widget should take                                             |
| `showButtons` (optional)   | Decide whether to show or hide the animate and download button only in `[shakeAndEditButton]` mode |
| `height` (optional)        | The entire widget height                                                                         |
| `width` (optional)         | The entire widget width                                                                          |
| `backgroundColor` (optional) | The entire widget background color                                                               |
| `backgroundColorLeftSection` (optional) | Changes the background color of the left section of the Resume template when the mode is `Modern` |
| `enableDivider` (optional) | Enable or disable all the dividers in several sections. Note that not all templates have `SHDivider` |
| `imageBoxFit` (optional)   | Renders the image fit by its parent widget                                                       |
| `imageRadius` (optional)   | Renders the image radius by its parent widget                                                    |
| `imageHeight` (optional)   | Renders the image height by its parent widget                                                    |
| `imageWidth` (optional)    | Renders the image width by its parent widget                                                     |
| `aboutMePlaceholder` (optional) | Renders the `aboutMePlaceholder`                                                               |
| `languagePlaceHolder` (optional) | Renders the `languagePlaceHolder`                                                             |
| `experiencePlaceHolder` (optional) | Renders the `experiencePlaceHolder`                                                           |
| `telPlaceHolder` (optional) | Renders the `telPlaceHolder`                                                                   |
| `emailPlaceHolder` (optional) | Renders the `emailPlaceHolder`                                                                 |
| `hobbiesPlaceholder` (optional) | Renders the `hobbiesPlaceholder`                                                               |
| `educationPlaceHolder` (optional) | Renders the `educationPlaceHolder`                                                             |

 

<img width="287" alt="templates" src="https://github.com/JordyHers/flutter_resume_template/assets/49708438/c0097b65-be62-4d24-a862-d17be6a7c12d">

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





