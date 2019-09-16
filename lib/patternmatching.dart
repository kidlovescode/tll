import 'package:tll/dragdrop/matching.dart';

import 'package:tll/dragdrop/dragbox.dart';

import 'package:flutter/material.dart';



final wmatch = [

  new Matching(1, 'กระเป๋า', 'คำกิริยา'),

  new Matching(0, 'กิน', 'คำนาม'),

  new Matching(3, 'ผอม', 'คำสรรพนาม'),

  new Matching(2, 'ฉัน', 'คำวิเศษณ์'),


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