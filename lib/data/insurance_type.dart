class InsuranceType {
  String title;
  String description;
  List<String>? colors;
  String imagePath;

  InsuranceType({
    required this.title,
    required this.description,
    required this.imagePath,
    this.colors,
  });


}
