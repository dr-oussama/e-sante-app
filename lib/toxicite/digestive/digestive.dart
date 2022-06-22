import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hepius/toxicite/digestive/constipation/q1.dart';
import 'package:hepius/toxicite/digestive/mucite/q1.dart';
import 'package:hepius/toxicite/digestive/vomissement/q1.dart';

import 'diarrhees/q1.dart';


class Digestive extends StatefulWidget {
  const Digestive({Key? key}) : super(key: key);

  @override
  State<Digestive> createState() => _DigestiveState();
}

class _DigestiveState extends State<Digestive> {
  AudioCache audioCache = AudioCache();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الجهاز الهضمي',style: TextStyle(fontSize: 20,color: Colors.white)),
        centerTitle: true,
        //leading: BackButton(color: Colors.grey,),
        backgroundColor: const Color(0xff01D0C3),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.notifications)
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text('اختاري نوع مرض الجهاز الهضمي',style: TextStyle(fontSize: 20),),
                          IconButton(onPressed: (){
                            audioCache.load('images/test.mp3');
                          },
                              icon: const Icon(
                                  Icons.speaker_phone
                              ))
                        ],
                      ),

                    ],
                  )
                ],

              ),
            ),
            Expanded(
              child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  primary: false,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Mq1()),
                        );
                      },
                      child: Card(

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/types/digestive/mucite.png',height: 128,width: 160,),
                            const Text('التهاب الغشاء المخاطي',style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Vq1()),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/types/digestive/vomiting.png',height: 128,width: 160,),
                            const Text('التقيؤ',style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Dq1()),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/types/digestive/ishal.png',height: 128,width: 170,),
                            const Text('الاسهال',style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Cq1()),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/types/digestive/imsak1.png',height: 128,width: 160,),
                            const Text('الامساك',style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                  ],
                  crossAxisCount: 2),
            )
          ],
        ),

      ),
    );
  }
}

