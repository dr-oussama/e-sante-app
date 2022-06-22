class Patient {
  final String IP;
  final String nom;
  final String prenom;
  final String sexe;
  final String date_naissance;
  final String telephone;
  final String addresse;
  final String e_mail;
  final String picture;
  final String id_cure;
  final String type_cure;
  final String date_cure;
  final String curenumber;
  final String toxicnum;
  final String nextcure;
  final String? grade;
  final String? id_bilan;

  const Patient({
    required this.IP,
    required this.nom,
    required this.prenom,
    required this.sexe,
    required this.date_naissance,
    required this.telephone,
    required this.addresse,
    required this.e_mail,
    required this.picture,
    required this.id_cure,
    required this.type_cure,
    required this.date_cure,
    required this.curenumber,
    required this.toxicnum,
    required this.nextcure,
    required this.grade,
    required this.id_bilan

  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    IP: json['IP'],
    nom: json['nom'],
    prenom: json['prenom'],
    sexe: json['sexe'],
    date_naissance: json['date_naissance'],
    telephone: json['telephone'],
    addresse: json['addresse'],
    e_mail: json['e_mail'],
    picture: json['picture'],
    id_cure: json['id_cure'],
    type_cure: json['type_cure'],
    date_cure: json['date_cure'],
    curenumber: json['curenumber'],
    toxicnum: json['toxicnum'],
    nextcure: json['nextcure'],
    grade: json['grade'],
    id_bilan: json['id']
  );

  Map<String, dynamic> toJson() => {
    'IP': IP,
    'nom': nom,
    'prenom': prenom,
    'sexe': sexe,
    'date_naissance': date_naissance,
    'telephone': telephone,
    'addresse': addresse,
    'e_mail': e_mail,
    'picture': picture,
    'id_cure': id_cure,
    'type_cure': type_cure,
    'date_cure': date_cure,
    'curenumber': curenumber,
    'toxicnum': toxicnum,
    'nextcure': nextcure,
    'grade': grade,
    'id':id_bilan
  };
}