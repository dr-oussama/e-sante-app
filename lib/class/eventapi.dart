import 'dart:convert';
import 'event.dart';
import 'package:http/http.dart' as http;

class EventApi {

  static Future<List<Event>> getEventsall(String? ip) async {
    final url = Uri.parse('http://192.168.43.231/hepius/allevent.php?IP='+ip!+'');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List event = json.decode(response.body);

      return event.map((json) => Event.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }
}