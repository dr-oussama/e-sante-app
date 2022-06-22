import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hepius/toxicite/digestive/constipation/ordonnance.dart';
import 'package:hepius/toxicite/digestive/constipation/pdf.dart';
import 'package:hepius/toxicite/digestive/constipation/urgence.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../class/notificationApi.dart';
import '../../../class/patient.dart';
import '../tips.dart';


class Exq2 extends StatefulWidget {
  String rep1='';

  Exq2(this.rep1);

  @override
  State<Exq2> createState() => _Exq2State(rep1);
}

class _Exq2State extends State<Exq2> {
  int selected = 0;
  String rep1='';
  String rep2='';
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
      "toxicite": 'cycle',
      "med": 'extravasation',
      "ip": patient.IP,
    });
  }

  _Exq2State(this.rep1);

  Future<void> insertData()async {
    http.post(Uri.parse("http://192.168.43.231/hepius/toxicite/extravasation.php"), body: {
      "q1": rep1,
      "q2": rep2,
      "ip": patient.IP,
    });
  }

  Widget customRadio(String text , int index , Color color , double w)
  {
    return SizedBox(
      width: w,
      child: FlatButton(
        onPressed: (){
          rep2 = text;
          insertData();
          if(rep2 == 'اكثر من 37' || rep1 == 'نعم')
            {
              NotifApi.insertNotifm('extravasation');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Urgence()),
              );
            }
          else
          {
            insertOrdonnance();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Ordonnance(() => Cutips())),
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
        title: Text('تسرب الجلد',style: TextStyle(color: Colors.white),),
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
                  Image.asset('assets/images/types/digestive/fever.png',height: 250,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0,top: 50,right: 0,bottom: 0),
                child: SizedBox(
                  height: h*.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customRadio('اقل من 37', 0, Colors.greenAccent,w*.8),
                      customRadio('اكثر من 37', 2, Colors.redAccent,w*.8)
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