import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tll/progress/intervalprogressbar.dart';

Widget buildProgressBars() {
  return Center(
    child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [0,1,2,3,4,5].map<Widget>((i) {
          return Padding(
              padding: EdgeInsets.only(right: 10),
              child: IntervalProgressBar(
                  direction: IntervalProgressDirection.vertical,
                  max: 5,
                  progress: i,
                  intervalSize: 2,
                  size: Size(12, 200),
                  highlightColor: Colors.red,
                  defaultColor: Colors.grey,
                  intervalColor: Colors.transparent,
                  intervalHighlightColor: Colors.transparent,
                  reverse: true,
                  radius: 0));
        }).toList()),
  );
}

void main() {
  final app = MaterialApp(home: buildProgressBars());
  runApp(app);
}