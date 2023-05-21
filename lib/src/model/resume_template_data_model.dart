class TemplateData {
  /// The [TemplateData] class holds the general values available on the
  /// on the resume. They are specifically separated to make them quite
  /// modular. the [fullName] and [currentPosition] are on the top left.
  ///
  /// The  [street] , [address], [country], [email] and [phoneNumber] are
  /// all at the top right corner. Although the location depend on the
  /// template type.
  ///
  final String fullName;
  final String? currentPosition,
      street,
      address,
      country,
      email,
      phoneNumber,
      bio,
      education,
      image;
  List<ExperienceData>? experience;

  TemplateData(
      {required this.fullName,
      this.currentPosition,
      this.street,
      this.address,
      this.country,
      this.email,
      this.phoneNumber,
      this.bio,
      this.experience,
      this.education,
      this.image});
}

class ExperienceData {
  String experienceTitle;
  String experiencePlace;
  String experiencePeriod;
  String experienceLocation;
  String experienceDescription;
  ExperienceData(
      {required this.experienceTitle,
      required this.experiencePlace,
      required this.experiencePeriod,
      required this.experienceLocation,
      required this.experienceDescription});
}
