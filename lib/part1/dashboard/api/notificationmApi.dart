import 'dart:convert';
import 'package:hepius/part1/dashboard/api/notificationm.dart';
import 'package:http/http.dart' as http;

class NotifmApi {
  static Future<List<Notificationm>> getNotif(String? idm) async {
    final url = Uri.parse('http://192.168.43.231/pfe/notification.php?idm=$idm');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List notification = json.decode(response.body);

      return notification.map((json) => Notificationm.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<Notificationm>> deleteNotif(String id) async {
    final url = Uri.parse('http://192.168.43.231/pfe/deleteNotification.php?id=$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List notification = json.decode(response.body);

      return notification.map((json) => Notificationm.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }
}