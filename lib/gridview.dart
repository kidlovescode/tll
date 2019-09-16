import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

typedef void OnError(Exception exception);

const kUrl = "http://www.kidlovescode.com/gamethai/audio/audio.mp3";
const kUrl2 = "http://www.kidlovescode.com/gamethai/audio/audio.mp3";

class Country {
  String name;
  String nativeName;
  String flag;
  String capital;
  Country({this.name, this.flag, this.capital,this.nativeName});
  factory Country.fromJson(Map<String, dynamic> json) {
    return new Country(
      name: json['name'] as String,
      nativeName: json['nativeName'] as String,
      flag: json['flag'] as String,
      capital: json['capital'] as String,
    );
  }
}




Future<List<Country>> fetchCountry(http.Client client) async {
  final response = await client.get('http://restcountries.eu/rest/v2/all');
  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parseData, response.body);
}

// A function that will convert a response body into a List<Country>
List<Country> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  List<Country> list =
  parsed.map<Country>((json) => new Country.fromJson(json)).toList();
  return list;
}


Card getStructuredGridCell(Country country) {

  @override
  Widget build(BuildContext context) async {
    return new GridView.count(
      primary: true,
      crossAxisCount: 2,
      childAspectRatio: 0.80,
      children: List.generate(country.length, (index) {
        return getStructuredGridCell(country[index]);
      }),
    );
  }

  return new Card(
      elevation: 1.5,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          new SvgPicture.network(
            country.flag.replaceAll('https', 'http'),
            height: 130.0,
            width: 100.0,
            placeholderBuilder: (BuildContext context) => new Container(
                padding: const EdgeInsets.all(60.0),
                child: const CircularProgressIndicator()),
          ),
          new Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(country.name),
                new Text(country.nativeName),
                new Text(country.capital),
              ],
            ),
          )
        ],
      ));
}



void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'World';
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
        title: new Text(title,
          style: new TextStyle(
            color: const Color(0xFFFFFFFF),
          ),
        ),
      ),
      body: new FutureBuilder<List<Country>>(
        future: fetchCountry(new http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new CountyGridView(country: snapshot.data)
              : new Center(child: new CircularProgressIndicator());
        },
      ),
    );
  }
}