import 'package:flutter_resume_template/flutter_resume_template.dart';

class MockData {
  static TemplateData data = TemplateData(
      fullName: 'Jordy Hershel Igondjo',
      currentPosition: 'Flutter Developer',
      street: 'Curvy Str. 53',
      address: 'Berlin, 14568',
      country: 'Germany',
      email: 'jordyhershel@wuerth.com',
      phoneNumber: '+ 49 (106)341 753 12',
      bio: 'I am a talented young mobile application developer .'
          ' I have been developing Mobile application for several years now and'
          ' I do have a solid background in Developing tools. I am keen to '
          'learn and that would be a pleasure to be a member of your company.'
          ' I am currently working at This awesome company',
      experience: [
        ExperienceData(
          experienceTitle: 'Software Engineer',
          experienceLocation: 'at Mindable Health',
          experiencePeriod: 'Aug 2021 - Dec 2023',
          experiencePlace: 'Berlin',
          experienceDescription:
              '''Worked hand to hand with backend dev and UI/Ux designer to deliver medical device. • GraphQL • GitLab • Posthog • Fastlane • Dynamic element ''',
        ),
        ExperienceData(
          experienceTitle: 'Product Design',
          experienceLocation: 'UK ',
          experiencePeriod: 'Aug 2021 - Dec 2023',
          experiencePlace: 'London',
          experienceDescription:
              '''Worked hand to hand with backend dev and UI/Ux designer to deliver medical device. • GraphQL • GitLab • Posthog • Fastlane • Dynamic element ''',
        ),
      ],
      educationDetails: [
        Education('Bachelor Degree', 'Oxford University'),
        Education('Post Graduate Degree', 'Oxford University'),
      ],
      languages: [
        Language('English', 3),
        Language('French', 4),
      ],
      image:
          'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
}
