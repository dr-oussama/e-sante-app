import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hepius/toxicite/arth/q1.dart';
import 'package:hepius/toxicite/cutanee/cutanee.dart';
import 'package:hepius/toxicite/digestive/digestive.dart';
import 'package:hepius/toxicite/gonadique/gonadique.dart';
import 'package:hepius/toxicite/oculaire/q1.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../chemotherapy/q1.dart';
import '../class/cure.dart';
import '../class/cureApi.dart';
import '../home.dart';


class Type extends StatefulWidget {
  const Type({Key? key}) : super(key: key);

  @override
  State<Type> createState() => _TypeState();
}

class _TypeState extends State<Type> {
  final currentdate = DateTime.now();
  List<Cure> cure = [];

  @override
  void dispose(){
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      a();
    });
  }

  void a()async{
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final cure = await CureApi.getOneCure(prefs.getString('ip'));
    setState(() {
      this.cure = cure;
    });
    print(DateTime.parse(this.cure[0].nextcure).day);

    if(DateTime.parse(this.cure[0].nextcure).isBefore(currentdate)){
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.redAccent.shade200,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        title: const Text("واش درتي العلاج الكيمائي؟",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
        content: SizedBox(
          height: h*.3,
          child: Column(
            children: [
              Image.asset('assets/images/chemotherapy3.png'),
              SizedBox(
                height: h*.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: w*.2,
                    child: FlatButton(
                        onPressed: (){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Cure1()),);
                        },
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        child: const Text('نعم',style: TextStyle(color: Colors.white,fontSize: 18),)),
                  ),SizedBox(
                    width: w*.2,
                    child: FlatButton(
                        onPressed: (){
                          Navigator.pop(context);
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => const GeneralState()),);
                        },
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        child: const Text('لا',style: TextStyle(color: Colors.white,fontSize: 18),)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('التسمم',style: TextStyle(fontSize: 20,color: Colors.white)),
        centerTitle: true,
        //leading: BackButton(color: Colors.grey,),
        backgroundColor: const Color(0xff01D0C3),
        leading: IconButton(onPressed: (){
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (context) => const Home()),(Route<dynamic> route) => false);
          setState(() {
            //selected = index;
          });
        },
            icon: Icon(Icons.arrow_back)),
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text('اختاري نوع المرض لي كتحسي بيه',style: TextStyle(fontSize: 20),),
                          IconButton(onPressed: (){
                            final player = AudioCache();
                            player.play('type.aac');
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
                          MaterialPageRoute(builder: (context) => const Digestive()),
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
                            Image.asset('assets/images/types/digestion.png',height: 100,),
                            const Text('الجهاز الهضمي',style: TextStyle(fontSize: 18),)
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
                            Image.asset('assets/images/types/rash.png',height: 100,),
                            const Text('الجلد',style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Gonadique()),
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
                            Image.asset('assets/images/types/uterus.png',height: 100,),
                            const Text('الغدد التناسلية',style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Thq1()),
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
                            Image.asset('assets/images/types/joint.png',height: 100,),
                            const Text('المفاصل',style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Ocq1()),
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
                            Image.asset('assets/images/types/eye.png',height: 100,),
                            const Text('العين',style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      elevation: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/images/types/amnesia.png',height: 100,),
                          const Text('العصبية',style: TextStyle(fontSize: 18),)
                        ],
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


