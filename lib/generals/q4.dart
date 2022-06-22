import 'package:flutter/material.dart';
import 'package:hepius/generals/q5.dart';



class Gq4 extends StatefulWidget {
  String rep1='';
  String rep2='';
  String rep3='';

  Gq4(this.rep1,this.rep2,this.rep3,);

  @override
  State<Gq4> createState() => _Gq4State(rep1,rep2,rep3,);
}

class _Gq4State extends State<Gq4> {
  int selected = 0;
  String rep1='';
  String rep2='';
  String rep3='';
  String rep4='';

  _Gq4State(this.rep1,this.rep2,this.rep3);

  Widget customRadio(String text , int index , Color color , double w)
  {
    return SizedBox(
      width: w,
      child: FlatButton(
        onPressed: (){
          rep4 = text;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Gq5(rep1,rep2,rep3,rep4)),
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
                    const Text('واش كتقدر دير خدمة ديالك بلا عيا؟',style: TextStyle(fontSize: 20),),
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
                  Image.asset('assets/images/working-woman.png',height: 250,),
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