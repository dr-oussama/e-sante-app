import 'package:flutter/material.dart';
import 'package:hepius/part1/dashboard/allpatientt.dart';
import 'package:hepius/part1/dashboard/cureday.dart';



class Patientchoice extends StatefulWidget {
  const Patientchoice({Key? key}) : super(key: key);

  @override
  State<Patientchoice> createState() => _PatientchoiceState();
}

class _PatientchoiceState extends State<Patientchoice> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Patients',style: TextStyle(color: Colors.white,fontSize: 20),),
        backgroundColor: Color(0xFF01D0C3),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              width: size.width*.5,
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Allpatient()),
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
                      Image.asset('assets/images/allpatients.png',height: 128,),
                      Text('All Patients',style: TextStyle(fontSize: 18),)
                    ],
                  ),
                ),
              ),
            ),SizedBox(
              width: size.width*.5,
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cureday()),
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
                      Image.asset('assets/images/patientcure.png',height: 128,),
                      Text("Cure's day",style: TextStyle(fontSize: 18),)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}