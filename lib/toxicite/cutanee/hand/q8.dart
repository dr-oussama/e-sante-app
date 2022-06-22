import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hepius/toxicite/cutanee/tips.dart';
import 'package:hepius/toxicite/digestive/constipation/ordonnance.dart';
import 'package:hepius/toxicite/digestive/constipation/urgence.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../class/notificationApi.dart';
import '../../../class/patient.dart';
import '../../digestive/constipation/pdf.dart';


class Hq8 extends StatefulWidget {
  String rep1='';
  String rep2='';
  String rep3='';
  String rep4='';
  String rep5='';
  String rep6='';
  String rep7='';

  Hq8(this.rep1,this.rep2,this.rep3,this.rep4,this.rep5,this.rep6,this.rep7);

  @override
  State<Hq8> createState() => _Hq8State(rep1,rep2,rep3,rep4,rep5,rep6,rep7);
}

class _Hq8State extends State<Hq8> {
  int selected = 0;
  String rep1='';
  String rep2='';
  String rep3='';
  String rep4='';
  String rep5='';
  String rep6='';
  String rep7='';
  String rep8='';
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
      "toxicite": 'mains',
      "med": 'doliprane',
      "ip": patient.IP,
    });
  }

  _Hq8State(this.rep1,this.rep2,this.rep3,this.rep4,this.rep5,this.rep6,this.rep7);

  Future<void> insertData(int i)async {
    http.post(Uri.parse("http://192.168.43.231/hepius/toxicite/hand.php"), body: {
      "q1": rep1,
      "q2": rep2,
      "q3": rep3,
      "q4": rep4,
      "q5": rep5,
      "q6": rep6,
      "q7": rep7,
      "q8": rep8,
      "grade": i.toString(),
      "ip":patient.IP
    });
  }

  Widget customRadio(String text , int index , Color color , double w)
  {
    return SizedBox(
      width: w,
      child: FlatButton(
        onPressed: (){
          rep8 = text;
          if(rep8 == 'نعم' || rep5 == 'نعم' || rep4 == 'نعم' || rep3 == 'نعم' || rep2 == 'نعم' || rep1 == 'نعم')
            {
              insertData(3);
              NotifApi.insertNotifm('mains et pieds cutane');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Urgence()),
              );
            }
          else if(rep7 == 'نعم' || rep6 == 'نعم')
            {
              insertData(2);
              insertOrdonnance();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ordonnance(() => Cutips())),
              );
            }
          else
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Cutips()),
              );
            }
          setState(() {
            selected = index;
          });
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
        title: Text('الأيادي و الأرجل',style: TextStyle(color: Colors.white),),
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
                    const Text('هادشي كيأثر على حياتك اليومية؟',style: TextStyle(fontSize: 20),),
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
                  Image.asset('assets/images/types/cutane/daily.png',height: 250,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0,top: 50,right: 0,bottom: 0),
                child: SizedBox(
                  height: h*.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customRadio('لا', 0, Colors.greenAccent,w*.8),
                      customRadio('نعم', 2, Colors.redAccent,w*.8)
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