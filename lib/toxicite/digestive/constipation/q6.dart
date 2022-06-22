
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hepius/class/notificationApi.dart';
import 'package:hepius/toxicite/digestive/constipation/conseils.dart';
import 'package:hepius/toxicite/digestive/constipation/ordonnance.dart';
import 'package:hepius/toxicite/digestive/constipation/pdf.dart';
import 'package:hepius/toxicite/digestive/constipation/urgence.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../class/patient.dart';



class Cq6 extends StatefulWidget {
  //const Cq5({Key? key}) : super(key: key);
  String rep1='';
  String rep2='';
  String rep3='';
  String rep4='';
  String rep5='';
  Cq6(this.rep1 , this.rep2 , this.rep3 , this.rep4 , this.rep5);

  @override
  State<Cq6> createState() => _Cq6State(rep1,rep2,rep3,rep4,rep5);
}

class _Cq6State extends State<Cq6> {
  String rep1='';
  String rep2='';
  String rep3='';
  String rep4='';
  String rep5='';
  String rep6='';
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
  }

  Future init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('patient'));
    var json = prefs.getString('patient');
    Map<String, dynamic> patientmap = jsonDecode(json!);
    setState(() => patient = Patient.fromJson(patientmap));
    print(patient.IP);
  }

  Future<void> insertOrdonnance()async {
    http.post(Uri.parse("http://192.168.43.231/hepius/ordonnance.php"), body: {
      "toxicite": 'constipation',
      "med": 'doliprane',
      "ip": patient.IP,
    });
  }

  _Cq6State(this.rep1,this.rep2,this.rep3,this.rep4,this.rep5);

  Future<void> insertData(int i)async {
    http.post(Uri.parse("http://192.168.43.231/hepius/toxicite/constipation.php"), body: {
      "q1": rep1,
      "q2": rep2,
      "q3": rep3,
      "q4": rep4,
      "q5": rep5,
      "q6": rep6,
      "ip": patient.IP,
      "grade": i.toString(),
    });
  }

  Widget customRadio(String text , int index , Color color,double w)
  {
    return SizedBox(
      width: w,
      child: FlatButton(
        onPressed: (){
           rep6 = text;

           if(rep3=='نعم' || rep4=='نعم' || rep5=='نعم' || rep6=='اكثر من 37')
             {
               insertData(3);
               NotifApi.insertNotifm('constipation');
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) =>  const Urgence()),
               );
             }
           else if(rep2 == 'اكثر من 3 ايام')
             {
               insertData(2);
               insertOrdonnance();
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => Ordonnance(() => Tips())),
               );
             }
           else{
             insertData(1);
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) =>  const Tips()),
             );
           }
        },
        height: 50,
        color: color,
        child: Text(
          text,style: const TextStyle(color: Colors.white,fontSize: 20),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('الامساك',style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff01D0C3),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0,top: 60,right: 0,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('كاتحسي بالسخانة؟',style: TextStyle(fontSize: 20),),
                    IconButton(onPressed: (){},
                        icon: const Icon(
                            Icons.speaker_phone
                        ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/types/digestive/fever.png',height: h*.3,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0,top: 50,right: 0,bottom: 0),
                child: SizedBox(
                  height: h*.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customRadio('اقل من 37', 1, Colors.greenAccent,w*.8),
                      customRadio('اكثر من 37', 0, Colors.redAccent,w*.8)
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}