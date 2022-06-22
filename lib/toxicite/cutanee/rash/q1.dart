import 'package:flutter/material.dart';
import 'package:hepius/toxicite/cutanee/rash/q2.dart';



class Rq1 extends StatefulWidget {
  const Rq1({Key? key}) : super(key: key);

  @override
  State<Rq1> createState() => _Rq1State();
}

class _Rq1State extends State<Rq1> {
  int selected = 0;
  String rep1 = '';

  Widget customRadio(String text, int index, Color color, double w) {
    return SizedBox(
      width: w,
      child: FlatButton(
        onPressed: () {
          rep1 = text;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Rq2(rep1)),
          );
          setState(() {
            selected = index;
          });
        },
        height: 50,
        color: color,
        child: Text(
          text, style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery
        .of(context)
        .size
        .height;
    double w = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      appBar: AppBar(
        title: Text('الطفح الجلدي',style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff01D0C3),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 0, top: 60, right: 0, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('شحال نسبة المنطقة المتضررة؟', style: TextStyle(fontSize: 20),),
                    IconButton(onPressed: () {},
                        icon: const Icon(
                            Icons.speaker_phone
                        ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/types/cutane/percent.png',
                    height: 250,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 0, top: 50, right: 0, bottom: 0),
                child: SizedBox(
                  height: h * .3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customRadio('أقل من 10٪', 0, Colors.greenAccent, w * .8),
                      customRadio('بين 10 و 30٪', 2, Colors.orangeAccent, w * .8),
                      customRadio('أكبر من 30٪', 2, Colors.redAccent, w * .8)
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
