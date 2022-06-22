import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:hepius/class/video.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  Videos video;
  VideoApp(this.video);
  @override
  _VideoAppState createState() => _VideoAppState(video);
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  Videos video;

  _VideoAppState(this.video);

  @override
  void initState() {
    super.initState();
    _initPlayer();
    print(video.path);
  }

  void _initPlayer() async {
    videoPlayerController = VideoPlayerController.network(
        'http://192.168.43.231/hepius/video/${video.path}');

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(video.title,style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff01D0C3),
      ),
      body: chewieController!=null? SingleChildScrollView(
        child: Container(
          child: SizedBox(
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: w,
                  child: AspectRatio(
                    aspectRatio: videoPlayerController.value.aspectRatio,
                    child: Chewie(
                      controller: chewieController!,
                    ),
                  ),
                ),
                SizedBox(
                  height: h*.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SizedBox(
                    height: h*.1,
                    child: FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        color: const Color(0xfff5f6f9),
                        onPressed: (){
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(child: Text("محدك في الحياة كاين دائما امل",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,)),
                            SizedBox(width: 20),
                            SizedBox(
                                width: w*.06,
                                height: w*.06,
                                child: Image.asset('assets/images/breast-cancer.png')
                            )
                          ],
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ) : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}