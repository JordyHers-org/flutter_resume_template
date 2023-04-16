class TemplateData {
  /// The [TemplateData] class holds the general values available on the
  /// on the resume. They are specifically separated to make them quite
  /// modular. the [fullName] and [currentPosition] are on the top left.
  ///
  /// The  [street] , [address], [country], [email] and [phoneNumber] are
  /// all at the top right corner. Although the location depend on the
  /// template type.
  ///
  final String fullName,
      currentPosition,
      street,
      address,
      country,
      email,
      phoneNumber,
      bio,
      experienceTitle,
      experiencePlace,
      experiencePeriod,
      experienceLocation,
      experienceDescription,
      education;

  TemplateData(
      this.fullName,
      this.currentPosition,
      this.street,
      this.address,
      this.country,
      this.email,
      this.phoneNumber,
      this.bio,
      this.experienceTitle,
      this.experiencePlace,
      this.experiencePeriod,
      this.experienceLocation,
      this.experienceDescription,
      this.education);
}
