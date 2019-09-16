import 'package:tll/dragdrop/fillin.dart';
import 'package:tll/dragdrop/dragboxfillin.dart';
import 'package:flutter/material.dart';



final wmatch = [

  new Matching(0, 'ตลาด', '1'),

  new Matching(1, 'กระเป๋า', '2'),




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
            title: new Text( "เติมคำลงในช่องว่าง"             ,
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