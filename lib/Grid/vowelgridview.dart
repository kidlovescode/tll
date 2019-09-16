import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tll/Data/datamodel2.dart';
import 'package:tll/audio/playsimpleaudio.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:tll/Data/getvowel.dart';
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

class VowelGridView extends StatelessWidget {
  final List<VowelDataModel> vowel;

  VowelGridView({Key key, this.vowel}) : super(key: key);

  Card getStructuredGridCell(VowelDataModel vowel) {


    return new Card(
        elevation: 1.5,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[


            new Image.network(vowel.pic,
                height: 190,width: 190
                ),

           new Padding(
              padding: EdgeInsets.only(left: 1.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[


                  new AudioApp('http://www.kidlovescode.com/gamethai/'+vowel.audiofile),
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
      crossAxisCount: 2,
      childAspectRatio: 0.80,
      children: List.generate(vowel.length, (index) {
        return getStructuredGridCell(vowel[index]);
      }),
    );
  }
}

