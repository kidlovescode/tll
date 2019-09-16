import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tll/Grid/country.dart';
import 'package:tll/Grid/playsimpleaudio.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:tll/Grid/netwoklayer.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayer/audioplayer.dart';
import 'package:http/http.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'เรียนรู้ภาษาไทยแสนสนุก';
    final List listlearn = ['การอ่านออกเสียง','เรียนรู้คำ',"อ่านจับใจความ","เขียน"];
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this would produce 2 rows.
          crossAxisCount: 1,
          // Generate 100 Widgets that display their index in the List
          children: List.generate(1, (index) {

            return
              Column(
                children: <Widget>[
               Text(
                ' $listlearn[index]',
                style: Theme.of(context).textTheme.headline,


              ),
               Text("sdfdsfdsfdsfdsfds"),Text("sdfdsfdsfdsfdsfds"),Text("sdfdsfdsfdsfdsfds"),
                ],

            );
          }),
        ),
      ),
    );
  }
}
