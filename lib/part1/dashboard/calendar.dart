import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:hepius/part1/home.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:hepius/part1/dashboard/api/cevent.dart';
import 'package:hepius/part1/dashboard/api/ceventapi.dart';
import 'package:hepius/part1/dashboard/api/doctor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  Doctor doctor = new Doctor(id_medcin: '', nom: '', prenom: '', sexe: '', date_naissance: '', telephone: '', addresse: '', e_mail: '', mots_de_passe: '', picture: '');
  late List<Cevent> cevents = [];
  List<Cevent> ceventsd = [];
  TextEditingController _eventController = TextEditingController();
  int state = 0;

  void initState(){
    super.initState();
    init();
  }
  init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var json = prefs.getString('doctor');
    Map<String, dynamic> doctormap = jsonDecode(json!);
    setState(() => this.doctor = Doctor.fromJson(doctormap));
    final cevents = await CeventApi.getCEvents(doctor.id_medcin);
    setState(() { this.cevents=cevents;});
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  DateTimeRange daterange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {

    final start = daterange.start;
    final end = daterange.end;
    ceventsd.clear();
    for(Cevent e in cevents){
      DateTime dt1 = DateTime.parse(e.date);
      if( ((dt1.year == start.year && dt1.month == start.month && dt1.day == start.day) || dt1.compareTo(start) > 0)&&((dt1.year == end.year && dt1.month == end.month && dt1.day == end.day) || dt1.compareTo(end) < 0) ){
        ceventsd.add(e);
      }
    }
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar',style: TextStyle(color: Colors.white,fontSize: 20),),
        backgroundColor: Color(0xFF01D0C3),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("DateRange" ,style: TextStyle(fontSize: 25),),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    child: Text('${start.year}/${start.month}/${start.day}'),
                    onPressed: pickDateRange,
                  ),
                ),const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    child: Text('${end.year}/${end.month}/${end.day}'),
                    onPressed: pickDateRange,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: ceventsd.length+1,
                itemBuilder: (context, index) {
                  if(ceventsd.isEmpty){
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
                    final cevent = ceventsd[index-1];

                    return buildevents(cevent);
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Add Event"),
            content: TextFormField(
              controller: _eventController,
            ),
            actions: [
              TextButton(
                child: Text("Cancel"),
                onPressed: () { Navigator.pop(context);_eventController.clear();},
              ),
              TextButton(
                child: Text("Ok"),
                onPressed: () async{
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home1()),
                  );
                  DateTime? newdate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100),
                  );
                  Fluttertoast.showToast(msg: "Event added successfully",toastLength: Toast.LENGTH_SHORT);
                  if(newdate == null || _eventController.text == ''){
                    _eventController.clear();
                    return ;
                  }else{
                    String edate = DateFormat('yyyy-MM-dd').format(newdate);
                    state = await CeventApi.insertevent(doctor.id_medcin,edate,_eventController.text);
                    _eventController.clear();
                    return ;
                  }
                },
              ),
            ],
          ),
        ),
        label: Text("Add Event"),
        icon: Icon(Icons.add),
      ),
    );
  }
Future pickDateRange() async{
    DateTimeRange? newdaterange = await showDateRangePicker(
      context: context,
      initialDateRange: daterange,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if(newdaterange == null)return ;
    setState(() => daterange = newdaterange);
  }

  Widget buildevents(Cevent cevent) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 3,
      child: ListTile(
        tileColor: Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        title: Text(cevent.details),
        subtitle: Text(cevent.date),
        trailing: IconButton(iconSize: 20, icon: Icon(Icons.delete,color: Colors.green,), onPressed: () async{
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Home1()),
          );
          Fluttertoast.showToast(msg: "Event deleted successfully",toastLength: Toast.LENGTH_SHORT);
          state = (await CeventApi.deleteevent(cevent.id)) ;

        }
        ),
      ),
    ),
  );
}