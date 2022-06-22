import 'package:flutter/material.dart';
import 'package:hepius/toxicite/digestive/diarrhees/q2.dart';



class Dq1 extends StatefulWidget {
  const Dq1({Key? key}) : super(key: key);

  @override
  State<Dq1> createState() => _Dq1State();
}

class _Dq1State extends State<Dq1> {
  int selected = 0;
  String rep1='';

  Widget customRadio(String text , int index , Color color,double w)
  {
    return SizedBox(
      width: w,
      child: FlatButton(
        onPressed: (){
          rep1 = text;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dq2(rep1)),
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
        title: Text('الاسهال',style: TextStyle(color: Colors.white),),
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
                    const Text('شحال من مرة كاتمشي للمرحاض؟',style: TextStyle(fontSize: 20),),
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
                  Image.asset('assets/images/types/digestive/toilet.png',height: 250,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0,top: 50,right: 0,bottom: 0),
                child: SizedBox(
                  height: h*.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customRadio('اقل من 4', 0, Colors.greenAccent,w*.8),
                      customRadio('بين 4 و 6', 1, Colors.orangeAccent,w*.8),
                      customRadio('أكثر من 7', 2, Colors.redAccent,w*.8)
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