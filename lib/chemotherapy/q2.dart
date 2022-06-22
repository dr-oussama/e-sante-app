import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hepius/home.dart';
import 'package:hepius/toxicite/digestive/constipation/q3.dart';
import 'package:hepius/toxicite/type.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Cure2 extends StatefulWidget {
  String rep1='';
  Cure2(this.rep1);

  @override
  State<Cure2> createState() => _Cure2();
}


class _Cure2 extends State<Cure2> {
  final date = TextEditingController();

  void insertData(String? ip) {
    http.post(Uri.parse("http://192.168.43.231/hepius/cureinsert.php"), body: {
      "q1": widget.rep1.toString(),
      "q2": date.text.toString(),
      "ip": ip
    });
  }

  Widget customRadio(String text , int index , Color color,double w)
  {
    return SizedBox(
      width: w,
      child: FlatButton(
        onPressed: ()async{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          insertData(prefs.getString('ip'));
          //Fluttertoast.showToast(msg: "يمكنك الدخول للتسممات الآن",toastLength: Toast.LENGTH_SHORT);
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (context) => const Home()),(Route<dynamic> route) => false);
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
        title: Text('العلاج الكيمائي',style: TextStyle(color: Colors.white),),
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
                    const Text('وقتاش درتي العلاج الكيميائي؟',style: TextStyle(fontSize: 20),),
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
                  Image.asset('assets/images/calendar.png',height: h*.3,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0,top: 80,right: 0,bottom: 0),
                child: SizedBox(
                  height: h*.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: w*.8,
                        height: h*.1,
                        child: nameTextField(date,const Icon(Icons.calendar_month_rounded),'تاريخ العلاج الكيمائي')
                      ),
                      SizedBox(
                        height: h*0.03,
                      ),
                      customRadio('تأكيد', 0, Color(0xff01D0C3),w*.8)
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
          prefixIcon: IconButton(
            onPressed: ()async {
              DateTime? newdate = await showDatePicker(context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2024));
              setState(() {
                date.text = DateFormat('yyyy-MM-dd').format(newdate!);
              });
            },
            icon: Icon,color: Color(0xff01D0C3),),
          label: Text(text),
          floatingLabelAlignment: FloatingLabelAlignment.center
      ),
    );
  }
}