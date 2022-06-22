import 'package:flutter/material.dart';
import 'package:hepius/login.dart';
import 'package:hepius/page/homee.dart';
import 'package:hepius/page/profile.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentTab = 0;
  final List<Widget> screens =
      [
        const Homee(),
        const Profile()
      ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Homee();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: CircleAvatar(
          radius: 48,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("assets/images/logo.png")
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 15,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: h*.08,
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
                          currentScreen = const Homee();
                          currentTab = 0;
                        });

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: currentTab == 0 ? const Color(0xff01D0C3) : Colors.grey,
                          ),
                          Text(
                            'الصفحة الرئيسية',
                            style: TextStyle(color: currentTab == 0 ? const Color(0xff01D0C3) : Colors.grey
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
                        currentScreen = const Profile();
                        currentTab = 1;
                      });

                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentTab == 1 ? const Color(0xff01D0C3) : Colors.grey,
                        ),
                        Text(
                            'الملف الشخصي',
                            style: TextStyle(color: currentTab == 1 ? const Color(0xff01D0C3) : Colors.grey
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
