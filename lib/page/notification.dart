import 'package:flutter/material.dart';
import 'package:hepius/class/notificationApi.dart';
import 'package:hepius/class/notification.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Notif extends StatefulWidget {
  const Notif({Key? key}) : super(key: key);

  @override
  State<Notif> createState() => _Notif();
}

class _Notif extends State<Notif> {
  List<ListNotification> Notifications= [];

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final notifications = await NotifApi.getNotif(prefs.getString('ip'));
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
        title: const Text('الإشعارات',style: TextStyle(color: Colors.white)),
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

  Widget buildOrd(ListNotification nt,int index) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 3,
      child: ListTile(
        tileColor: Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),

        title: Text(nt.details,textAlign: TextAlign.right,),
        subtitle: Text(nt.date,textAlign: TextAlign.right,),
        trailing: Image.asset('assets/images/bell.png',height: 25,),
        leading: IconButton(onPressed: (){
          NotifApi.deleteNotif(nt.id);
          delete(index);
        },
            icon: Icon(Icons.delete)),
      ),
    ),
  );
}
