import 'package:flutter/material.dart';
import 'package:hepius/part1/dashboard/api/generalstate.dart';
import 'package:hepius/part1/dashboard/api/generalstateapi.dart';
import 'package:hepius/part1/dashboard/api/patient.dart';

class Etatgeneral extends StatefulWidget {
  final Patient patient;
  const Etatgeneral({Key? key, required this.patient}) : super(key: key);

  @override
  State<Etatgeneral> createState() => _EtatgeneralState();
}

class _EtatgeneralState extends State<Etatgeneral> {

  late List<Generalstate> generals = [];

  void initState(){
    super.initState();
    generals.add(Generalstate(id: '0', autonome: '0', fatigue: '0', appetit: '0', travail: '0', activites: '0', date: 'YYYY-MM-DD'));
    init();
  }

  init() async {
    final generals = await GeneralstateApi.getGeneralstate(widget.patient.IP);
    this.generals.clear();
    setState(() { this.generals = generals ;});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('',style: TextStyle(color: Colors.white,fontSize: 20),),
        backgroundColor: Color(0xFF01D0C3),
        elevation: 0,
      ),
      backgroundColor: Color(0xFF01D0C3),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('General',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0)),
                SizedBox(width: 10.0),
                Text('State',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 20.0))
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0),topRight: Radius.circular(75.0)),
            ),
            child: ListView.builder(
              itemCount: generals.length+1,
              itemBuilder: (context,index){
                if(generals.isEmpty){
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[const SizedBox(height: 70),
                        Image.asset('assets/images/notfound.png',height: size.height*.2,),const SizedBox(height: 24),
                        Text("No general state Found",style: TextStyle(fontSize: 25),
                        )],
                    ),
                  );
                }else if(index == 0){
                  return const SizedBox(height: 16);
                }else{
                  final general = generals[index-1];
                  return buildgeneral(general);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget buildgeneral(Generalstate generals){
    return Container(
      padding: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(generals.date, style: TextStyle(fontSize: 25,color: Color(
                    0xFF6F6D6D),),),
                padding: const EdgeInsets.all(19.0),
              ),
            ],
          ),SizedBox(height: 25.0),
          Container(
            child: Text("Autonomie :  "+generals.autonome, style: TextStyle(fontSize: 18,color: Color(
                0xFF6F6D6D)),),
            padding: const EdgeInsets.all(19.0),
          ),
          Container(
            child: Text("Fatigue :  "+generals.fatigue, style: TextStyle(fontSize: 18,color: Color(
                0xFF6F6D6D)),),
            padding: const EdgeInsets.all(19.0),
          ),
          Container(
            child: Text("Appetit :  "+generals.appetit, style: TextStyle(fontSize: 18,color: Color(
                0xFF6F6D6D)),),
            padding: const EdgeInsets.all(19.0),
          ),
          Container(
            child: Text("Capacite de travail :  "+generals.travail, style: TextStyle(fontSize: 18,color: Color(
                0xFF6F6D6D)),),
            padding: const EdgeInsets.all(19.0),
          ),
          Container(
            child: Text("Capacite de faire des activites :  "+generals.activites, style: TextStyle(fontSize: 18,color: Color(
                0xFF6F6D6D)),),
            padding: const EdgeInsets.all(19.0),
          ),
        ],
      ),
    );
  }
}










