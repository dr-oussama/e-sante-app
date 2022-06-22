import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hepius/toxicite/digestive/constipation/ordonnance.dart';
import 'package:hepius/toxicite/digestive/mucite/tips.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../class/notificationApi.dart';
import '../../../class/patient.dart';
import '../constipation/pdf.dart';
import '../constipation/urgence.dart';



class Mq10 extends StatefulWidget {
  String rep1='';
  String rep2='';
  String rep3='';
  String rep4='';
  String rep5='';
  String rep6='';
  String rep7='';
  String rep8='';
  String rep9='';
  int score = 0;

  Mq10(this.rep1,this.rep2,this.rep3,this.rep4,this.rep5,this.rep6,this.rep7,this.rep8,this.rep9,this.score);

  @override
  State<Mq10> createState() => _Mq10State(rep1,rep2,rep3,rep4,rep5,rep6,rep7,rep8,rep9,score);
}

class _Mq10State extends State<Mq10> {
  int selected = 0;
  int score = 0;
  String rep1='';
  String rep2='';
  String rep3='';
  String rep4='';
  String rep5='';
  String rep6='';
  String rep7='';
  String rep8='';
  String rep9='';
  String rep10='';
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
      "toxicite": 'oculaire',
      "med": 'doliprane',
      "ip": patient.IP,
    });
  }

  _Mq10State(this.rep1,this.rep2,this.rep3,this.rep4,this.rep5,this.rep6,this.rep7,this.rep8,this.rep9,this.score);

  Future<void> insertData(int i)async {
    http.post(Uri.parse("http://192.168.43.231/hepius/toxicite/mucite.php"), body: {
      "q1": rep1,
      "q2": rep2,
      "q3": rep3,
      "q4": rep4,
      "q5": rep5,
      "q6": rep6,
      "q7": rep7,
      "q8": rep8,
      "q9": rep9,
      "q10": rep10,
      "ip": patient.IP,
      "grade": i.toString(),
    });
  }

  Widget customRadio(String text , int index , Color color , double w)
  {
    return SizedBox(
      width: w,
      child: FlatButton(
        onPressed: (){
          rep10 = text;

            if((score>16 && score<=24) || rep10 == 'مكنقدرش')
            {
              insertData(3);
              NotifApi.insertNotifm('mucite');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const Urgence()),
              );
            }
            else if((score>8 && score<=16) || rep10 == 'مبدلة' || rep9 == 'نعم')
            {
              insertData(2);
              insertOrdonnance();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ordonnance(() => Mtips())),
              );
            }
            else{
              insertData(1);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const Mtips()),
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
        title: Text('التهاب الغشاء المخاطي',style: TextStyle(color: Colors.white),),
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
                    const Text('كيفاش كتحسي في الماكلة؟',style: TextStyle(fontSize: 20),),
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
                  Image.asset('assets/images/types/digestive/woman.png',height: 250,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0,top: 50,right: 0,bottom: 0),
                child: SizedBox(
                  height: h*.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customRadio('عادي', 0, Colors.greenAccent,w*.8),
                      customRadio('مبدلة', 1, Colors.orangeAccent,w*.8),
                      customRadio('مكنقدرش', 2, Colors.redAccent,w*.8)
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