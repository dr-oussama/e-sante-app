import 'package:flutter/material.dart';
import 'package:hepius/firstpage.dart';
import 'package:hepius/home.dart';
import 'package:hepius/login.dart';
import 'package:hepius/palette.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'part1/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var doctor = prefs.getString('doctor');
  var patient = prefs.getString('patient');
  print(doctor);
  print(patient);
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Palette.greencyan,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(foregroundColor: Colors.white),
    ),
    debugShowCheckedModeBanner: false,
    home: doctor == null && patient == null ? Firstpage() : doctor == null && patient != null ? Home() : Home1(),
    routes: {
      '/login':(_) => Login(),
      '/home':(_) => Home1()
    },
  ));
}
