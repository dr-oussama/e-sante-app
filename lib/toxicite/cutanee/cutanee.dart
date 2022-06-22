import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hepius/toxicite/cutanee/alopecie/q1.dart';
import 'package:hepius/toxicite/cutanee/edema/q1.dart';
import 'package:hepius/toxicite/cutanee/extravasation/q1.dart';
import 'package:hepius/toxicite/cutanee/hand/q1.dart';
import 'package:hepius/toxicite/cutanee/ongles/q1.dart';
import 'package:hepius/toxicite/cutanee/rash/q1.dart';



class Cutanee extends StatefulWidget {
  const Cutanee({Key? key}) : super(key: key);

  @override
  State<Cutanee> createState() => _CutaneeState();
}

class _CutaneeState extends State<Cutanee> {
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
                  childAspectRatio: (1/.85),
                  primary: false,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Rq1()),
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
                            Image.asset('assets/images/types/cutane/rash1.png',height: 100,width: 160,),
                            const Text('الطفح الجلدي',style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Hq1()),
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
                            Image.asset('assets/images/types/cutane/hand.png',height: 100,width: 160,),
                            const Text('الأيادي و الأرجل',style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Oq1()),
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
                            Image.asset('assets/images/types/cutane/finger.png',height: 100,width: 170,),
                            const Text('الأظافر',style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Eq1()),
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
                            Image.asset('assets/images/types/cutane/edema.png',height: 100,width: 160,),
                            const Text('تورم الجلد',style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Aq1()),
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
                            Image.asset('assets/images/types/cutane/alopecie.png',height: 100,width: 160,),
                            const Text('داء الثعلبة',style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Cutanee()),
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
                            Image.asset('assets/images/types/cutane/light.png',height: 100,width: 160,),
                            const Text('حساسية للضوء',style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Exq1()),
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
                            Image.asset('assets/images/types/cutane/extra.png',height: 100,width: 160,),
                            const Text('تسرب الجلد',style: TextStyle(fontSize: 18),)
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
