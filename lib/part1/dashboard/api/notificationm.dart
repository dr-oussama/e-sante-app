class Notificationm {
  final String id;
  final String toxicite;
  final String date;
  final String ip;
  final String nom;
  final String prenom;

  const Notificationm({
    required this.id,
    required this.toxicite,
    required this.date,
    required this.ip,
    required this.nom,
    required this.prenom,
  });

  factory Notificationm.fromJson(Map<String, dynamic> json) => Notificationm(
    id: json['id'],
    toxicite: json['toxicite'],
    date: json['date'],
    ip: json['ip'],
    nom: json['nom'],
    prenom: json['prenom'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'toxicite': toxicite,
    'date': date,
    'ip': ip,
    'nom': nom,
    'prenom': prenom,
  };
}