import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "package:url_launcher/url_launcher.dart";
// Uncomment lines 7 and 10 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  // debugPaintSizeEnabled = true;
  runApp(AboutUs());
}


class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'ผู้พัฒนา';
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: new ThemeData(
        primaryColor: const Color(0xFF02BB9F),
        primaryColorDark: const Color(0xFF167F67),
        accentColor: const Color(0xFFFFAD32),
      ),
      home: new AboutUsHome(title: appTitle),

    );
  }
}

class AboutUsHome extends StatelessWidget {
  final String title;

  AboutUsHome({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'kidlovescode.com',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Bangkok, Thailand',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('1111'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'WEB'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );




    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        "KIDLOVESCODE.COM is a private non profit business. "+
            "We have expertise in software development."+
            "We are located in Bangkok, Thailand."+
            "We produce the products support kids learning."+
            "Connect us at the websites www.kidlovescode.com.  \n"+
            "Khob khun mak mak ka\n"+"ขอบคุณค่ะ\n"+
        "คิด เลิฟ โค้ด "
            ,
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'About us',
      home: Scaffold(
        appBar: AppBar(
          title: Text('About us'),
        ),
        body: ListView(
          children: [
            Image.asset(
              "images/kid.jpg",
              width: 600,
              height: 300,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {

    switchActivity(String word){
      if (word=="WEB")
        _launchURL() async {
          const url = 'http://www.kidlovescode.com';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        }

    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Icon(icon, color: Colors.lightBlue),
        Container(
          color: Colors.deepOrange[200],
          margin: const EdgeInsets.only(top: 8),
          child:
          RaisedButton(
            onPressed:  switchActivity(label),
            color: Colors.deepOrangeAccent,
            child:
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),

            ),


          ),



        ),
      ],
    );
  }
}