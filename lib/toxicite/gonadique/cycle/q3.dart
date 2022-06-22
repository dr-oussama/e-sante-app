import 'package:flutter/material.dart';
import 'package:hepius/toxicite/digestive/constipation/ordonnance.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../../class/patient.dart';
import '../../../home.dart';


class Cyq3 extends StatefulWidget {
  String rep1='';
  String rep2='';

  Cyq3(this.rep1,this.rep2);

  @override
  State<Cyq3> createState() => _Cyq3State(rep1,rep2);
}

class _Cyq3State extends State<Cyq3> {
  int selected = 0;
  String rep1='';
  String rep2='';
  String rep3='';
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

  _Cyq3State(this.rep1,this.rep2);

  Future<void> insertOrdonnance()async {
    http.post(Uri.parse("http://192.168.43.231/hepius/ordonnance.php"), body: {
      "toxicite": 'cycle',
      "med": 'doliprane',
      "ip": patient.IP,
    });
  }

  Future<void> insertData()async {
    http.post(Uri.parse("http://192.168.43.231/hepius/toxicite/cycle.php"), body: {
      "q1": rep1,
      "q2": rep2,
      "q3": rep3,
      "ip": patient.IP,
    });
    insertOrdonnance();
  }

  Widget customRadio(String text , int index , Color color , double w)
  {
    return SizedBox(
      width: w,
      child: FlatButton(
        onPressed: (){
          rep3 = text;
          insertData();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Ordonnance(() => Home())),
          );
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
        title: Text('اضطرابات الدورة الشهرية',style: TextStyle(color: Colors.white),),
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
                    const Text('واش عندك جفاف الجلد؟',style: TextStyle(fontSize: 20),),
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
                  Image.asset('assets/images/types/cutane/depilation.png',height: 250,),
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