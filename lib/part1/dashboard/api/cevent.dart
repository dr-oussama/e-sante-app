class Cevent {
  final String id;
  final String details;
  final String date;
  final String id_medcin;

  const Cevent({
    required this.id,
    required this.details,
    required this.date,
    required this.id_medcin,
  });

  factory Cevent.fromJson(Map<String, dynamic> json) => Cevent(
    id: json['id'],
    details: json['details'],
    date: json['date'],
    id_medcin: json['id_medcin'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'details': details,
    'date': date,
    'id_medcin': id_medcin,
  };
}