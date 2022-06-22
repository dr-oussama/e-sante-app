import 'package:flutter/material.dart';
import 'package:hepius/toxicite/digestive/vomissement/q5.dart';



class Vq4 extends StatefulWidget {
  String rep1='';
  String rep2='';
  String rep3='';

  Vq4(this.rep1,this.rep2,this.rep3);

  @override
  State<Vq4> createState() => _Vq4State(rep1,rep2,rep3);
}

class _Vq4State extends State<Vq4> {
  int selected = 0;
  String rep1='';
  String rep2='';
  String rep3='';
  String rep4='';

  _Vq4State(this.rep1,this.rep2,this.rep3);


  Widget customRadio(String text , int index , Color color,double w)
  {
    return SizedBox(
      width: w,
      child: FlatButton(
        onPressed: (){
          rep4 = text;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Vq5(rep1,rep2,rep3,rep4)),
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
    double h = MediaQuery
        .of(context)
        .size
        .height;
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double sheight = MediaQuery.of(context).size.height ;
    return Scaffold(
      appBar: AppBar(
        title: Text('التقيؤ',style: TextStyle(color: Colors.white),),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('واش كاتحسي برغبة بالبول اقل من المعتاد\n او البول غامق؟',style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,),
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
                  Image.asset('assets/images/types/digestive/toil.png',height: sheight*.3,width: 240,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0,top: 50,right: 0,bottom: 0),
                child: SizedBox(
                  height: h*.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customRadio('لا', 0, Colors.greenAccent,w*.8),
                      customRadio('نعم', 1, Colors.redAccent,w*.8)
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
