import 'dart:convert';

import 'package:hepius/part1/dashboard/api/event.dart';
import 'package:http/http.dart' as http;

class EventApi {
  static Future<List<Event>> getEventstoxic(String cure) async {
    final url = Uri.parse('http://192.168.43.231/pfe/eventstoxic.php?id_cure='+cure+'');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List event = json.decode(response.body);

      return event.map((json) => Event.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<Event>> getEventsall(String ip) async {
    final url = Uri.parse('http://192.168.43.231/pfe/eventsall.php?IP='+ip+'');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List event = json.decode(response.body);

      return event.map((json) => Event.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }
}