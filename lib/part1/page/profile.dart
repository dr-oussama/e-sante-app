import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hepius/part1/dashboard/api/doctor.dart';
import 'package:hepius/part1/dashboard/changepass.dart';
import 'package:hepius/part1/dashboard/personalinfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Doctor doctor = new Doctor(id_medcin: '', nom: '', prenom: '', sexe: '', date_naissance: '', telephone: '', addresse: '', e_mail: '', mots_de_passe: '', picture: '');

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
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height* .340,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                fit: BoxFit.fill,
                image: AssetImage('assets/images/h.png',),
              ),
            ),
          ),
          Center(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 300,
                    margin: EdgeInsets.only(top: size.height*.045,bottom: size.height*.07),
                    padding: const EdgeInsets.all(25.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xFFF0F4FF),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                     ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage('http://192.168.43.231/pfe/image/${doctor.picture}'),
                          radius: 45,
                        ),
                        Text(doctor.nom+' '+doctor.prenom,style: TextStyle(fontSize: 17),)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: GridView.count(
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          primary: false,
                          children: <Widget>[
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Personalinfo()),
                                );
                              },
                              child: Card(

                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                elevation: 4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset('assets/images/personaldata.png',height: 100,),
                                    Text('Personal data',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Changepass()),
                                );
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                elevation: 4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset('assets/images/password.png',height: 100,),
                                    Text('Change password',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset('assets/images/support.png',height: 100,),
                                  Text('Support',style: TextStyle(fontSize: 15),)
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                prefs.remove('doctor');
                                Navigator.pushNamedAndRemoveUntil(context, "/login", (Route<dynamic> route) => false);
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                elevation: 4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset('assets/images/logout.png',height: 100,),
                                    Text('Logout',style: TextStyle(fontSize: 15),)
                                  ],
                                ),
                              ),
                            ),
                          ],
                          crossAxisCount: 2),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
