import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hepius/part1/dashboard/api/doctor.dart';
import 'package:hepius/part1/dashboard/api/doctorapi.dart';
import 'package:hepius/part1/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Changepass extends StatefulWidget {
  const Changepass({Key? key}) : super(key: key);

  @override
  State<Changepass> createState() => _ChangepassState();
}

class _ChangepassState extends State<Changepass> {

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
  late TextEditingController passctrl1,passctrl2;

  @override
  void initState() {
    init();
    passctrl1 = new TextEditingController();
    passctrl2 = new TextEditingController();
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
        title: Text('Changer le mot de passe',style: TextStyle(color: Colors.white,fontSize: 20),),
        backgroundColor: Color(0xFF01D0C3),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(32),
          children: <Widget>[
            TextField(
              controller: passctrl1,
              decoration: InputDecoration(
                labelText: 'Mot de passe actuel',
                prefixIcon: Icon(Icons.mail),
                // icon: Icon(Icons.mail),
                suffixIcon: passctrl1.text.isEmpty
                    ? Container(width: 0)
                    : IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => passctrl1.clear(),
                ),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              // autofocus: true,
            ),const SizedBox(height: 24),
            TextField(
              controller: passctrl2,
              decoration: InputDecoration(
                labelText: 'Nouveau mot de passe',
                prefixIcon: Icon(Icons.mail),
                // icon: Icon(Icons.mail),
                suffixIcon: passctrl2.text.isEmpty
                    ? Container(width: 0)
                    : IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => passctrl2.clear(),
                ),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              // autofocus: true,
            ),const SizedBox(height: 24),
            TextButton(
              child: Text("Confrimer"),
              style: TextButton.styleFrom(
                padding: EdgeInsets.only(left: 70,top: 10,right: 70,bottom: 10),
                backgroundColor: Color(0xFF01D0C3),
                textStyle: TextStyle(fontSize: 20),
                primary: Colors.white,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
              ),
              onPressed: () async {
                final int statement = await DoctorApi.changePassword(passctrl1.text,passctrl2.text,doctor.id_medcin);
                if(statement == 0){
                  Fluttertoast.showToast(msg: "Wrong password",toastLength: Toast.LENGTH_SHORT);
                }else if(statement == 1){
                  Fluttertoast.showToast(msg: "Password too short",toastLength: Toast.LENGTH_SHORT);
                }
                else if(statement == 2){
                  Fluttertoast.showToast(msg: "Password changed",toastLength: Toast.LENGTH_SHORT);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home1()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}