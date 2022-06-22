class Generalstate {
  final String id;
  final String autonome;
  final String fatigue;
  final String appetit;
  final String travail;
  final String activites;
  final String date;

  const Generalstate({
    required this.id,
    required this.autonome,
    required this.fatigue,
    required this.appetit,
    required this.travail,
    required this.activites,
    required this.date,

  });

  factory Generalstate.fromJson(Map<String, dynamic> json) => Generalstate(
    id: json['id'],
    autonome: json['autonome'],
    fatigue: json['fatigue'],
    appetit: json['appetit'],
    travail: json['travail'],
    activites: json['activites'],
    date: json['date'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'autonome': autonome,
    'fatigue': fatigue,
    'appetit': appetit,
    'travail': travail,
    'activites': activites,
    'date': date,
  };
}