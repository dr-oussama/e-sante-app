import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hepius/toxicite/gonadique/cycle/q1.dart';
import 'package:hepius/toxicite/gonadique/troubles/q1.dart';



class Gonadique extends StatefulWidget {
  const Gonadique({Key? key}) : super(key: key);

  @override
  State<Gonadique> createState() => _GonadiqueState();
}

class _GonadiqueState extends State<Gonadique> {
  AudioCache audioCache = AudioCache();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سمية الجلد',style: TextStyle(fontSize: 20,color: Colors.white)),
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
                          const Text('اختاري نوع المرض الجلدي',style: TextStyle(fontSize: 20),),
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
                          MaterialPageRoute(builder: (context) => const Cyq1()),
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
                            Image.asset('assets/images/types/cutane/cycle.png',height: 128,width: 160,),
                            const Text('اضطرابات الدورة الشهرية',style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Trq1()),
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
                            Image.asset('assets/images/types/cutane/vag.png',height: 128,width: 160,),
                            const Text('الاضطرابات الجنسية',style: TextStyle(fontSize: 18),)
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
