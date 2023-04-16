import 'package:flutter_resume_template/src/model/resume_template_data_model.dart';

class Str {
  static String bioText =
      ''' Service design is a user-centered approach to creating and improving services. It involves understanding and mapping out the entire customer journey, identifying pain points and opportunities for improvement and developing solutions that meet the needs of both the customer and the business.''';

  static String myRoleText =
      'My role was to take care of customer related design, improve the quality of the product and be ready to adapt if needed.';

  static TemplateData mockData = TemplateData(
    'Matthew Smith',
    'Service Designer',
    '63 Fall Street',
    'Toronto, ST 12874',
    'Canada',
    'matthewsmith@join.com',
    '+ 1 (246)869 453 00',
    Str.bioText,
    'Creative Director',
    'at Uber',
    'Sep 2018 - Jan 2020',
    'New york City',
    Str.myRoleText,
    'Yale Gala University',
  );
}
