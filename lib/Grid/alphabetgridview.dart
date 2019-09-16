//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tll/Data/datamodel1.dart';
import 'package:tll/audio/playsimpleaudio.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:tll/Grid/netwoklayer.dart';
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

class AlphabetGridView extends StatelessWidget {
  final List<AlphabetDataModel> alphabet;

  AlphabetGridView({Key key, this.alphabet}) : super(key: key);

  Card getStructuredGridCell(AlphabetDataModel alphabet) {


    return new Card(
        elevation: 1.5,
        color: Colors.white,
         shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
    ),

    child: new Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,

          verticalDirection: VerticalDirection.down,

            children: <Widget>[

              new Container(
                    // color: Colors.white,
                    width : 300, height:240,
                    child: new FlatButton(


                        //color: Colors.green,
                        child:  new Column(
                        children: <Widget>[

                          new Image.network('http://www.kidlovescode.com/gamethai/'+alphabet.flag,
                              height: 180,width: 180),
                          new Padding(
                            padding: EdgeInsets.only(left: 1.0),        ),
                          new AudioApp('http://www.kidlovescode.com/gamethai/'+alphabet.audiofile),

                        ],

                        ),

                       ),

              )]
            ));

  }

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      primary: true,
      crossAxisCount: 2,
      childAspectRatio: 0.80,
      children: List.generate(alphabet.length, (index) {
        return getStructuredGridCell(alphabet[index]);
      }),
    );
  }
}

