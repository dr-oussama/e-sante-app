import 'dart:convert';

import 'package:hepius/part1/dashboard/api/patient.dart';
import 'package:http/http.dart' as http;

class PatientsApi {
  static Future<List<Patient>> getPatients(String query) async {
    final url = Uri.parse('http://192.168.43.231/pfe/allpatient.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List patients = json.decode(response.body);

      return patients.map((json) => Patient.fromJson(json)).where((patient) {
        final titleLower = patient.nom.toLowerCase()+" "+patient.prenom.toLowerCase();
        final IPLower = patient.IP.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) || IPLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<Patient>> getPatientscureday(String query) async {
    final url = Uri.parse('http://192.168.43.231/pfe/cureday.php');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List patients = json.decode(response.body);

      return patients.map((json) => Patient.fromJson(json)).where((patient) {
        final titleLower = patient.nom.toLowerCase()+" "+patient.prenom.toLowerCase();
        final IPLower = patient.IP.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) || IPLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }

}