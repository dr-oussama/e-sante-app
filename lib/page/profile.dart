import 'package:flutter/material.dart';
import 'package:hepius/login.dart';
import 'package:hepius/page/editProfile.dart';
import 'package:hepius/page/password.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import '../class/patient.dart';
import '../class/patientapi.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
    test();
  }
  void test()async{
    setState(() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final patients = await PatientApi.getPatient(patient.IP.toString());
      String json = jsonEncode(patients[0]);
      prefs.setString('patient', json);
    });
  }

  Future getFile()async{
    ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
    uploadFile(image);
  }

  void uploadFile(filePath)async{
    String fileName = basename(filePath?.path);
    print('file base name :$fileName');

    try{
      FormData formData = FormData.fromMap({
        'img': await MultipartFile.fromFile(filePath.path , filename: fileName),
        'ip': patient.IP,
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

    }
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
      body: SizedBox(
        width: w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: h*.03,
            ),
            SizedBox(
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
                            side: const BorderSide(color: Colors.white)
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
            ),
            SizedBox(
              height: h*.06,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                height: h*.1,
                child: FlatButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  color: const Color(0xfff5f6f9),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Editp()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.arrow_back_ios),
                      const Expanded(child: Text('تعديل الملف الشخصي',style: TextStyle(fontSize: 18),textAlign: TextAlign.right,)),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: w*.06,
                        height: w*.06,
                        child: Image.asset('assets/images/editP.png')
                      )
                    ],
                  )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                height: h*.1,
                child: FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    color: const Color(0xfff5f6f9),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Password()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(Icons.arrow_back_ios),
                        const Expanded(child: Text('تغيير كلمة المرور',style: TextStyle(fontSize: 18),textAlign: TextAlign.right,)),
                        const SizedBox(width: 20),
                        SizedBox(
                            width: w*.06,
                            height: w*.06,
                            child: Image.asset('assets/images/keys.png')
                        )
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SizedBox(
                height: h*.1,
                child: FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    color: const Color(0xfff5f6f9),
                    onPressed: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.clear();
                      Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(builder: (context) => const Login()),(Route<dynamic> route) => false);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(Icons.arrow_back_ios),
                        const Expanded(child: Text('الخروج',style: TextStyle(fontSize: 18),textAlign: TextAlign.right,)),
                        const SizedBox(width: 20),
                        SizedBox(
                            width: w*.06,
                            height: w*.06,
                            child: Image.asset('assets/images/logout.png')
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
      )
    );
  }

}
