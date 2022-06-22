import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hepius/part1/dashboard/api/chartpat.dart';

class AllchartApi {
  final List<Allchart> allchart;

  AllchartApi({required this.allchart});

  static Future<List<Allchart>> getchartpatient() async {
    final url = Uri.parse('http://192.168.43.231/pfe/getchartpatient.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List allchart = json.decode(response.body);

      return allchart.map((json) => Allchart.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<Allchart>> getchartdoctor() async {
    final url = Uri.parse('http://192.168.43.231/pfe/getchartdoc.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List allchart = json.decode(response.body);

      return allchart.map((json) => Allchart.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<Allchart>> getchartcure() async {
    final url = Uri.parse('http://192.168.43.231/pfe/getchartcure.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List allchart = json.decode(response.body);

      return allchart.map((json) => Allchart.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<Allchart>> getcharttoxic() async {
    final url = Uri.parse('http://192.168.43.231/pfe/getcharttoxic.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List allchart = json.decode(response.body);

      return allchart.map((json) => Allchart.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }



}