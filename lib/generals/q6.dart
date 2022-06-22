import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hepius/toxicite/type.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../class/patient.dart';
import '../home.dart';




class Gq6 extends StatefulWidget {
  String rep1='';
  String rep2='';
  String rep3='';
  String rep4='';
  String rep5='';

  Gq6(this.rep1,this.rep2,this.rep3,this.rep4,this.rep5);

  @override
  State<Gq6> createState() => _Gq6State(rep1,rep2,rep3,rep4,rep5);
}

class _Gq6State extends State<Gq6> {
  int selected = 0;
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

  _Gq6State(this.rep1,this.rep2,this.rep3,this.rep4,this.rep5);

  Future<void> insertData()async {
    http.post(Uri.parse("http://192.168.43.231/hepius/generals.php"), body: {
      "q1": rep1,
      "q2": rep2,
      "q3": rep3,
      "q4": rep4,
      "q5": rep5,
      "ip": patient.IP
    });
  }

  Widget customRadio(String text , int index , Color color , double w)
  {
    return SizedBox(
      width: w,
      child: FlatButton(
        onPressed: (){
          rep6 = text;
          insertData();
          if(rep6 == 'نعم')
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Type()),
              );
            }
          else
            {
              Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (context) => const Home()),
                      (Route<dynamic> route) => false
              );
            }
          /*Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Thq7(rep1,rep2,rep3,rep4,rep5,rep6)),
          );*/
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
        title: const Text('الحالة العامة',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color(0xff01D0C3),
        elevation: 0,
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
                    const Text('واش عندك شكاوي أخرى ؟',style: TextStyle(fontSize: 20),),
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
                  Image.asset('assets/images/alert.png',height: 250,),
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