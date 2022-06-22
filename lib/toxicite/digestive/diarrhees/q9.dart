import 'package:flutter/material.dart';
import 'package:hepius/toxicite/digestive/diarrhees/q10.dart';



class Dq9 extends StatefulWidget {
  int selected = 0;
  String rep1='';
  String rep2='';
  String rep3='';
  String rep4='';
  String rep5='';
  String rep6='';
  String rep7='';
  String rep8='';

  Dq9(this.rep1,this.rep2,this.rep3,this.rep4,this.rep5,this.rep6,this.rep7,this.rep8);

  @override
  State<Dq9> createState() => _Dq9State(rep1,rep2,rep3,rep4,rep5,rep6,rep7,rep8);
}

class _Dq9State extends State<Dq9> {
  int selected=0;
  String rep1='';
  String rep2='';
  String rep3='';
  String rep4='';
  String rep5='';
  String rep6='';
  String rep7='';
  String rep8='';
  String rep9='';

  _Dq9State(this.rep1,this.rep2,this.rep3,this.rep4,this.rep5,this.rep6,this.rep7,this.rep8);


  Widget customRadio(String text , int index , Color color,double w)
  {
    return SizedBox(
      width: w,
      child: FlatButton(
        onPressed: (){
          rep9 = text;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dq10(rep1,rep2,rep3,rep4,rep5,rep6,rep7,rep8,rep9)),
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
    double sheight = MediaQuery.of(context).size.height ;
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
                    const Text('كاتحسي بالسخانة؟',style: TextStyle(fontSize: 20),),
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
                  Image.asset('assets/images/types/digestive/fever.png',height: sheight*.3,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0,top: 50,right: 0,bottom: 0),
                child: SizedBox(
                  height: h*.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customRadio('اقل من 37', 0, Colors.greenAccent,w*.8),
                      customRadio('اكثر من 37', 1, Colors.redAccent,w*.8)
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