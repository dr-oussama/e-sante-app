import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../class/patient.dart';



class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final oldPass = TextEditingController();
  final newPass1 = TextEditingController();
  final newPass2 = TextEditingController();
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



  Future<void> updateData()async {
    http.post(Uri.parse("http://192.168.43.231/hepius/password.php"), body: {
      'ip': patient.IP,
      'pass': newPass1.text.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Colors.white,
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
                      child: nameTextField(oldPass,const Icon(Icons.lock),'كلمة المرور القديمة')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: SizedBox(
                      height: h*.1,
                      child: nameTextField(newPass1,const Icon(Icons.lock),'كلمة المرور الجديدة')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: SizedBox(
                      height: h*.1,
                      child: nameTextField(newPass2,const Icon(Icons.lock),'تأكيد كلمة المرور الجديدة')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SizedBox(
                      width: w*.8,
                      height: h*.06,
                      child: FlatButton(
                          onPressed: (){
                            print(newPass1.text);
                            print(newPass2.text);
                            if(oldPass.text != patient.mots_de_passe)
                              {
                                Fluttertoast.showToast(msg: "كلمة المرور القديمة غير صحيحة",toastLength: Toast.LENGTH_SHORT);
                              }
                            else if(newPass1.text != newPass2.text)
                              {
                                Fluttertoast.showToast(msg: "كلمتا المرور الجديدتان ليست متطابقة",toastLength: Toast.LENGTH_SHORT);
                              }
                            else
                              {
                                updateData();
                              }


                            print(patient.IP);
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
