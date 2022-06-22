
import 'package:flutter/material.dart';
import 'package:hepius/part1/dashboard/api/event.dart';
import 'package:hepius/part1/dashboard/api/eventapi.dart';
import 'api/patient.dart';

class Toxicities extends StatefulWidget {
  final Patient patient;
  const Toxicities({Key? key, required this.patient}) : super(key: key);
  @override
  State<Toxicities> createState() => _ToxicitiesState();
}

class _ToxicitiesState extends State<Toxicities> {

  List<Event> Events = [];

  void initState(){
    super.initState();
    init();
  }
  Future init() async {
    final event = await EventApi.getEventstoxic(widget.patient.id_cure);

    setState(() => this.Events = event);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Toxicities',style: TextStyle(color: Colors.white,fontSize: 20),),
        backgroundColor: Color(0xFF01D0C3),
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: Events.length+1,
                      itemBuilder: (context, index) {
                        if(Events.isEmpty){
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[const SizedBox(height: 24),
                                Image.asset('assets/images/notfound.png',height: size.height*.2,),const SizedBox(height: 24),
                                Text("No Toxicities Found",style: TextStyle(fontSize: 25),
                                )],
                            ),
                          );
                        }else if(index == 0){
                          return const SizedBox(height: 16);
                        }else{
                          final event = Events[index-1];

                          return buildEvent(event);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget buildEvent(Event event) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 3,
      child: ListTile(
        tileColor: Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        title: Text(event.nom),
        subtitle: Text(event.date+"     Grade = "+event.grade),
      ),
    ),
  );
}

