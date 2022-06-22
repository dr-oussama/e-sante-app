import 'package:flutter/material.dart';
import 'package:hepius/generals/q4.dart';



class Gq3 extends StatefulWidget {
  String rep1='';
  String rep2='';

  Gq3(this.rep1,this.rep2);

  @override
  State<Gq3> createState() => _Gq3State(rep1,rep2);
}

class _Gq3State extends State<Gq3> {
  int selected = 0;
  String rep1='';
  String rep2='';
  String rep3='';

  _Gq3State(this.rep1,this.rep2);

  Widget customRadio(String text , int index , Color color , double w)
  {
    return SizedBox(
      width: w,
      child: FlatButton(
        onPressed: (){
          rep3 = text;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Gq4(rep1,rep2,rep3)),
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
        title: const Text('الحالة العامة',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color(0xff01D0C3),
        elevation: 0,
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
                    const Text('واش عندك الشهية؟',style: TextStyle(fontSize: 20),),
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
                  Image.asset('assets/images/types/digestive/woman.png',height: 250,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0,top: 50,right: 0,bottom: 0),
                child: SizedBox(
                  height: h*.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customRadio('نعم', 0, Colors.greenAccent,w*.8),
                      customRadio('لا', 2, Colors.redAccent,w*.8)
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