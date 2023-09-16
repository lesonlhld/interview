class Blog {
  final String id;
  final String date;
  final String title;
  final String content;
  final String image;
  final String authorName;

  Blog({
    required this.id,
    required this.date,
    required this.title,
    required this.content,
    required this.image,
    required this.authorName,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id']?.toString() ?? '',
      date: json['date'] ?? '',
      title: json['title']?['rendered'] ?? '',
      content: json['content']?['rendered'] ?? '',
      image: json['image_feature'] ?? '',
      authorName: json['author_name'] ?? '',
    );
  }
}
