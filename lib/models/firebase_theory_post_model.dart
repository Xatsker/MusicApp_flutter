class FirebasePostContent {
  int id;
  String title;
  String text;
  String imagePath;

  FirebasePostContent({this.id = 0, required this.title, required this.text, required this.imagePath});

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'text': text,
        'imagePath': imagePath,
      };

  static FirebasePostContent fromJson(Map<String, dynamic> json) {
    return FirebasePostContent(
      id: json['id'],
      title: json['title'],
      text: json['text'],
      imagePath: json['imagePath'],
    );
  }
}
