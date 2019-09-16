import 'package:flutter/material.dart';
/*
void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}
*/

void main(){
  runApp(new MaterialApp(
    home: new SliderGrid(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

//State is information of the application that can change over time or when some actions are taken.
class _State extends State<MyApp>{

  double _value = 0.0;
  void _setvalue(double value) => setState(() => _value = value);
  _displayLevel(level){
    if (level==0)
      return "เสียงสามัญ";
    else  if  (level==1)
      return "เสียงเอก";
    else if  (level==2)
      return "เสียงโท";
    else if  (level==3)
      return "เสียงตรี";
    else if  (level==4)
      return "เสียงจัตวา";


  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('เรียนรู้การผันวรรณยุกต์'),
      ),
      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              //  new Text('Value: ${(_value ).round()}'),
              new Text(_displayLevel(_value .round())),
              //  new Text('Value: $_value '),
              new Slider(value: _value,
                onChanged: _setvalue, min: 0, max:5, activeColor: Colors.lightGreen,inactiveColor: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}


class SliderGrid extends StatefulWidget {
  @override
  _GridState createState() => new _GridState();
}

class _GridState extends State<SliderGrid> {
  var val1=0,val2=0,val3=0,val4=0,val5 = 0;
  _displayLevel(level){
    if (level==0)
      return "เริ่ม";
    else  if  (level==1)
      return "เสียงสามัญ";
    else if  (level==2)
      return "เสียงเอก";
    else if  (level==3)
      return "เสียงโท";
    else if  (level==4)
      return "เสียงตรี";

    else if  (level==5)
      return "เสียงจัตวา";

  }
  @override
  build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ผันวรรณยุกต์"),
        backgroundColor: Colors.red,
        elevation: 1.0,
      ),
      body: new Container(
        child: new Transform(
          alignment: FractionalOffset.center,
          // Rotate sliders by 90 degrees
          transform: new Matrix4.identity()..rotateZ(0  * 3.1415927 / 180),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new  Padding(
                padding: EdgeInsets.all(2.0),
                child: const Card(child: Text('กา')),
              ),
              new Row(

                children:  [

                  new  Padding(
                    padding: EdgeInsets.all(20.0),

                  ),
                  new Container(
                                 width: 60.0,
                                 height: 60.0,
                                 child: new Text( _displayLevel(val1.round())),
                                 decoration: new BoxDecoration(shape: BoxShape.circle,color: Colors.blue.shade100 )),
                new  Padding(
                  padding: EdgeInsets.all(2.0),

                ),
                        new Container(
                      width: 60.0,
                      height: 60.0,
                      child: new Text( _displayLevel(val1.round())),
                      decoration: new BoxDecoration(shape: BoxShape.circle,color: Colors.blue.shade100 )),
                new  Padding(
                  padding: EdgeInsets.all(2.0),

                ),
                  new Container(
                      width: 60.0,
                      height: 60.0,
                      child: new Text( _displayLevel(val1.round())),
                      decoration: new BoxDecoration(shape: BoxShape.circle,color: Colors.blue.shade100 )),
                new  Padding(
                  padding: EdgeInsets.all(2.0),

                ),
                  new Container(
                      width: 60.0,
                      height: 60.0,
                      child: new Text( _displayLevel(val1.round())),
                      decoration: new BoxDecoration(shape: BoxShape.circle,color: Colors.blue.shade100 )),
                new  Padding(
                  padding: EdgeInsets.all(2.0),

                ),
                  new Container(
                      width: 60.0,
                      height: 60.0,
                      child: new Text( _displayLevel(val1.round())),
                      decoration: new BoxDecoration(shape: BoxShape.circle,color: Colors.blue.shade100 )),
                   ]),

              new Slider(
                value: val1.toDouble(),
                min: 0.0,
                max: 5.0,
                divisions: 5,
                label: _displayLevel(val1.round()),
                onChanged: (double newValue) {
                  setState(() {
                    val1 = newValue.round();
                  });
                },
              ),
              new  Padding(
                padding: EdgeInsets.all(8.0),
                child: const Card(child: Text('ก่า')),
              ),
              new Slider(
                value: val2.toDouble(),
                min: 0.0,
                max: 5.0,
                divisions: 5,
                label: _displayLevel(val2.round()),
                onChanged: (double newValue) {
                  setState(() {
                    val2 = newValue.round();
                  });
                },
              ),
              new  Padding(
                padding: EdgeInsets.all(8.0),
                child: const Card(child: Text('ก้า')),
              ),
              new Slider(
                value: val3.toDouble(),
                min: 0.0,
                max: 5.0,
                divisions: 5,
                label: _displayLevel(val3.round()),
                onChanged: (double newValue) {
                  setState(() {
                    val3 = newValue.round();
                  });
                },
              ),
              new  Padding(
                padding: EdgeInsets.all(8.0),
                child: const Card(child: Text('ก๊า')),
              ),
              new Slider(
                value: val4.toDouble(),
                min: 0.0,
                max: 5.0,
                divisions: 5,
                label: _displayLevel(val4.round()),

                onChanged: (double newValue) {
                  setState(() {
                    val4 = newValue.round();
                  });
                },
              ),
              new  Padding(
                padding: EdgeInsets.all(8.0),
                child: const Card(child: Text('ก๋า')),
              ),
              new Slider(
                value: val5.toDouble(),
                min: 0.0,
                max: 5.0,
                divisions: 5,
                label: _displayLevel(val5.round()),
                onChanged: (double newValue) {
                  setState(() {
                    val5 = newValue.round();
                  });
                },
              ),
              /*     new Container(
          width: 80.0,
          height: 80.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
              color: Colors.blue.shade100,

          ),
        )*/],
          ),

        ),
      ),
    );
  }
}

/*

@override
Widget build(BuildContext context) {
  return new Scaffold(
    appBar: new AppBar(
      title: new Text('Image clip should be a circle'),
    ),
    body: new Center(
      child: new Container(
        width: 100.0,
        height: 100.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          backgroundColor: Theme.of(context).primaryColor,
          backgroundImage: new BackgroundImage(
            image: new AssetImage('assets/cat.jpg'),
          ),
        ),
      ),
    ),

  );
}
*/