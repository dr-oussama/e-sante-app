import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hepius/toxicite/digestive/constipation/ordonnance.dart';
import 'package:hepius/toxicite/digestive/diarrhees/tips.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../class/notificationApi.dart';
import '../../../class/patient.dart';
import '../constipation/pdf.dart';
import '../constipation/urgence.dart';


class Dq10 extends StatefulWidget {
  String rep1='';
  String rep2='';
  String rep3='';
  String rep4='';
  String rep5='';
  String rep6='';
  String rep7='';
  String rep8='';
  String rep9='';

  Dq10(this.rep1,this.rep2,this.rep3,this.rep4,this.rep5,this.rep6,this.rep7,this.rep8,this.rep9);

  @override
  State<Dq10> createState() => _Dq10State(rep1,rep2,rep3,rep4,rep5,rep6,rep7,rep8,rep9);
}

class _Dq10State extends State<Dq10> {
  int selected = 0;
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
      "toxicite": 'diarrhees',
      "med": 'doliprane',
      "ip": patient.IP,
    });
  }

  _Dq10State(this.rep1,this.rep2,this.rep3,this.rep4,this.rep5,this.rep6,this.rep7,this.rep8,this.rep9);

  Future<void> insertData(int i)async {
    http.post(Uri.parse("http://192.168.43.231/hepius/toxicite/diarrhees.php"), body: {
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

  Widget customRadio(String text , int index , Color color,double w)
  {
    return SizedBox(
      width: w,
      child: FlatButton(
        onPressed: (){
          rep10 = text;

            if(rep1=='أكثر من 7' || rep10=='نعم' || rep5=='نعم' || rep6=='نعم' || rep7=='نعم' || rep8=='نعم' || rep9=='نعم')
            {
              insertData(3);
              NotifApi.insertNotifm('diarrhees');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const Urgence()),
              );
            }
            else if(rep1 == 'بين 4 و 6')
            {
              insertData(2);
              insertOrdonnance();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ordonnance(() => Dtips())),
              );
            }
            else{
              insertData(1);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  const Dtips()),
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
    double sheight = MediaQuery.of(context).size.height ;
    return Scaffold(
      appBar: AppBar(
        title: Text('الاسهال',style: TextStyle(color: Colors.white),),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('واش كاتحسي برغبة بالبول اقل من المعتاد\n او البول غامق؟',style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,),
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
                  Image.asset('assets/images/types/digestive/toil.png',height: sheight*.3,),
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
                      customRadio('نعم', 1, Colors.redAccent,w*.8)
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
