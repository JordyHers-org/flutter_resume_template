import 'package:flutter_resume_template/src/model/resume_template_data_model.dart';

class Str {
  static String bioText =
      ''' Service design is a user-centered approach to creating and improving services. It involves understanding and mapping out the entire customer journey, identifying pain points and opportunities for improvement and developing solutions that meet the needs of both the customer and the business.''';

  static String myRoleText =
      'My role was to take care of customer related design, improve the quality of the product and be ready to adapt if needed.';

  static TemplateData mockData = TemplateData(
      fullName: 'Matthew Smith',
      currentPosition: 'Service Designer',
      street: '63 Fall Street',
      address: 'Toronto, ST 12874',
      country: 'Canada',
      email: 'matthewsmith@join.com',
      phoneNumber: '+ 1 (246)869 453 00',
      bio: Str.bioText,
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
          experienceLocation: 'UK . London',
          experiencePeriod: 'Sep 2022 - Dec 2023',
          experiencePlace: 'Freelancer',
          experienceDescription:
              '''Worked hand to hand with backend dev and UI/Ux designer to deliver medical device. • GraphQL • GitLab • Posthog • Fastlane • Dynamic element ''',
        ),
        ExperienceData(
          experienceTitle: 'Flutter Developer',
          experienceLocation: 'UK . London',
          experiencePeriod: 'Sep 2022 - Dec 2023',
          experiencePlace: 'Freelancer',
          experienceDescription:
              '''Worked hand to hand with backend dev and UI/Ux designer to deliver medical device. • GraphQL • GitLab • Posthog • Fastlane • Dynamic element ''',
        ),
      ],
      education: 'Yale Gala University',
      image: resumeHeader);
  static String backgroundImage =
      'https://images.pexels.com/photos/10319780/pexels-photo-10319780.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';
  static String resumeHeader =
      'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';
}
