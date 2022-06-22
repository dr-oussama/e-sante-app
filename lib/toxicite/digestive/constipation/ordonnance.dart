import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../page/homee.dart';



class Ordonnance extends StatefulWidget {
  Widget Function() createPage;
  Ordonnance(this.createPage);

  @override
  State<Ordonnance> createState() => _OrdonnanceState(createPage);
}

class _OrdonnanceState extends State<Ordonnance> {
  Widget Function() createPage;
  _OrdonnanceState(this.createPage);

  _launchURL() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = 'http://192.168.43.231/hepius/pdf.php?ip=${prefs.getString('ip')}';
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
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
                    const Text('تبعي هاد الدواء و غاتولي مزيان ان شاء الله',style: TextStyle(fontSize: 20),),
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
                    Image.asset('assets/images/oi.gif' ,height: h*.4,),
                  ],
                ),
              ),
              SizedBox(height: h*.12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Text('اشرب من 6 إلى 8 أكواب يوميًا' , style: TextStyle(fontSize: 18),),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('اضغطي على الزر لتحميل وصفة الدواء' , style: TextStyle(fontSize: 18,fontFamily: 'montserrat.ttl'),),
                        /*FlatButton(
                          onPressed: (){

                          },
                          height: 50,
                          color: const Color(0xff01D0C3),
                          child: const Text(
                            'تحميل',style: TextStyle(color: Colors.white,fontSize: 20),
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        )*/
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: h*.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: w*.6,
                    child: FlatButton(
                      onPressed: (){
                        _launchURL();
                        Navigator.pushAndRemoveUntil(
                            context, MaterialPageRoute(builder: (context) => createPage()),
                                (Route<dynamic> route) => false
                        );
                        setState(() {
                          //selected = index;
                        });
                      },
                      height: 50,
                      color: const Color(0xff01D0C3),
                      child: const Text(
                        'تحميل',style: TextStyle(color: Colors.white,fontSize: 20),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
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
