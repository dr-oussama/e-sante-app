import 'package:flutter/material.dart';
import 'package:hepius/toxicite/digestive/mucite/q4.dart';



class Mq3 extends StatefulWidget {
  String rep1='';
  String rep2='';
  int score = 0;

  Mq3(this.rep1,this.rep2,this.score);

  @override
  State<Mq3> createState() => _Mq3State(rep1,rep2,score);
}

class _Mq3State extends State<Mq3> {
  int selected = 0;
  int score = 0;
  String rep1='';
  String rep2='';
  String rep3='';

  _Mq3State(this.rep1,this.rep2,this.score);

  Widget customRadio(String text , int index , Color color,double w)
  {
    return SizedBox(
      width: w,
      child: FlatButton(
        onPressed: (){
          score += index;
          rep3 = text;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Mq4(rep1,rep2,rep3,score)),
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
        title: Text('التهاب الغشاء المخاطي',style: TextStyle(color: Colors.white),),
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
                    const Text('كيفاش كتحسي بصوتك؟',style: TextStyle(fontSize: 20),),
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
                  Image.asset('assets/images/types/digestive/tongue.png',height: 250,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0,top: 50,right: 0,bottom: 0),
                child: SizedBox(
                  height: h*.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customRadio('وردي و رطب', 1, Colors.greenAccent,w*.8),
                      customRadio('لزج و شاحب', 2, Colors.orangeAccent,w*.8),
                      customRadio('متشقق', 3, Colors.redAccent,w*.8)
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