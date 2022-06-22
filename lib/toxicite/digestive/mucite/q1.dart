import 'package:flutter/material.dart';
import 'package:hepius/toxicite/digestive/mucite/q2.dart';



class Mq1 extends StatefulWidget {
  const Mq1({Key? key}) : super(key: key);

  @override
  State<Mq1> createState() => _Mq1State();
}

class _Mq1State extends State<Mq1> {
  int selected = 0;
  String rep1='';
  int score = 0;

  Widget customRadio(String text , int index , Color color,double w)
  {
    return SizedBox(
      width: w,
      child: FlatButton(
        onPressed: (){
          rep1 = text;
          score += index;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Mq2(rep1,score)),
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
                  Image.asset('assets/images/types/digestive/voice.png',height: h*.3,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0,top: 50,right: 0,bottom: 0),
                child: SizedBox(
                  height: h*.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customRadio('عادي', 1, Colors.greenAccent,w*.8),
                      customRadio('جاف', 2, Colors.orangeAccent,w*.8),
                      customRadio('مكندويش مزيان', 3, Colors.redAccent,w*.8)
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