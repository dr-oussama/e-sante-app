import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hepius/class/patient.dart';
import 'package:hepius/class/patientapi.dart';
import 'package:hepius/part1/dashboard/api/doctor.dart';
import 'package:hepius/part1/dashboard/api/doctorapi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController ipctrl,passctrl;
  bool _textobscure = false;

  List<Doctor> doctors = [];
  List<Patient> patients = [];

  void initState() {
    super.initState();
    ipctrl = new TextEditingController();
    passctrl = new TextEditingController();

  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image(image: AssetImage("assets/images/hepius2.png"),width: 290,height: 230,fit: BoxFit.fill,),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: size.width*0.7,
                      child: TextField(
                        controller: ipctrl,
                        decoration: InputDecoration(prefixIcon: Icon(Icons.account_box,),
                            hintText: 'IP'),
                      ),
                    ),


                    Container(
                      width: size.width*0.7,
                      child: TextField(
                        controller: passctrl,
                        obscureText: !_textobscure,
                        decoration: InputDecoration(prefixIcon: Icon(Icons.lock,), hintText: 'Password',suffixIcon: IconButton(icon: Icon( _textobscure ? Icons.visibility : Icons.visibility_off,color: Theme.of(context).primaryColorDark,), onPressed: () { setState(() { _textobscure = !_textobscure ; }); },)),
                      ),
                    ),

                    SizedBox(height: 10.0,),
                  ],
                ),
              ),
              TextButton(
                child: Text("Connexion"),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.only(left: 70,top: 10,right: 70,bottom: 10),
                  backgroundColor: Color(0xFF01D0C3),
                  textStyle: TextStyle(fontSize: 25),
                  primary: Colors.white,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                ),
                onPressed: () async {
                  final doctors = await DoctorApi.getDoctors(ipctrl.text,passctrl.text);
                  final patients = await PatientApi.getPatients(ipctrl.text,passctrl.text);

                  if(doctors.isNotEmpty){
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    String json = jsonEncode(doctors[0]);
                    prefs.setString('doctor', json);
                    prefs.setString('ipm', ipctrl.text);
                    Navigator.pushNamedAndRemoveUntil(context, "/home", (Route<dynamic> route) => false);
                  }else if(patients.isNotEmpty){
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    String json = jsonEncode(patients[0]);
                    prefs.setString('patient', json);
                    prefs.setString('ip', ipctrl.text);
                    print(prefs.getString('patient'));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  }else{
                    Fluttertoast.showToast(msg: "IP ou password invalide",toastLength: Toast.LENGTH_SHORT);
                  }
                },
              ),
            ],
          ),
        ),
    );
  }
}