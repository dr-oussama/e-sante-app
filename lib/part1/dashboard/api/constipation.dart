class Constipation {
  final String id_constipation;
  final String frequence;
  final String duree;
  final String douleur;
  final String digestif;
  final String vomissement;
  final String fievre;
  final String date;
  final String id_cure;

  const Constipation({
    required this.id_constipation,
    required this.frequence,
    required this.duree,
    required this.douleur,
    required this.digestif,
    required this.vomissement,
    required this.fievre,
    required this.date,
    required this.id_cure,

  });

  factory Constipation.fromJson(Map<String, dynamic> json) => Constipation(
    id_constipation: json['id_constipation'],
    frequence: json['frequence'],
    duree: json['duree'],
    douleur: json['douleur'],
    digestif: json['digestif'],
    vomissement: json['vomissement'],
    fievre: json['fievre'],
    date: json['date'],
    id_cure: json['id_cure'],
  );

  Map<String, dynamic> toJson() => {
    'id_constipation': id_constipation,
    'frequence': frequence,
    'duree': duree,
    'douleur': douleur,
    'digestif': digestif,
    'vomissement': vomissement,
    'fievre': fievre,
    'date': date,
    'id_cure': id_cure,
  };
}