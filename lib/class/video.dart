class Videos {
  final String id;
  final String title;
  final String details;
  final String path;

  const Videos({
    required this.id,
    required this.title,
    required this.details,
    required this.path,
  });

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
    id: json['id'],
    title: json['title'],
    details: json['details'],
    path: json['path'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'details': details,
    'path': path,
  };
}