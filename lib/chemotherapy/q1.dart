import 'package:flutter/material.dart';
import 'package:hepius/chemotherapy/q2.dart';


class Cure1 extends StatefulWidget {

  @override
  State<Cure1> createState() => _Cure1();
}


class _Cure1 extends State<Cure1> {
  String rep1='';

  /*void insertData() {
    var url = "http://192.168.43.231/esante/insert.php";
    http.post(Uri.parse("http://192.168.43.231/esante/insert.php"), body: {
      "q1": rep1.toString(),
      "q2": rep2.toString(),
    });
  }*/

  Widget customRadio(String text , int index , Color color,double w)
  {
    return SizedBox(
      width: w,
      child: FlatButton(
        onPressed: (){
          rep1 = text;
          //insertData();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Cure2(rep1,)),
          );
          setState(() {

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
                    const Text('واش دوا الأحمر ولا لبيض؟',style: TextStyle(fontSize: 20),),
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
                  Image.asset('assets/images/curetype.png',height: h*.3,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0,top: 80,right: 0,bottom: 0),
                child: SizedBox(
                  height: h*.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customRadio('أحمر', 1, Colors.redAccent,w*.8),
                      customRadio('أبيض', 0, Colors.grey,w*.8)
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