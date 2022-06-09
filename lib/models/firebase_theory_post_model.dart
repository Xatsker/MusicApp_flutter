class FirebasePostContent {
  String id;
  String title;
  String text;

  FirebasePostContent({this.id = '', required this.title, required this.text});

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'text': text,
      };

  static FirebasePostContent fromJson(Map<String, dynamic> json) {
    return FirebasePostContent(
      id: json['id'],
      title: json['title'],
      text: json['text'],
    );
  }
}
