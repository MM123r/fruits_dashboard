class ReviewModel {
  final String name;
  final String image;
  final String ratting;
  final String date;
  final String reviewDescription;

  ReviewModel(
      {required this.name,
      required this.image,
      required this.ratting,
      required this.date,
      required this.reviewDescription});

  factory ReviewModel.fromEntity(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      ratting: json['ratting'],
      date: json['date'],
      reviewDescription: json['reviewDescription'],
    );
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'ratting': ratting,
      'date': date,
      'reviewDescription': reviewDescription,
    };
  }
}
