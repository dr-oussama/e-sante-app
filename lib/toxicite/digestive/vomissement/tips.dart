import 'package:flutter/material.dart';

import '../../../home.dart';
import '../../../page/homee.dart';



class Vtips extends StatefulWidget {
  const Vtips({Key? key}) : super(key: key);

  @override
  State<Vtips> createState() => _VtipsState();
}

class _VtipsState extends State<Vtips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0,top: 30,right: 0,bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('تبعي هاد النصائح و غاتولي مزيان ان شاء الله',style: TextStyle(fontSize: 20),),
                    IconButton(onPressed: (){},
                        icon: const Icon(
                            Icons.speaker_phone
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0,top: 0,right: 0,bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/doc.gif' , width: 392.7,height: 300,),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Text('اشرب من 6 إلى 8 أكواب يوميًا' , style: TextStyle(fontSize: 18),),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text('اختر الأطعمة سهلة الهضم' , style: TextStyle(fontSize: 18,fontFamily: 'montserrat.ttl'),),
                        SizedBox(height: 15,),
                        Text('حافظي على وضعية الجلوس لمدة 30 دقيقة بعد الوجبة' , style: TextStyle(fontSize: 18),),
                        SizedBox(height: 15,),
                        Text(' تجنب الأطعمة الدهنية والمقلية والحارة جدا' , style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: (){
                      Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(builder: (context) => const Home()),
                              (Route<dynamic> route) => false
                      );
                      setState(() {
                        //selected = index;
                      });
                    },
                    height: 50,
                    color: const Color(0xff01D0C3),
                    child: const Text(
                      'الصفحة الرئيسية',style: TextStyle(color: Colors.white,fontSize: 20),
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}