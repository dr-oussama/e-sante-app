import 'dart:convert';
import 'package:hepius/class/notification.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NotifApi {
  static Future<List<ListNotification>> getNotif(String? IP) async {
    final url = Uri.parse('http://192.168.43.231/hepius/notification.php?ip=$IP');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List notification = json.decode(response.body);

      return notification.map((json) => ListNotification.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<ListNotification>> deleteNotif(String? id) async {
    final url = Uri.parse('http://192.168.43.231/hepius/deleteNotification.php?id=$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List notification = json.decode(response.body);

      return notification.map((json) => ListNotification.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }

  static Future<void> insertNotifm(String toxicite)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    http.post(Uri.parse("http://192.168.43.231/hepius/insertnotifm.php"), body: {
      "toxicite": toxicite,
      "ip": prefs.getString('ip'),
    });
  }
}