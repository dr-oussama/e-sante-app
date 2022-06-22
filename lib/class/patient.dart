class Patient {
  final String? IP;
  final String? nom;
  final String? prenom;
  final String? sexe;
  final String? date_naissance;
  final String? telephone;
  final String? addresse;
  final String? e_mail;
  final String? mots_de_passe;
  final String? picture;
  final String h_min;
  final String h_max;
  final String p_min;
  final String p_max;
  final String n_min;
  final String n_max;

  const Patient({
    required this.IP,
    required this.nom,
    required this.prenom,
    required this.sexe,
    required this.date_naissance,
    required this.telephone,
    required this.addresse,
    required this.e_mail,
    required this.mots_de_passe,
    required this.picture,
    required this.h_min,
    required this.h_max,
    required this.p_min,
    required this.p_max,
    required this.n_min,
    required this.n_max,

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
    mots_de_passe: json['mots_de_passe'],
    picture: json['picture'],
    h_min: json['h_min'],
    h_max: json['h_max'],
    p_min: json['p_min'],
    p_max: json['p_max'],
    n_min: json['n_min'],
    n_max: json['n_max'],

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
    'mots_de_passe': mots_de_passe,
    'picture': picture,
    'h_min': h_min,
    'h_max': h_max,
    'p_min': p_min,
    'p_max': p_max,
    'n_min': n_min,
    'n_max': n_max,

  };
}