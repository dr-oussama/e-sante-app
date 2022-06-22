import 'package:flutter/material.dart';
import 'package:hepius/part1/dashboard/api/notificationm.dart';
import 'package:hepius/part1/dashboard/api/notificationmApi.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Notifm extends StatefulWidget {
  const Notifm({Key? key}) : super(key: key);

  @override
  State<Notifm> createState() => _Notifm();
}

class _Notifm extends State<Notifm> {
  List<Notificationm> Notifications= [];

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final notifications = await NotifmApi.getNotif(prefs.getString('ipm'));
    setState(() => this.Notifications = notifications);
  }

  Future delete(int index) async {
    setState(() => this.Notifications.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإشعارات',style: TextStyle(color: Colors.white,),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff01D0C3),
      ),
      body: Column(
        children: [
          SizedBox(
            height: h*.04,
          ),
          Expanded(child: ListView.builder(
            itemCount: Notifications.length,
            itemBuilder: (context , index){
              final ord = Notifications[index];
              return buildOrd(ord,index);
            },
          )
          ),
        ],
      ),
    );
  }

  Widget buildOrd(Notificationm nt,int index) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 3,
      child: ListTile(
        tileColor: Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),

        title: Text(nt.nom+' '+nt.prenom+' a déclaré '+nt.toxicite+' de grade 3',textAlign: TextAlign.left,),
        subtitle: Text(nt.date,textAlign: TextAlign.left,),
        leading: Image.asset('assets/images/bell.png',height: 25,),
        trailing: IconButton(onPressed: (){
          NotifmApi.deleteNotif(nt.id);
          delete(index);
        },
            icon: Icon(Icons.delete)),
      ),
    ),
  );
}
