import 'package:flutter/material.dart';
import 'package:hepius/part1/dashboard/cchart.dart';
import 'package:hepius/part1/dashboard/dchart.dart';
import 'package:hepius/part1/dashboard/pchart.dart';
import 'package:hepius/part1/dashboard/tchart.dart';
import 'package:hepius/part1/page/homee.dart';

class Charts extends StatefulWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  State<Charts> createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>   Dashboard()),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Statistics',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0)),
                SizedBox(width: 10.0),
                Text('Charts',
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
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height - 300.0,
                        child: ListView(children: [const SizedBox(height: 20),Padding(
                            padding: EdgeInsets.only(left: 0, right: 10.0, top: 10.0),
                          child: ListTile(
                            tileColor: Color(0xFFFFFFFF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            leading: SizedBox(
                                height: size.height*.18,
                                width: size.width*.18, // fixed width and height
                                child: Image.asset('assets/images/chartp.jpg')
                            ),
                            title: Text("Patient By Year",style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold
                            )),
                            trailing: IconButton(
                                icon: Icon(Icons.add),
                                color: Colors.black,
                                onPressed: () {}
                            ),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Pchart()),
                              );
                            },
                          ),),const SizedBox(height: 20),Padding(
                          padding: EdgeInsets.only(left: 0.0, right: 10.0, top: 10.0),
                          child: ListTile(
                            tileColor: Color(0xFFFFFFFF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            leading: SizedBox(
                                height: size.height*.18,
                                width: size.width*.18, // fixed width and height
                                child: Image.asset('assets/images/chartd.jpg')
                            ),
                            title: Text("Doctor By Year",style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold
                            )),
                            trailing: IconButton(
                                icon: Icon(Icons.add),
                                color: Colors.black,
                                onPressed: () {}
                            ),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Dchart()),
                              );
                            },
                          ),),const SizedBox(height: 20),Padding(
                          padding: EdgeInsets.only(left: 0.0, right: 10.0, top: 10.0),
                          child: ListTile(
                            tileColor: Color(0xFFFFFFFF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            leading: SizedBox(
                                height: size.height*.18,
                                width: size.width*.18, // fixed width and height
                                child: Image.asset('assets/images/chartc.jpg')
                            ),
                            title: Text("Cure By Year",style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold
                            )),
                            trailing: IconButton(
                                icon: Icon(Icons.add),
                                color: Colors.black,
                                onPressed: () {}
                            ),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Cchart()),
                              );
                            },
                          ),),const SizedBox(height: 20),Padding(
                          padding: EdgeInsets.only(left: 0.0, right: 10.0, top: 10.0),
                          child: ListTile(
                            tileColor: Color(0xFFFFFFFF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            leading: SizedBox(
                                height: size.height*.18,
                                width: size.width*.18, // fixed width and height
                                child: Image.asset('assets/images/chartt.jpg')
                            ),
                            title: Text("Toxicity By Year",style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold
                            )),
                            trailing: IconButton(
                                icon: Icon(Icons.add),
                                color: Colors.black,
                                onPressed: () {}
                            ),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Tchart()),
                              );
                            },
                          ),),
                        ]))),
              ],
            ),
          )
        ],
      ),
    );
  }
}