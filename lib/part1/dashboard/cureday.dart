import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hepius/part1/dashboard/etatgeneral.dart';
import 'package:hepius/part1/dashboard/medicalf.dart';
import 'package:hepius/part1/dashboard/searchwidget.dart';
import 'package:hepius/part1/dashboard/toxicities.dart';
import 'package:url_launcher/url_launcher.dart';

import 'api/patient.dart';
import 'api/patientapi.dart';

class Cureday extends StatefulWidget {
  const Cureday({Key? key}) : super(key: key);

  @override
  State<Cureday> createState() => _CuredayState();
}

class _CuredayState extends State<Cureday> {
  List<Patient> patients = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  bilan(String? id) async {
    var url = 'http://192.168.43.231/hepius/pdfBilan.php?id=$id';
    launch(url);
  }

  void debounce(
      VoidCallback callback, {
        Duration duration = const Duration(milliseconds: 1000),
      }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final patients = await PatientsApi.getPatientscureday(query);

    setState(() => this.patients = patients);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cure's day",style: TextStyle(color: Colors.white,fontSize: 20),),
        backgroundColor: Color(0xFF01D0C3),

      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  buildSearch(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: patients.length,
                      itemBuilder: (context, index) {
                        final patient = patients[index];
                        DateTime cureDt = DateTime.parse(patient.date_cure);
                        String? grade = patient.grade;
                        var currDt = DateTime.now();
                        if(grade == "valide"){
                          if(cureDt.year == currDt.year && cureDt.month == currDt.month && cureDt.day == currDt.day){
                            return buildBookgreen(patient);
                          }else{
                            return buildBookwhite(patient);
                          }
                        }else{
                          return buildBookred(patient);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Patient ID or Patient Name',
    onChanged: searchBook,
  );

  Future searchBook(String query) async => debounce(() async {
    final patients = await PatientsApi.getPatientscureday(query);

    if (!mounted) return;

    setState(() {
      this.query = query;
      this.patients = patients;
    });
  });

  Widget buildBookgreen(Patient patient) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 3,
      child: ListTile(
        tileColor: Color(0xFF98E887),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              'http://192.168.43.231/hepius/${patient.picture}'
          ),
        ),
        title: Text(patient.nom+" "+patient.prenom),
        subtitle: Text("Cure : "+patient.curenumber+"    Toxcities : "+patient.toxicnum),
        trailing: IconButton(
          icon: const Icon(Icons.download_rounded),
          onPressed: () {
            bilan(patient.id_bilan);
          },
        ),
        onTap: (){
          Navigator.push(context, new MaterialPageRoute(builder: (context) => DetailPage2(patient)));
        },
      ),

    ),
  );


  Widget buildBookred(Patient patient) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 3,
      child: ListTile(
        tileColor: Color(0xFFE05B5B),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              'http://192.168.43.231/hepius/${patient.picture}'
          ),
        ),
        title: Text(patient.nom+" "+patient.prenom),
        subtitle: Text("Cure : "+patient.curenumber+"    Toxcities : "+patient.toxicnum),
        trailing: IconButton(
          icon: const Icon(Icons.download_rounded),
          onPressed: () {
            bilan(patient.id_bilan);
          },
        ),
        onTap: (){
          Navigator.push(context, new MaterialPageRoute(builder: (context) => DetailPage2(patient)));
        },
      ),

    ),
  );

  Widget buildBookwhite(Patient patient) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 3,
      child: ListTile(
        tileColor: Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              'http://192.168.43.231/hepius/${patient.picture}'
          ),
        ),
        title: Text(patient.nom+" "+patient.prenom),
        subtitle: Text("Cure : "+patient.curenumber+"    Toxcities : "+patient.toxicnum),
        trailing: IconButton(
          icon: const Icon(Icons.download_rounded),
          onPressed: () {
            bilan(patient.id_bilan);
          },
        ),
        onTap: (){
          Navigator.push(context, new MaterialPageRoute(builder: (context) => DetailPage2(patient)));
        },
      ),

    ),
  );
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

class DetailPage2 extends StatelessWidget {

  final Patient patient;

  DetailPage2(this.patient);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('',style: TextStyle(color: Colors.white,fontSize: 20),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(colors: [const Color(0xFF01D0C3),const Color(
              0xFF02958E)],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              stops: [0.0,1.0],
              tileMode: TileMode.clamp
          ),
        ),
        child: Center(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 300,
                  margin: EdgeInsets.only(top: 20.0),
                  padding: const EdgeInsets.all(25.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0xFFFFFFFF),
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
                        backgroundImage: NetworkImage('http://192.168.43.231/hepius/${patient.picture}'),
                        radius: 50,
                      ),
                      Text(patient.nom+" "+patient.prenom,style: TextStyle(fontSize: 17),)
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        primary: false,
                        children: <Widget>[
                          InkWell(
                            onTap: (){
                              Navigator.push(context, new MaterialPageRoute(builder: (context) => Toxicities( patient: patient,)));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset('assets/images/virus.png',height: 100,),
                                  Text('Toxicities',style: TextStyle(fontSize: 15),)
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, new MaterialPageRoute(builder: (context) => Medicalf( patient: patient,)));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset('assets/images/medreport.png',height: 100,),
                                  Text('Medical folder',style: TextStyle(fontSize: 15),)
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, new MaterialPageRoute(builder: (context) => Patientinfo2(patient)));
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
                              Navigator.push(context, new MaterialPageRoute(builder: (context) => Etatgeneral(patient: patient,)));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset('assets/images/patientss.png',height: 100,),
                                  Text('General state',style: TextStyle(fontSize: 15),)
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
      ),
    );
  }
}

class Patientinfo2 extends StatelessWidget {

  final Patient patient;

  Patientinfo2(this.patient);

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
                    child: Text("ID :  "+patient.IP, style: TextStyle(fontSize: 15,color: Color(
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
                    child: Text("Sexe :  "+patient.sexe, style: TextStyle(fontSize: 15,color: Color(
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
                    child: Text("Nom :  "+patient.nom, style: TextStyle(fontSize: 15,color: Color(
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
                    child: Text("Prenom :  "+patient.prenom, style: TextStyle(fontSize: 15,color: Color(
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
              child: Text("Date de Naissance :  "+patient.date_naissance, style: TextStyle(fontSize: 15,color: Color(
                  0xFF6F6D6D)),),
              padding: const EdgeInsets.all(19.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Color(0xFFF0F4FF),
                border: Border.all(color: Colors.grey),
              ),
            ),const SizedBox(height: 24),
            Container(
              child: Text("Telephone :  "+patient.telephone, style: TextStyle(fontSize: 15,color: Color(
                  0xFF6F6D6D)),),
              padding: const EdgeInsets.all(19.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Color(0xFFF0F4FF),
                border: Border.all(color: Colors.grey),
              ),
            ),const SizedBox(height: 24),
            Container(
              child: Text("Addresse :  "+patient.addresse, style: TextStyle(fontSize: 15,color: Color(
                  0xFF6F6D6D)),),
              padding: const EdgeInsets.all(19.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Color(0xFFF0F4FF),
                border: Border.all(color: Colors.grey),
              ),
            ),const SizedBox(height: 24),
            Container(
              child: Text("Email :  "+patient.e_mail, style: TextStyle(fontSize: 15,color: Color(
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
