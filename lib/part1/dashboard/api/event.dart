class Event {
  final String id_event;
  final String nom;
  final String date;
  final String grade;

  const Event({
    required this.id_event,
    required this.nom,
    required this.date,
    required this.grade,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    id_event: json['id'],
    nom: json['nom'],
    date: json['date'],
    grade: json['grade'],
  );

  Map<String, dynamic> toJson() => {
    'id': id_event,
    'nom': nom,
    'date': date,
    'grade': grade,
  };
}