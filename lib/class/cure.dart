class Cure {
  final String id_cure;
  final String type_cure;
  final String date_cure;
  final String curenumber;
  final String toxicnum;
  final String nextcure;

  const Cure({
    required this.id_cure,
    required this.type_cure,
    required this.date_cure,
    required this.curenumber,
    required this.toxicnum,
    required this.nextcure,

  });

  factory Cure.fromJson(Map<String, dynamic> json) => Cure(
    id_cure: json['id_cure'],
    type_cure: json['type_cure'],
    date_cure: json['date_cure'],
    curenumber: json['curenumber'],
    toxicnum: json['toxicnum'],
    nextcure: json['nextcure'],
  );

  Map<String, dynamic> toJson() => {
    'id_cure': id_cure,
    'type_cure': type_cure,
    'date_cure': date_cure,
    'curenumber': curenumber,
    'toxicnum': toxicnum,
    'nextcure': nextcure,
  };
}