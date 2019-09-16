
import 'package:flutter/material.dart';
import 'package:tll/tone/patterntone1.dart';
void main() => runApp(playTone());
String TERM;
class playTone extends StatefulWidget {

  @override
  _playToneState createState() => _playToneState();
}

class  _playToneState extends State<playTone> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ฝึกผันเสียงวรรณยุกต์'),
        ),
        body: Center(
          child: CustomScrollView(
            primary: false,
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(20.0),

                sliver: SliverGrid.count(
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: <Widget>[

                    new FloatingActionButton(
                      backgroundColor: Colors.green,
                      onPressed: () => {},
                      child: new Text("กา", style: new TextStyle(
                          color: Colors.white,
                          fontSize: 30

                      ),),
                    ),
                    new FloatingActionButton(
                      backgroundColor: Colors.green,
                      onPressed: () => {},
                      child: new Text("ขา", style: new TextStyle(
                          color: Colors.white,
                          fontSize: 30

                      )),
                    ),
                    new FloatingActionButton(
                      backgroundColor: Colors.green,
                      onPressed: () => {},
                      child: new Text("คา", style: new TextStyle(
                          color: Colors.white,
                          fontSize: 30

                      )),
                    ),
                    new FloatingActionButton(
                      backgroundColor: Colors.green,
                      onPressed: () => {},
                      child: new Text("งา", style: new TextStyle(
                      color: Colors.white,
                          fontSize: 30

                      )),
                    ),
                    new FloatingActionButton(
                      backgroundColor: Colors.green,
                      onPressed: () => {},
                      child: new Text("จา", style: new TextStyle(
                      color: Colors.white,
                          fontSize: 30

                      )),
                    ),
                    new FloatingActionButton(
                      backgroundColor: Colors.green,
                      onPressed: () => {},
                      child: new Text("จา", style: new TextStyle(
                      color: Colors.white,
                          fontSize: 30

                      )),
                    ),
                    new FloatingActionButton(
                      backgroundColor: Colors.green,
                      onPressed: () => {},
                      child: new Text("กา", style: new TextStyle(
    color: Colors.white,
    fontSize: 30

    )),
                    ),
                    new FloatingActionButton(
                      backgroundColor: Colors.green,
                      onPressed: () => {},
                      child: new Text("ขา", style: new TextStyle(
    color: Colors.white,
    fontSize: 30

    )),
                    ),
                    new FloatingActionButton(
                      backgroundColor: Colors.green,
                      onPressed: () => {},
                      child: new Text("คา", style: new TextStyle(
    color: Colors.white,
    fontSize: 30

    )),
                    ),
                    new FloatingActionButton(
                      backgroundColor: Colors.green,
                      onPressed: () => {},
                      child: new Text("งา", style: new TextStyle(
    color: Colors.white,
    fontSize: 30

    )),
                    ),
                    new FloatingActionButton(
                      backgroundColor: Colors.green,
                      onPressed: () => {},
                      child: new Text("จา", style: new TextStyle(
    color: Colors.white,
    fontSize: 30

    )),
                    ),
                    new FloatingActionButton(
                      backgroundColor: Colors.green,
                      onPressed: () => {},
                      child: new Text("จา", style: new TextStyle(
    color: Colors.white,
    fontSize: 30

    )),
                    ),
                    new FloatingActionButton(
                      backgroundColor: Colors.black12,
                      onPressed: () => {},
                      child: new Text(""),
                    ),
                    new FloatingActionButton(
                      backgroundColor: Colors.redAccent,
                      onPressed: () => {},
                      child: new Text("งา", style: new TextStyle(
    color: Colors.white,
    fontSize: 30

    )),
                    ),
                    new FloatingActionButton(
                      backgroundColor: Colors.black12,
                      onPressed: () => {},
                      child: new Text(""),
                    ),

                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
  void startAlphabet(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new WordTone(TERM)));
    });
  }
}