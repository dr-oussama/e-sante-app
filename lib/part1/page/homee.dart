import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hepius/part1/dashboard/api/doctor.dart';
import 'package:hepius/part1/dashboard/api/notificationm.dart';
import 'package:hepius/part1/dashboard/api/notificationmApi.dart';
import 'package:hepius/part1/dashboard/calendar.dart';
import 'package:hepius/part1/dashboard/charts.dart';
import 'package:hepius/part1/dashboard/notification.dart';
import 'package:hepius/part1/dashboard/stories.dart';
import 'package:hepius/part1/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../dashboard/patientchoice.dart';



class Homee extends StatefulWidget {
  const Homee({Key? key}) : super(key: key);

  @override
  State<Homee> createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
  List<Notificationm> Notifications= [];
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
    setState(() { this.doctor = Doctor.fromJson(doctormap);});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF0F4FF),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0,left: 15,right: 15),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  Dashboard()),
                        );
                      },
                      icon: Icon(Icons.align_horizontal_left,color: Color(0xFF01D0C3),size: 30,)
                  ),
                  IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Notifm()),
                        );
                      },
                      icon: Stack(children: [
                        Icon(Icons.notifications,color: Color(0xFF01D0C3),size: 30,),
                        Positioned(
                          right: 0,
                          child: Visibility(
                            visible: true,
                            child: Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              constraints: BoxConstraints(
                                minWidth: 12,
                                minHeight: 12,
                              ),
                              /*child: new Text(
                                          '3',
                                          style: new TextStyle(
                                            color: Colors.white,
                                            fontSize: 8,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),*/
                            ),
                          ),
                        )
                      ])
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Welcome',style: TextStyle(color: Color(0xFF018786),fontSize: 35,fontFamily: 'PT'),),
                    Text(doctor.prenom,style: TextStyle(color: Color(0xFF018786),fontSize: 20,fontFamily: 'PT'),),
                  ],
                ),
              ],
            ),SizedBox(height: size.height*.04),
            Image.asset('assets/images/womenbody.jpg',height: 460,),
          ],
        ),
      ),
    );
  }
}

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(),
    );
  }
}

class Dashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0,left: 15),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>   const Home1()),
                      );
                    },
                    icon: Icon(Icons.align_horizontal_left,color: Colors.white,size: 30,)
                ),
              ],
            ),
          ),
          SizedBox(height: size.height*.08),
          Padding(
            padding:  EdgeInsets.only(left: 45),
            child: Text("Dashboard",style: TextStyle(color: Colors.white,fontSize: 25),),
          ),
          SizedBox(height: size.height*.08),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Color(0xFFF0F4FF),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0),topRight: Radius.circular(75.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0,right: 30,left: 30),
              child: GridView.count(
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  primary: false,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Patientchoice()),
                        );
                      },
                      child: Card(

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        elevation: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/patientss.png',height: 100,),
                            Text('Patients',style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Charts()),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        elevation: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/charts.png',height: 100,),
                            Text('Statistics',style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Calendar()),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        elevation: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/calendar.png',height: 100,),
                            Text('Calendar',style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Stories()),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        elevation: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/books.png',height: 100,),
                            Text('Histoires',style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                  ],
                  crossAxisCount: 2),
            ),
          ),
        ],
      ),
    );
  }
}
