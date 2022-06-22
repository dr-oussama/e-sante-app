import 'package:flutter/material.dart';
import 'package:hepius/toxicite/digestive/constipation/q6.dart';


class Cq5 extends StatefulWidget {
  //const Cq5({Key? key}) : super(key: key);
  String rep1='';
  String rep2='';
  String rep3='';
  String rep4='';
  Cq5(this.rep1 , this.rep2 , this.rep3 , this.rep4);

  @override
  State<Cq5> createState() => _Cq5State(rep1,rep2,rep3,rep4);
}

class _Cq5State extends State<Cq5> {
  String rep1='';
  String rep2='';
  String rep3='';
  String rep4='';
  String rep5='';

  _Cq5State(this.rep1,this.rep2,this.rep3,this.rep4);

  Widget customRadio(String text , int index , Color color,double w)
  {
    return SizedBox(
      width: w,
      child: FlatButton(
        onPressed: (){
          rep5 = text;
          //insertData();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Cq6(rep1,rep2,rep3,rep4,rep5)),
          );
          setState(() {
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
                    const Text('كاتحسي التقيؤ؟',style: TextStyle(fontSize: 20),),
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
                  Image.asset('assets/images/types/digestive/vomiting.png',height: h*.3,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0,top: 50,right: 0,bottom: 0),
                child: SizedBox(
                  height: h*.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customRadio('لا', 1, Colors.greenAccent,w*.8),
                      customRadio('نعم', 0, Colors.redAccent,w*.8)
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