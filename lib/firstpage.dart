import 'package:flutter/material.dart';
import 'package:hepius/login.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({Key? key}) : super(key: key);

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/wave.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 70),
                    child: Column(
                      children: <Widget>[
                        Image(image: AssetImage("assets/images/hepius.png"),width: 230,height: 230,fit: BoxFit.fill,),
                        Text("Restons en bonne santé ensemble",style: TextStyle(color: Colors.white,fontSize: 18),),
                      ],
                    ),
                  ),
                  Container(
                    child: TextButton(
                      child: Text("On y va"),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.only(left: 70,top: 10,right: 70,bottom: 10),
                        backgroundColor: Color(0xFF01D0C3),
                        textStyle: TextStyle(fontSize: 25),
                        primary: Colors.white,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                      ),
                      onPressed: (){
                        Navigator.push(context, new MaterialPageRoute(builder: (context) => Login()));
                      },
                    ),
                  )
                ],
              ),
          ),
        ),
      ),
    );
  }
}