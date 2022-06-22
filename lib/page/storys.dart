import 'package:flutter/material.dart';
import 'package:hepius/class/ordonnanceApi.dart';
import 'package:hepius/class/video.dart';
import 'package:hepius/class/videoApi.dart';
import 'package:hepius/class/video.dart';
import 'package:hepius/page/story.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../class/ordonnance.dart';



class Story extends StatefulWidget {
  const Story({Key? key}) : super(key: key);

  @override
  State<Story> createState() => _Story();
}

class _Story extends State<Story> {
  List<Videos> Video= [];

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final video = await VideoApi.getVideos();
    setState(() => this.Video = video);
  }


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('القصص',style: TextStyle(color: Colors.white)),
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
              Text('يمكنك الإطلاع على القصص هنا',style: TextStyle(fontSize: w*.05),),
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
            itemCount: Video.length,
            itemBuilder: (context , index){
              final ord = Video[index];
              return buildOrd(ord,h,w);
            },
          )
          ),
        ],
      ),
    );
  }

  Widget buildOrd(Videos video,double h,double w) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: SizedBox(
      height: h*.1,
      child: FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: const Color(0xfff5f6f9),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VideoApp(video)),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               Icon(Icons.arrow_back_ios),
               Expanded(child: Text("${video.title}",style: TextStyle(fontSize: 18),textAlign: TextAlign.right,)),
               SizedBox(width: 20),
              SizedBox(
                  width: w*.06,
                  height: w*.06,
                  child: Image.asset('assets/images/feather-pen.png')
              )
            ],
          )),
    ),
  );
}
