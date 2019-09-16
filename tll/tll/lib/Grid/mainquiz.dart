import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tll/Grid/quiz.dart';
import 'package:tll/Grid/gridviewquiz.dart';
import 'package:tll/Grid/getquiz.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'ทดสอบความรู้';
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: new ThemeData(
        primaryColor: const Color(0xFF02BB9F),
        primaryColorDark: const Color(0xFF167F67),
        accentColor: const Color(0xFFFFAD32),
      ),
      home: new HomePage(title: appTitle),

    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          title,
          style: new TextStyle(
            color: const Color(0xFFFFFFFF),
          ),
        ),

      ),

      body: new FutureBuilder<List<Quiz>>(
        future: fetchQuiz(new http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new QuizGridView(quiz: snapshot.data)
              : new Center(child: new CircularProgressIndicator());
        },

      ),

    );
  }
}