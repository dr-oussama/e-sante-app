class Allchart {
  final String year;
  final String number;


  const Allchart({
    required this.year,
    required this.number,
  });

  factory Allchart.fromJson(Map<String, dynamic> json) => Allchart(
    year: json['year'],
    number: json['number'],

  );

  Map<String, dynamic> toJson() => {
    'year': year,
    'number': number,
  };
}