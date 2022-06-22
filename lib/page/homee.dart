import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hepius/class/cureApi.dart';
import 'package:hepius/generals/generals.dart';
import 'package:hepius/page/analyse.dart';
import 'package:hepius/page/medicalf.dart';
import 'package:hepius/page/ordonnance.dart';
import 'package:hepius/page/storys.dart';
import 'package:hepius/page/notification.dart';
import 'package:hepius/toxicite/type.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../class/patient.dart';
import '../class/patientapi.dart';
import 'package:http/http.dart' as http;


class Homee extends StatefulWidget {
  const Homee({Key? key}) : super(key: key);

  @override
  State<Homee> createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
  final currentdate = DateTime.now().day;
  bool visible = false;
  Patient patient = const Patient(IP: '',
      nom: '',
      prenom: '',
      sexe: '',
      date_naissance: '',
      telephone: '',
      addresse: '',
      e_mail: '',
      mots_de_passe: '',
      picture: '',
      h_min: '',
      h_max: '',
      p_min: '',
      p_max: '',
      n_min: '',
      n_max: '');

  @override
  void initState() {
    init();
    super.initState();
        SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
          a();
        });
  }

  Future init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('patient'));
    var json = prefs.getString('patient');
    Map<String, dynamic> patientmap = jsonDecode(json!);
    setState(() => patient = Patient.fromJson(patientmap));
    print(patient.IP);
    print('http://192.168.43.231/hepius/${patient.picture}');
    test();
  }

  void test()async{
    setState(() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final patients = await PatientApi.getPatient(patient.IP.toString());
      String json = jsonEncode(patients[0]);
      prefs.setString('patient', json);
      final cure = await CureApi.getOneCure(patient.IP);
    });
  }

  Future<void> insertNotif()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    http.post(Uri.parse("http://192.168.43.231/hepius/insertNotif.php"), body: {
      "details": 'خاصك دير التحاليل اليوم',
      "ip": prefs.getString('ip'),
    });
    prefs.setBool('visible', true);
    setState(() {
      visible = true;
    });
  }

  Future<void> view()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('visible', false);
    setState(() {
      visible = false;
    });
  }


  void a()async{
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(1==1){
      insertNotif();
    }
    //if(prefs.getInt('day') == null || prefs.getInt('day') != currentdate){
     // prefs.setInt('day', currentdate);
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("كيفاش كتحسي اليوم؟",textAlign: TextAlign.center,),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: w*.2,
                child: FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  color: Colors.greenAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  child: const Text('مزيان',style: TextStyle(color: Colors.white,fontSize: 18),)),
              ),SizedBox(
                width: w*.2,
                child: FlatButton(
                    onPressed: (){
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const GeneralState()),);
                    },
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    child: const Text('مريضة',style: TextStyle(color: Colors.white,fontSize: 18),)),
              ),
            ],
          ),
        ),
      );
    //}
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                fit: BoxFit.fill,
                image: AssetImage('assets/images/h.png',),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 64,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          verticalDirection: VerticalDirection.down,
                          children: <Widget>[
                            IconButton(
                                onPressed: ()async{
                                  setState((){
                                    view();
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Notif()),
                                  );
                                },
                                icon: Stack(children: [
                                  Icon(Icons.notifications_rounded,color: Colors.white,size: 30,),
                                  Positioned(
                                    right: 0,
                                    child: Visibility(
                                      visible: visible,
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
                            )

                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                const Text('السلام عليكم' , style: TextStyle(fontFamily: 'montserrat',color: Colors.white,fontSize: 16),),
                                Text('${patient.nom} ${patient.prenom}' , style: const TextStyle(fontFamily: 'arabic1',color: Colors.white,fontSize: 18),),
                              ],
                            ),
                            const SizedBox(width: 16,),
                            CircleAvatar(
                                radius: 32,
                                backgroundImage: NetworkImage('http://192.168.43.231/hepius/${patient.picture}'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h*.07,
                  ),
                  Expanded(
                    child: GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: (1/.9),
                        primary: false,
                        children: <Widget>[
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Type()),
                              );
                            },
                            child: Card(

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                              ),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset('assets/images/virus.png',height: h*.14,),
                                  const Text(' التسمم',style: TextStyle(fontSize: 18),)
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Medicalf()),
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset('assets/images/medreport.png',height: h*.14,),
                                  const Text('الملف الطبي',style: TextStyle(fontSize: 18),)
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const GeneralState()),
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset('assets/images/generals.png',height: h*.14,),
                                  const Text('الحالة العامة',style: TextStyle(fontSize: 18),)
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Analyse()),
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset('assets/images/bilan.png',height: h*.14,),
                                  const Text('الفحص الطبي',style: TextStyle(fontSize: 18),)
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ListOrd()),
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset('assets/images/journal.png',height: h*.14,),
                                  const Text('السجل',style: TextStyle(fontSize: 18),)
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Story()),
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset('assets/images/books.png',height: h*.14,),
                                  const Text('القصص',style: TextStyle(fontSize: 18),)
                                ],
                              ),
                            ),
                          ),
                        ],
                        crossAxisCount: 2),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(),
    );
  }
}
