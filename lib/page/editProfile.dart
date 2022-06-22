import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';
import '../class/patient.dart';
import '../class/patientapi.dart';


class Editp extends StatefulWidget {
  const Editp({Key? key}) : super(key: key);

  @override
  State<Editp> createState() => _EditpState();
}

class _EditpState extends State<Editp> {
  final nom = TextEditingController();
  final prenom = TextEditingController();
  final date = TextEditingController();
  final tele = TextEditingController();
  final address = TextEditingController();
  final email = TextEditingController();

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
    var json = prefs.getString('patient');
    Map<String, dynamic> patientmap = jsonDecode(json!);
    setState(() => patient = Patient.fromJson(patientmap));
    nom.text = patient.nom.toString();
    prenom.text = patient.prenom.toString();
    date.text = patient.date_naissance.toString();
    tele.text = patient.telephone.toString();
    address.text = patient.addresse.toString();
    email.text = patient.e_mail.toString();
  }

  void uploadFile(filePath)async{
    String fileName = basename(filePath?.path);
    print('file base name :$fileName');

    try{
      FormData formData = FormData.fromMap({
        'img': await MultipartFile.fromFile(filePath.path , filename: fileName),
        'ip': patient.IP,
        'nom': nom.text,
        'prenom': prenom.text,
        'date': date.text,
        'tele': tele.text,
        'address': address.text,
        'email': email.text
      });
      Response response = await Dio().post("http://192.168.43.231/hepius/profilePic.php",data: formData);
      print('file reponse : $response');
      setState(() async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final patients = await PatientApi.getPatients(patient.IP.toString(),patient.mots_de_passe.toString());
        String json = jsonEncode(patients[0]);
        prefs.setString('patient', json);
      });
    }catch(e){
      print(e);
    }
  }

  Future<void> updateData()async {
    http.post(Uri.parse("http://192.168.43.231/hepius/updateProfile.php"), body: {
      'ip': patient.IP,
      'nom': nom.text,
      'prenom': prenom.text,
      'date': date.text,
      'tele': tele.text,
      'address': address.text,
      'email': email.text
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;


    return Scaffold(
        appBar: AppBar(
          title: const Text('الملف الشخصي',style: TextStyle(color: Colors.white)),
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color(0xff01D0C3),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: h*.03,
                ),
                /*SizedBox(
                  height: w*.3,
                  width: w*.3,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        backgroundImage:_image==null
                            ?  NetworkImage('http://192.168.43.231/hepius/${patient.picture}')
                            : FileImage(File(_image?.path as String)) as ImageProvider,
                      ),
                      Positioned(
                        bottom: 0,
                        right: -12,
                        child: SizedBox(
                          height: w*.1,
                          width: w*.1,
                          child: FlatButton(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide(color: Colors.white)
                            ),
                            onPressed: ()async{
                              await getFile();
                              //uploadFile(_image);
                            },
                            child: Image.asset('assets/images/edit.png'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),*/
                SizedBox(
                  height: h*.06,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SizedBox(
                    height: h*.1,
                    child: nameTextField(nom,const Icon(Icons.person),'الإ سم العائلي')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: SizedBox(
                    height: h*.1,
                    child: nameTextField(prenom,const Icon(Icons.person),'الإ سم الشخصي')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SizedBox(
                    height: h*.1,
                    child: nameTextField(date,const Icon(Icons.calendar_month_rounded),'تاريخ الميلاد')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SizedBox(
                      height: h*.1,
                      child: nameTextField(tele,const Icon(Icons.phone),'رقم الهاتف')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SizedBox(
                      height: h*.1,
                      child: nameTextField(address,const Icon(Icons.home_rounded),'العنوان')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SizedBox(
                      height: h*.1,
                      child: nameTextField(email,const Icon(Icons.email_rounded),'البريد الإلكتروني')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SizedBox(
                      width: w*.8,
                      height: h*.06,
                      child: FlatButton(
                        onPressed: (){
                          updateData();
                          setState(() async{
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            final patients = await PatientApi.getPatients(patient.IP.toString(),patient.mots_de_passe.toString());
                            String json = jsonEncode(patients[0]);
                            prefs.setString('patient', json);
                          });

                          print(patient.IP);
                          print(nom.text);
                          Navigator.pop(context);
                          /*Navigator
                              .of(context)
                              .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => Profile()));*/
                        },
                        color: const Color(0xff01D0C3),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        child: const Text('تأكيد',style: TextStyle(color: Colors.white,fontSize: 18),)
                      )
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  Widget nameTextField(TextEditingController,Icon,String text)
  {
    return TextFormField(
      controller: TextEditingController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white
          )
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2,
          )
        ),
        prefixIcon: Icon,
        label: Text(text),
        floatingLabelAlignment: FloatingLabelAlignment.center
      ),
    );
  }
}


