class Post {
  final int id;
  final String title;
  final String body;
  bool isRead;
  int timerDuration; // Random timer duration

  Post({
    required this.id,
    required this.title,
    required this.body,
    this.isRead = false,
    required this.timerDuration,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      timerDuration: (10 + (json['id'] % 3) * 5).toInt(), // Ensure int type
    );
  }

}
