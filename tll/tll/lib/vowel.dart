import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tll/Grid/vowelgridview.dart';
import 'package:tll/Data/getvowel.dart';
import 'package:tll/Data/datamodel2.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new Vowel());

class Vowel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'ทบทวน';
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
      body: new FutureBuilder<List<VowelDataModel>>(
        future: fetchData(new http.Client(),"http://inspireadviser.com/gamethai/jason/vowel.json"),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new VowelGridView(vowel: snapshot.data)
              : new Center(child: new CircularProgressIndicator());
        },

      ),

      //  new BasicAppBarSample(),

    );
  }
}
