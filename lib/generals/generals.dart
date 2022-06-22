import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hepius/generals/q1.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../chemotherapy/q1.dart';



class GeneralState extends StatefulWidget {
  const GeneralState({Key? key}) : super(key: key);

  @override
  State<GeneralState> createState() => _GeneralStateState();
}

class _GeneralStateState extends State<GeneralState> {

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

    //if(prefs.getInt('day') == null || prefs.getInt('day') != currentdate){
    // prefs.setInt('day', currentdate);
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
    //}
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: h*.08,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('يمكنك تبداي تجاوبي على الاسئلة',style: TextStyle(fontSize: 20) ,),
              IconButton(onPressed: (){},
                  icon: const Icon(
                      Icons.speaker_phone
                  ))
            ],
          ),
          SizedBox(
            height: h*.05,
          ),
          Image.asset('assets/images/generals.png',height: h*.3,),
          SizedBox(
            height: h*.15,
          ),
          SizedBox(
              width: w*.8,
              height: h*.06,
              child: FlatButton(
                  onPressed: ()
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Gq1()),
                    );
                  },
                  color: const Color(0xff01D0C3),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  child: const Text('بدأ',style: TextStyle(color: Colors.white,fontSize: 18),))
          )
        ],
      ),
    );
  }
}
