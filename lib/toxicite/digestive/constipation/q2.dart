import 'package:flutter/material.dart';
import 'package:hepius/toxicite/digestive/constipation/q3.dart';


class Cq2 extends StatefulWidget {
  //const Cq2({Key? key}) : super(key: key);

  String rep1='';
  Cq2(this.rep1);

  @override
  State<Cq2> createState() => _Cq2State(rep1);
}


class _Cq2State extends State<Cq2> {
  int selected = 0;
  String rep1='';
  String rep2='';
  _Cq2State(this.rep1);

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
          rep2 = text;
          //insertData();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Cq3(rep1,rep2)),
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
        title: Text('الامساك',style: TextStyle(color: Colors.white),),
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
                    const Text('شحال د الوقت كتحسي هاكا',style: TextStyle(fontSize: 20),),
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
                  Image.asset('assets/images/types/digestive/clock.png',height: h*.3,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0,top: 80,right: 0,bottom: 0),
                child: SizedBox(
                  height: h*.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customRadio('اقل من 3 ايام', 1, Colors.greenAccent,w*.8),
                      customRadio('اكثر من 3 ايام', 0, Colors.redAccent,w*.8)
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