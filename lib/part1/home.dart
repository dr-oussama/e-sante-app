import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hepius/part1/page/homee.dart';
import 'package:hepius/part1/page/profile.dart';


class Home1 extends StatefulWidget {
  const Home1({Key? key,}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  int currentTab = 0;
  final List<Widget> screens =
      [
        Homee(),
        Profile()
      ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Homee();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage("assets/images/logoh2.png",
          ),
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff01D0C3),
        elevation: 15,
        shape: CircularNotchedRectangle(),
        notchMargin: 15,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen = Homee();
                          currentTab = 0;
                        });

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: currentTab == 0 ? Color(
                                0xff039c91) : Colors.white,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(color: currentTab == 0 ? Color(
                                0xff039c91) : Colors.white
                            )
                          )
                        ],
                      ),
                  )
                ],
              ),
              // Right Tab Bar Icons
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = Profile();
                        currentTab = 1;
                      });

                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentTab == 1 ? Color(
                              0xff039c91) : Colors.white,
                        ),
                        Text(
                            'Profile',
                            style: TextStyle(color: currentTab == 1 ? Color(
                                0xff039c91) : Colors.white
                            )
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
