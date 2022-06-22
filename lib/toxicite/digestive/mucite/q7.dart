import 'package:flutter/material.dart';
import 'package:hepius/toxicite/digestive/mucite/q8.dart';



class Mq7 extends StatefulWidget {
  String rep1='';
  String rep2='';
  String rep3='';
  String rep4='';
  String rep5='';
  String rep6='';
  int score = 0;

  Mq7(this.rep1,this.rep2,this.rep3,this.rep4,this.rep5,this.rep6,this.score);

  @override
  State<Mq7> createState() => _Mq7State(rep1,rep2,rep3,rep4,rep5,rep6,score);
}

class _Mq7State extends State<Mq7> {
  int selected = 0;
  int score = 0;
  String rep1='';
  String rep2='';
  String rep3='';
  String rep4='';
  String rep5='';
  String rep6='';
  String rep7='';

  _Mq7State(this.rep1,this.rep2,this.rep3,this.rep4,this.rep5,this.rep6,this.score);

  Widget customRadio(String text , int index , Color color , double w)
  {
    return SizedBox(
      width: w,
      child: FlatButton(
        onPressed: (){
          score += index;
          rep7 = text;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Mq8(rep1,rep2,rep3,rep4,rep5,rep6,rep7,score)),
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
                    const Text('كيفاش كتحسي بأسنانك؟',style: TextStyle(fontSize: 20),),
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
                  Image.asset('assets/images/types/digestive/smile.png',height: 250,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0,top: 50,right: 0,bottom: 0),
                child: SizedBox(
                  height: h*.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customRadio('نقيين', 1, Colors.greenAccent,w*.8),
                      customRadio('انتشار اللوحات', 2, Colors.orangeAccent,w*.8),
                      customRadio('انتشار حطام بالأسنان', 3, Colors.redAccent,w*.8)
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