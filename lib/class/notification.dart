class ListNotification {
  final String id;
  final String details;
  final String date;

  const ListNotification({
    required this.id,
    required this.details,
    required this.date,
  });

  factory ListNotification.fromJson(Map<String, dynamic> json) => ListNotification(
    id: json['id'],
    details: json['details'],
    date: json['date'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'details': details,
    'date': date,
  };
}