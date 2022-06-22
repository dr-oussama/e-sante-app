import 'package:flutter/material.dart';
import 'package:hepius/part1/dashboard/api/cure.dart';
import 'package:hepius/part1/dashboard/api/cureapi.dart';
import 'package:hepius/part1/dashboard/api/event.dart';
import 'package:hepius/part1/dashboard/api/eventapi.dart';
import 'package:hepius/part1/dashboard/api/patient.dart';
import 'package:url_launcher/url_launcher.dart';

class Medicalf extends StatefulWidget {
  final Patient patient;
  const Medicalf({Key? key, required this.patient}) : super(key: key);

  @override
  State<Medicalf> createState() => _MedicalfState();
}

class _MedicalfState extends State<Medicalf> {

  late List<Event> events = [];
  late List<Cure> cures = [];
  List<Event> eventsd = [];
  int index = 0;


  void initState(){
    super.initState();
    cures.add(Cure(id_cure: '0',type_cure: '0',date_cure: '0000-00-00',curenumber: '0',toxicnum: '0',nextcure: '0000-00-00'));
    init1();
    init2();
  }
  init1() async {
    final cures = await CureApi.getCures(widget.patient.IP);
    this.cures.clear();
    cures.sort((a,b)=> b.curenumber.compareTo(a.curenumber));
    setState(() { this.cures = cures ;});
  }

  init2() async {
    final events = await EventApi.getEventsall(widget.patient.IP);
    events.sort((a,b)=> b.date.compareTo(a.date));
    setState(() { this.events=events;});
  }

  _launchURL(String id) async {
    var url = 'http://192.168.43.231/hepius/pdf1.php?id=$id';
    launch(url);
  }

  bilan(String id) async {
    var url = 'http://192.168.43.231/hepius/pdfBilan.php?id=$id';
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    final start = DateTime.parse(cures[index].date_cure);
    final end = DateTime.parse(cures[index].nextcure);
    final number = cures[index].curenumber;
    final type_cure = cures[index].type_cure;
    eventsd.clear();
    for(Event e in events){
      DateTime dt1 = DateTime.parse(e.date);
      if( ((dt1.year == start.year && dt1.month == start.month && dt1.day == start.day) || dt1.compareTo(start) > 0)&&((dt1.year == end.year && dt1.month == end.month && dt1.day == end.day) || dt1.compareTo(end) < 0) ){
        eventsd.add(e);
      }
    }
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Dossier medical',style: TextStyle(color: Colors.white,fontSize: 20),),
        backgroundColor: Color(0xFF01D0C3),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(iconSize: 72, icon: Icon(Icons.arrow_left,color: Color(0xFF01D0C3),), onPressed: () {
                  if(index >= cures.length - 1){
                    return;
                  }else{
                    setState(() => index +=1);
                  }
                }, ),
                Text("Cure "+number ,style: TextStyle(fontSize: 25),),
                IconButton(iconSize: 72, icon: Icon(Icons.arrow_right,color: Color(0xFF01D0C3),), onPressed: () {
                  if(index <= 0){
                    return;
                  }else{
                    setState(() => index -=1 );
                  }
                }, ),
              ],
            ),
            Text('type : $type_cure'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    child: Text('${start.year}/${start.month}/${start.day}'),
                    onPressed: (){},
                  ),
                ),const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    child: Text('${end.year}/${end.month}/${end.day}'),
                    onPressed: (){},
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: eventsd.length+1,
                itemBuilder: (context, index) {
                  if(eventsd.isEmpty){
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[const SizedBox(height: 24),
                          Image.asset('assets/images/notfound.png',height: size.height*.2,),const SizedBox(height: 24),
                          Text("No Events Found",style: TextStyle(fontSize: 25),
                          )],
                      ),
                    );
                  }else if(index == 0){
                    return const SizedBox(height: 16);
                  }else{
                    final event = eventsd[index-1];

                    if(event.nom == 'Ordonnance')
                    {
                      return buildOrd(event);
                    }
                    else if(event.nom == "Bilan")
                    {
                      return buildBilan(event);
                    }
                    else{
                      return buildevents(event);
                    }
                  }

                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildevents(Event event) => Padding(
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

  Widget buildOrd(Event event) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 3,
      child: ListTile(
        trailing: IconButton(icon: Icon(Icons.download_rounded),
          onPressed:(){
            _launchURL(event.id_event);
          },),
        tileColor: Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        title: Text(event.nom,textAlign: TextAlign.left,),
        subtitle: Text(event.date+"     Grade = "+event.grade),
      ),
    ),
  );

  Widget buildBilan(Event event) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 3,
      child: ListTile(
        trailing: IconButton(icon: Icon(Icons.download_rounded),
          onPressed:(){
            bilan(event.id_event);
          },),
        tileColor: Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        title: Text(event.nom,textAlign: TextAlign.left,),
        subtitle: Text(event.date+"     Grade = "+event.grade),
      ),
    ),
  );
}