import 'dart:convert';
import 'patient.dart';
import 'package:http/http.dart' as http;

class PatientApi {
  static Future<List<Patient>> getPatients(String? ip,String? pass) async {
    final url = Uri.parse('http://192.168.43.231/hepius/login.php?ip="'+ip!+'"&pass="'+pass!+'"');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List patient = json.decode(response.body);

      return patient.map((json) => Patient.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<Patient>> getPatient(String? ip) async {
    final url = Uri.parse('http://192.168.43.231/hepius/patient.php?ip="'+ip!+'"');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List patient = json.decode(response.body);

      return patient.map((json) => Patient.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }


  static Future<int> changePassword(String pass1,String pass2,String id) async {
    final url = Uri.parse('http://192.168.43.231/pfe/changepass.php?pass1='+pass1+'&pass2='+pass2+'&id='+id+'');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final int state = json.decode(response.body);

      return state;
    } else {
      throw Exception();
    }
  }
}