import 'package:flutter/material.dart';
import 'package:hepius/class/ordonnanceApi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../class/ordonnance.dart';



class ListOrd extends StatefulWidget {
  const ListOrd({Key? key}) : super(key: key);

  @override
  State<ListOrd> createState() => _ListOrdState();
}

class _ListOrdState extends State<ListOrd> {
  List<Ord> Ords= [];

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final ord = await OrdApi.getOrds(prefs.getString('ip'));
    setState(() => this.Ords = ord);
  }

  _launchURL(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = 'http://192.168.43.231/hepius/pdf1.php?id=$id';
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('السجل',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff01D0C3),
      ),
      body: Column(
        children: [
          SizedBox(
            height: h*.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('الوصفات الطبية السابقة',style: TextStyle(fontSize: w*.05),),
              IconButton(onPressed: (){
              },
                  icon: const Icon(
                      Icons.speaker_phone
                  ))
            ],
          ),
          SizedBox(
            height: h*.04,
          ),
          Expanded(child: ListView.builder(
            itemCount: Ords.length,
            itemBuilder: (context , index){
              final ord = Ords[index];
              return buildOrd(ord);
            },
            )
          ),
        ],
      ),
    );
  }

  Widget buildOrd(Ord ord) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 3,
      child: ListTile(
        tileColor: Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),

        title: Text(ord.toxicite),
        subtitle: Text("date : "+ord.date),
        trailing: IconButton(icon: Icon(Icons.download_rounded),
        onPressed:(){
          _launchURL(ord.id);
        },),
      ),
    ),
  );
}
