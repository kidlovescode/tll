import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tll/Grid/quiz.dart';
import 'package:tll/Grid/playsimpleaudio.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:tll/Grid/getquiz.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayer/audioplayer.dart';
import 'package:http/http.dart';



typedef void OnError(Exception exception);



class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

class QuizGridView extends StatelessWidget {
  final List<Quiz> quiz;

  QuizGridView({Key key, this.quiz}) : super(key: key);

  Card getStructuredGridCell(Quiz quiz) {


    return new Card(
        elevation: 1.5,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
           new  Row (
               children: <Widget>[
                 new Image(image: new AssetImage("images/question.png"), width: 80, height: 80),
    new MaterialButton(
    minWidth: 120.0,
    color: Colors.blueGrey,
    onPressed: (){},
    child: new Text(quiz.question,
    style: new TextStyle(
    fontSize: 20.0,
    color: Colors.white
    ),)),

                 ],

           ),


            FlatButton.icon(
              icon: const Icon(Icons.check_box_outline_blank, size: 25.0),
              label:  Text(quiz.choice1, semanticsLabel: 'DISABLED BUTTON 4'),
              onPressed: null,
            ),
            FlatButton.icon(
              icon: const Icon(Icons.check_box_outline_blank, size: 25.0),
              label:  Text(quiz.choice2, semanticsLabel: 'DISABLED BUTTON 4'),
              onPressed: null,
            ),
            FlatButton.icon(
              icon: const Icon(Icons.check_box_outline_blank, size: 25.0),
              label:  Text(quiz.choice3, semanticsLabel: 'DISABLED BUTTON 4'),
              onPressed: null,
            ),
            FlatButton.icon(
              icon: const Icon(Icons.check_box_outline_blank, size: 25.0),
              label:  Text(quiz.choice4, semanticsLabel: 'DISABLED BUTTON 4'),
              onPressed: null,
            ),



           new Padding(
              padding: EdgeInsets.only(left: 1.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                  Text("Hello"),

           //       new AudioApp('http://www.inspireadviser.com/gamethai/'+country.audiofile),
              ],
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      primary: true,
      crossAxisCount: 1,
      childAspectRatio: 0.80,
      children: List.generate(quiz.length, (index) {
        return getStructuredGridCell(quiz[index]);
      }),
    );
  }
}

