import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hepius/home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../class/patient.dart';



class Analyse extends StatefulWidget {
  const Analyse({Key? key}) : super(key: key);

  @override
  State<Analyse> createState() => _AnalyseState();
}

class _AnalyseState extends State<Analyse> {
  double n = 20;
  double ho = 20;
  double p = 20;
  String v = '';
  bool text=false;
  XFile? _image;
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


  Future getFile()async{
    ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  Future<void> insertData(filePath , double p , double h , double n)async {
    String fileName = basename(filePath?.path);
    http.post(Uri.parse("http://192.168.43.231/hepius/bilan.php"), body: {
      'img' : fileName,
      'h': h.toString(),
      'p': p.toString(),
      'n': n.toString(),
      'ip': patient.IP,
    });
  }

  void uploadFile(filePath , double p , double h , double n)async{
    String fileName = basename(filePath?.path);
    print('file base name :$fileName');
    print('h = $h p = $p n = $n ');

    try{
      FormData formData = FormData.fromMap({
        'img': await MultipartFile.fromFile(filePath.path , filename: fileName),
        'h': h.toString(),
        'p': p.toString(),
        'n': n.toString(),
        'ip': patient.IP,
      });
      Response response = await Dio().post("http://192.168.43.231/hepius/bilan.php",data: formData);
      print('file reponse : $response');
    }catch(e){

    }
  }


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('التحاليل',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff01D0C3),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(': المرجو ادخال هذه المعلومات',style: TextStyle(fontSize: w*.05),),
                ],
              ),
              SizedBox(
                height: h*.04,
              ),
              DottedBorder(
                color: const Color(0xff01D0C3),
                dashPattern: const [6,4],
                child: SizedBox(
                  width: w*.8,
                  height: h*.15,
                  child: FlatButton(
                      onPressed: (){
                        getFile();
                      },

                      child: const Text('أضف الصورة هنا',style: TextStyle(color: Color(0xff01D0C3),fontSize: 18),
                      )),
                ),
              ),
              SizedBox(
                height: h*.2,
              ),
              Text('Neutrophil: $n',style: TextStyle(fontSize: w*.045),),
              Slider(
                activeColor: const Color(0xff3BACB6),
                inactiveColor: const Color(0xff3BACB6),
                thumbColor: const Color(0xff2F8F9D),
                value: n,
                max: 1000,
                divisions: 500,
                onChanged: (double value) {
                  setState(() {
                    n = value;
                  });
                },
              ),
              SizedBox(
                height: h*.1,
              ),
              Text('Hemoglobine: $ho',style: TextStyle(fontSize: w*.045),),
              Slider(
                activeColor: const Color(0xff3BACB6),
                inactiveColor: const Color(0xff3BACB6),
                thumbColor: const Color(0xff2F8F9D),
                value: ho,
                max: 1000,
                divisions: 500,
                onChanged: (double value) {
                  setState(() {
                    ho = value;
                  });
                },
              ),
              SizedBox(
                height: h*.1,
              ),
              Text('Plaquettes: $p',style: TextStyle(fontSize: w*.045),),
              Slider(
                activeColor: const Color(0xff3BACB6),
                inactiveColor: const Color(0xff3BACB6),
                thumbColor: const Color(0xff2F8F9D),
                value: p,
                max: 1000,
                divisions: 500,
                onChanged: (double value) {
                  setState(() {
                    p = value;
                  });
                },
              ),
              SizedBox(
                height: h*.2,
              ),
              SizedBox(
                  width: w*.8,
                  height: h*.1,
                  child: FlatButton(
                      onPressed: (){
                        print(n+double.parse(patient.n_max));
                        uploadFile(_image,p,ho,n);
                        Fluttertoast.showToast(msg: "تم تحميل التحاليل",toastLength: Toast.LENGTH_SHORT);
                        Navigator.pushAndRemoveUntil(
                            context, MaterialPageRoute(builder: (context) => const Home()),(Route<dynamic> route) => false);
                         },
                      color: const Color(0xff01D0C3),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      child: const Text('تأكيد',style: TextStyle(color: Colors.white,fontSize: 18),))
              )
            ],
          ),
        ),
      ),
    );
  }

  /*Future selectFile() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final path = result.files.single.path!;
      text = true;
      setState(() => file=File(path)); print(file);
    } else {
      return;
    }
  }*/


}
