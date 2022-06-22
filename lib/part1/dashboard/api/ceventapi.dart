import 'dart:convert';


import 'package:hepius/part1/dashboard/api/cevent.dart';
import 'package:http/http.dart' as http;

class CeventApi {
  static Future<List<Cevent>> getCEvents(String id_medcin) async {
    final url = Uri.parse('http://192.168.43.231/pfe/calendar.php?id_medcin='+id_medcin+'');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List cevent = json.decode(response.body);

      return cevent.map((json) => Cevent.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }
  static Future<int> insertevent(String id_medcin,String date,String details) async {
    final url = Uri.parse('http://192.168.43.231/pfe/calendaradd.php?id_medcin='+id_medcin+'&details='+details+'&date='+date+'');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final int state = json.decode(response.body);

      return state;
    } else {
      throw Exception();
    }
  }

  static Future<int> deleteevent(String id) async {
    final url = Uri.parse('http://192.168.43.231/pfe/calendardelete.php?id='+id+'');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final int state = json.decode(response.body);

      return state;
    } else {
      throw Exception();
    }
  }

}