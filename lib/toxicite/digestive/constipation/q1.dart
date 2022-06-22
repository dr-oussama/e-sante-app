import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hepius/toxicite/digestive/constipation/q2.dart';


class Cq1 extends StatefulWidget {
  const Cq1({Key? key}) : super(key: key);

  @override
  State<Cq1> createState() => _Cq1State();
}

class _Cq1State extends State<Cq1> {
  int selected = 0;
  String rep1='';

  String  Url = 'https://samplelib.com/lib/preview/mp3/sample-3s.mp3';
  AudioPlayer player= AudioPlayer();
  bool isPlaying= false;
  @override
  void initState() {
    super.initState();
    player= AudioPlayer();
  }

  Widget customRadio(String text , int index , Color color,double w)
  {
    return SizedBox(
      width: w,
      child: FlatButton(
        onPressed: (){
          rep1 = text;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cq2(rep1)),
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
                    const Text('شحال من مرة كاتمشي للمرحاض؟',style: TextStyle(fontSize: 20),),
                    InkWell(
                      onTap: (){
                        if(isPlaying) {
                          stopPlay();
                          setState(() {
                            isPlaying = false;
                          });
                        }
                        else{
                          playFromNet();
                          setState(() {
                            isPlaying =true;
                          });
                        }
                      },
                      child: IconButton(onPressed: (){

                      },
                          icon: const Icon(
                              Icons.speaker_phone
                          )),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/types/digestive/toilet.png',height: h*.3,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0,top: 50,right: 0,bottom: 0),
                child: SizedBox(
                  height: h*.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customRadio('عادي', 0, Colors.greenAccent,w*.8),
                      customRadio('بعض المرات', 1, Colors.redAccent,w*.8)
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

  playFromNet()async{
    await player.play(Url);
  }
  stopPlay(){
    player.stop();
  }
  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }
}
