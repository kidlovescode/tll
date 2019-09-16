import 'package:tll/dragdrop/order.dart';

import 'package:tll/dragdrop/dragboxorder.dart';

import 'package:flutter/material.dart';



final wmatch = [

  new Matching(0, 'พ', ''),

  new Matching(1, 'ะ', ''),

  new Matching(2, 'ร', ''),

  new Matching(3, 'ม', ''),
  new Matching(4, 'ล', ''),
  new Matching(5, 'า', ''),
  new Matching(6, 'า', ''),


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
            title: new Text( "เรียงลำดับ"             ,
              style: new TextStyle(
                color: const Color(0xFFFFFFFF), fontSize: 30,
              ),
            ),

          ),
          body:  new GameView(items),




        ));

  }



  ThemeData _getTheme(BuildContext context) => Theme.of(context).copyWith(

      textTheme: new TextTheme(

          body1: new TextStyle(fontSize: 30.0, color: Colors.grey.shade700)));

}