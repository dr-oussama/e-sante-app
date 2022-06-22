class Doctor {
  final String id_medcin;
  final String nom;
  final String prenom;
  final String sexe;
  final String date_naissance;
  final String telephone;
  final String addresse;
  final String e_mail;
  final String mots_de_passe;
  final String picture;

  const Doctor({
    required this.id_medcin,
    required this.nom,
    required this.prenom,
    required this.sexe,
    required this.date_naissance,
    required this.telephone,
    required this.addresse,
    required this.e_mail,
    required this.mots_de_passe,
    required this.picture,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id_medcin: json['id_medcin'],
    nom: json['nom'],
    prenom: json['prenom'],
    sexe: json['sexe'],
    date_naissance: json['date_naissance'],
    telephone: json['telephone'],
    addresse: json['addresse'],
    e_mail: json['e_mail'],
    mots_de_passe: json['mots_de_passe'],
    picture: json['picture'],
  );

  Map<String, dynamic> toJson() => {
    'id_medcin': id_medcin,
    'nom': nom,
    'prenom': prenom,
    'sexe': sexe,
    'date_naissance': date_naissance,
    'telephone': telephone,
    'addresse': addresse,
    'e_mail': e_mail,
    'mots_de_passe': mots_de_passe,
    'picture': picture,
  };
}