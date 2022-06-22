class Ord {
  final String id;
  final String toxicite;
  final String med;
  final String date;

  const Ord({
    required this.id,
    required this.toxicite,
    required this.med,
    required this.date,
  });

  factory Ord.fromJson(Map<String, dynamic> json) => Ord(
    id: json['id'],
    toxicite: json['toxicite'],
    med: json['med'],
    date: json['date'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'toxicite': toxicite,
    'med': med,
    'date': date,
  };
}