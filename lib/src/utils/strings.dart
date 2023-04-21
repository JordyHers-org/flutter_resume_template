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
    experienceTitle: 'Creative Director',
    experiencePlace: 'at Uber',
    experiencePeriod: 'Sep 2018 - Jan 2020',
    experienceLocation: 'New york City',
    experienceDescription: Str.myRoleText,
    education: 'Yale Gala University',
  );

  static String resumeHeader =
      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';
}
