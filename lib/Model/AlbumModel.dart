class Album {
  final String content;
  final String id;
  final String title;

  const Album({
    required this.content,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      content: json['content'],
      id: json['id'],
      title: json['title'],
    );
  }
}
