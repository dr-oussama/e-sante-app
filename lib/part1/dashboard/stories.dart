import 'package:flutter/material.dart';
import 'package:hepius/part1/page/homee.dart';

class Stories extends StatefulWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
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
                Text('Patient',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Stories',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
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
                            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Storyinfo(1)),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                        child: Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 32,
                                                backgroundImage: AssetImage('assets/images/s1.jpg'),
                                              ),
                                              SizedBox(width: 10.0),
                                              Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children:[
                                                    Text(
                                                        'Amy Wolf',
                                                        style: TextStyle(
                                                            fontFamily: 'Montserrat',
                                                            fontSize: 17.0,
                                                            fontWeight: FontWeight.bold
                                                        )
                                                    ),
                                                    Text(
                                                        '',
                                                        style: TextStyle(
                                                            fontFamily: 'Montserrat',
                                                            fontSize: 15.0,
                                                            color: Colors.grey
                                                        )
                                                    )
                                                  ]
                                              )
                                            ]
                                        )
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.add),
                                        color: Colors.black,
                                        onPressed: () {

                                        }
                                    )
                                  ],
                                )
                            )),const SizedBox(height: 20),
                          Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Storyinfo(2)),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                          child: Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 32,
                                                  backgroundImage: AssetImage('assets/images/s2.jpg'),
                                                ),
                                                SizedBox(width: 10.0),
                                                Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children:[
                                                      Text(
                                                          'Maria Francomacaro',
                                                          style: TextStyle(
                                                              fontFamily: 'Montserrat',
                                                              fontSize: 17.0,
                                                              fontWeight: FontWeight.bold
                                                          )
                                                      ),
                                                      Text(
                                                          '',
                                                          style: TextStyle(
                                                              fontFamily: 'Montserrat',
                                                              fontSize: 15.0,
                                                              color: Colors.grey
                                                          )
                                                      )
                                                    ]
                                                )
                                              ]
                                          )
                                      ),
                                      IconButton(
                                          icon: Icon(Icons.add),
                                          color: Colors.black,
                                          onPressed: () {

                                          }
                                      )
                                    ],
                                  )
                              )),const SizedBox(height: 20),
                          Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Storyinfo(3)),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                          child: Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 32,
                                                  backgroundImage: AssetImage('assets/images/s4.jpg'),
                                                ),
                                                SizedBox(width: 10.0),
                                                Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children:[
                                                      Text(
                                                          'Miriam lieberman',
                                                          style: TextStyle(
                                                              fontFamily: 'Montserrat',
                                                              fontSize: 17.0,
                                                              fontWeight: FontWeight.bold
                                                          )
                                                      ),
                                                      Text(
                                                          '',
                                                          style: TextStyle(
                                                              fontFamily: 'Montserrat',
                                                              fontSize: 15.0,
                                                              color: Colors.grey
                                                          )
                                                      )
                                                    ]
                                                )
                                              ]
                                          )
                                      ),
                                      IconButton(
                                          icon: Icon(Icons.add),
                                          color: Colors.black,
                                          onPressed: () {

                                          }
                                      )
                                    ],
                                  )
                              )),const SizedBox(height: 20),
                          Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Storyinfo(4)),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                          child: Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 32,
                                                  backgroundImage: AssetImage('assets/images/s5.jpg'),
                                                ),
                                                SizedBox(width: 10.0),
                                                Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children:[
                                                      Text(
                                                          'Melanie Fowler',
                                                          style: TextStyle(
                                                              fontFamily: 'Montserrat',
                                                              fontSize: 17.0,
                                                              fontWeight: FontWeight.bold
                                                          )
                                                      ),
                                                      Text(
                                                          '',
                                                          style: TextStyle(
                                                              fontFamily: 'Montserrat',
                                                              fontSize: 15.0,
                                                              color: Colors.grey
                                                          )
                                                      )
                                                    ]
                                                )
                                              ]
                                          )
                                      ),
                                      IconButton(
                                          icon: Icon(Icons.add),
                                          color: Colors.black,
                                          onPressed: () {

                                          }
                                      )
                                    ],
                                  )
                              )),
                        ]))),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Storyinfo extends StatelessWidget {
  final int story;

  Storyinfo(this.story);

  @override
  Widget build(BuildContext context) {
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
                      MaterialPageRoute(builder: (context) => Stories()),
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
                Text('Patient',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Stories',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height - 300.0,
                        child: ListView(children: [
                          Buildstory(),
                        ]))),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget Buildstory() {
    if(story == 1){
      return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: Expanded(child: Text("My name is Amy Wolf and I am a breast cancer survivor who was treated at Fox Chase Cancer Center. Before my diagnosis, I worked with preschoolers, acting as an aid for children with autism. After going in for an annual physical, my doctor felt a lump in my left breast, but when she placed my hand on it, I couldn’t feel it. Right after she told me about the lump, the doctor booked a diagnostic mammogram for me and sent the mammogram team a note about the specific area she was talking about. After the mammogram showed what she had felt, they brought me in from the waiting room and took me for an ultrasound. I knew the results of the ultrasound wouldn’t be what I wanted, and I was right. After a biopsy in July 2015, I was diagnosed with hormone receptor-positive, HER-2 negative breast cancer. The diagnosis was quite a shock, as I have no family history of breast cancer. However, the doctors and staff at Fox Chase significantly reduced my worry and fear with their expertise and by having the answer for every question that I had.  For more visit this website : https://www.foxchase.org/patient-stories/amy-wolf",style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontSize: 18.0))),
      );
    }else if(story == 2){
      return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: Expanded(child: Text("My name is Maria Francomacaro and I am a breast cancer survivor who was treated at Fox Chase Cancer Center. Before my diagnosis, I worked with preschoolers, acting as an aid for children with autism. After going in for an annual physical, my doctor felt a lump in my left breast, but when she placed my hand on it, I couldn’t feel it. Right after she told me about the lump, the doctor booked a diagnostic mammogram for me and sent the mammogram team a note about the specific area she was talking about. After the mammogram showed what she had felt, they brought me in from the waiting room and took me for an ultrasound. I knew the results of the ultrasound wouldn’t be what I wanted, and I was right. After a biopsy in July 2015, I was diagnosed with hormone receptor-positive, HER-2 negative breast cancer. The diagnosis was quite a shock, as I have no family history of breast cancer. However, the doctors and staff at Fox Chase significantly reduced my worry and fear with their expertise and by having the answer for every question that I had.  For more visit this website : https://www.foxchase.org/patient-stories/amy-wolf",style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontSize: 18.0))),
      );
    }else if(story == 3){
      return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: Expanded(child: Text("My name is Miriam Lieberman and I am a breast cancer survivor who was treated at Fox Chase Cancer Center. Before my diagnosis, I worked with preschoolers, acting as an aid for children with autism. After going in for an annual physical, my doctor felt a lump in my left breast, but when she placed my hand on it, I couldn’t feel it. Right after she told me about the lump, the doctor booked a diagnostic mammogram for me and sent the mammogram team a note about the specific area she was talking about. After the mammogram showed what she had felt, they brought me in from the waiting room and took me for an ultrasound. I knew the results of the ultrasound wouldn’t be what I wanted, and I was right. After a biopsy in July 2015, I was diagnosed with hormone receptor-positive, HER-2 negative breast cancer. The diagnosis was quite a shock, as I have no family history of breast cancer. However, the doctors and staff at Fox Chase significantly reduced my worry and fear with their expertise and by having the answer for every question that I had.  For more visit this website : https://www.foxchase.org/patient-stories/amy-wolf",style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontSize: 18.0))),
      );
    }else{
      return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: Expanded(child: Text("My name is Melanie Fowler and I am a breast cancer survivor who was treated at Fox Chase Cancer Center. Before my diagnosis, I worked with preschoolers, acting as an aid for children with autism. After going in for an annual physical, my doctor felt a lump in my left breast, but when she placed my hand on it, I couldn’t feel it. Right after she told me about the lump, the doctor booked a diagnostic mammogram for me and sent the mammogram team a note about the specific area she was talking about. After the mammogram showed what she had felt, they brought me in from the waiting room and took me for an ultrasound. I knew the results of the ultrasound wouldn’t be what I wanted, and I was right. After a biopsy in July 2015, I was diagnosed with hormone receptor-positive, HER-2 negative breast cancer. The diagnosis was quite a shock, as I have no family history of breast cancer. However, the doctors and staff at Fox Chase significantly reduced my worry and fear with their expertise and by having the answer for every question that I had.  For more visit this website : https://www.foxchase.org/patient-stories/amy-wolf",style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontSize: 18.0))),
      );
    }
  }
}