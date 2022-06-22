import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hepius/part1/dashboard/api/doctor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Personalinfo extends StatefulWidget {
  const Personalinfo({Key? key}) : super(key: key);

  @override
  State<Personalinfo> createState() => _PersonalinfoState();
}

class _PersonalinfoState extends State<Personalinfo> {

  Doctor doctor = new Doctor(id_medcin: '',
      nom: '',
      prenom: '',
      sexe: '',
      date_naissance: '',
      telephone: '',
      addresse: '',
      e_mail: '',
      mots_de_passe: '',
      picture: '');

  @override
  void initState() {
    init();
    super.initState();
  }

  Future init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var json = prefs.getString('doctor');
    Map<String, dynamic> doctormap = jsonDecode(json!);
    setState(() => this.doctor = Doctor.fromJson(doctormap));
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal data',style: TextStyle(color: Colors.white,fontSize: 20),),
        backgroundColor: Color(0xFF01D0C3),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(32),
          children: <Widget>[
            Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: size.width*.4,
                    child: Text("ID :  "+doctor.id_medcin, style: TextStyle(fontSize: 15,color: Color(
                        0xFF6F6D6D)),),
                    padding: const EdgeInsets.all(19.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xFFF0F4FF),
                      border: Border.all(color: Colors.grey),
                    ),
                  ),const SizedBox(height: 24),
                  Container(
                    width: size.width*.4,
                    child: Text("Sexe :  "+doctor.sexe, style: TextStyle(fontSize: 15,color: Color(
                        0xFF6F6D6D)),),
                    padding: const EdgeInsets.all(19.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xFFF0F4FF),
                      border: Border.all(color: Colors.grey),
                    ),
                  ),const SizedBox(height: 24),
                ],
              ),
            ),const SizedBox(height: 24),
            Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: size.width*.4,
                    child: Text("Nom :  "+doctor.nom, style: TextStyle(fontSize: 15,color: Color(
                        0xFF6F6D6D)),),
                    padding: const EdgeInsets.all(19.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xFFF0F4FF),
                      border: Border.all(color: Colors.grey),
                    ),
                  ),const SizedBox(height: 24),
                  Container(
                    width: size.width*.4,
                    child: Text("Prenom :  "+doctor.prenom, style: TextStyle(fontSize: 15,color: Color(
                        0xFF6F6D6D)),),
                    padding: const EdgeInsets.all(19.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xFFF0F4FF),
                      border: Border.all(color: Colors.grey),
                    ),
                  ),const SizedBox(height: 24),
                ],
              ),
            ),const SizedBox(height: 24),
            Container(
              child: Text("Date de Naissance :  "+doctor.date_naissance, style: TextStyle(fontSize: 15,color: Color(
                  0xFF6F6D6D)),),
              padding: const EdgeInsets.all(19.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Color(0xFFF0F4FF),
                border: Border.all(color: Colors.grey),
              ),
            ),const SizedBox(height: 24),
            Container(
              child: Text("Telephone :  "+doctor.telephone, style: TextStyle(fontSize: 15,color: Color(
                  0xFF6F6D6D)),),
              padding: const EdgeInsets.all(19.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Color(0xFFF0F4FF),
                border: Border.all(color: Colors.grey),
              ),
            ),const SizedBox(height: 24),
            Container(
              child: Text("Addresse :  "+doctor.addresse, style: TextStyle(fontSize: 15,color: Color(
                  0xFF6F6D6D)),),
              padding: const EdgeInsets.all(19.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Color(0xFFF0F4FF),
                border: Border.all(color: Colors.grey),
              ),
            ),const SizedBox(height: 24),
            Container(
              child: Text("Email :  "+doctor.e_mail, style: TextStyle(fontSize: 15,color: Color(
                  0xFF6F6D6D)),),
              padding: const EdgeInsets.all(19.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Color(0xFFF0F4FF),
                border: Border.all(color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}