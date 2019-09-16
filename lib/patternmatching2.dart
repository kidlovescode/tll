import 'package:tll/dragdrop/matching2.dart';

import 'package:tll/dragdrop/dragboxmatching2.dart';

import 'package:flutter/material.dart';



final wmatch = [

  new Matching(1, 'images/q1c1.png', 'กระเป๋า'),

  new Matching(0, 'images/q1c2.png', 'กิน'),

  new Matching(0, 'images/q1c3.png', 'นอน'),

  new Matching(0, 'images/q1c4.png', 'วิ่ง'),


];



void main() {

  runApp(new DropCityApp(wmatch));

}



class DropCityApp extends StatelessWidget {

  List<Matching> items;



  DropCityApp(this.items);



  @override

  Widget build(BuildContext context) {

    return new MaterialApp(

        theme: _getTheme(context),

        home: new Scaffold(
          appBar: new AppBar(
            title: new Text( "จับคู่"             ,
              style: new TextStyle(
                color: const Color(0xFFFFFFFF),
              ),
            ),

          ),
          body: new GameView(items),

        ));

  }



  ThemeData _getTheme(BuildContext context) => Theme.of(context).copyWith(

      textTheme: new TextTheme(

          body1: new TextStyle(fontSize: 16.0, color: Colors.grey.shade700)));

}