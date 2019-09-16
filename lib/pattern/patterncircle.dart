import 'package:flutter/material.dart';
import 'package:tll/Quiz/alphabetquiz.dart';
import 'package:tll/trainpattern/minigamealphabet.dart';
void main() {
  runApp(new MaterialApp(home: new ExampleWidget()));
}

class ExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget bigCircle = new Container(
      width: 400.0,
      height: 400.0,
      decoration: new BoxDecoration(
        color: Colors.orange,
        shape: BoxShape.circle,
      ),
    );
    void startQuiz1(){
     // setState(() {
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quiz1()));
   //   });
    }
    void startSelect(){
      // setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new SelectPattern()));
      //   });
    }
    return new Material(
      color: Colors.black,
      child: new Center(
        child: new Stack(
          children: <Widget>[
            bigCircle,
            new Positioned(
              child: new CircleButton(
                  onTap: () => startQuiz1(),
                  iconData: Icons.chrome_reader_mode,
                 // child: new  Text('A Circular Button'),
                  textt: Text("พยัญชนะชุด 2",textAlign: TextAlign.center)
              ),
              top: 10.0,
              left: 160.0,
               
            ),
            new Positioned(
              child: new CircleButton(onTap: () => startSelect(), iconData: Icons.timer, textt: Text("พยัญชนะชุด 5",textAlign: TextAlign.center) ),
              top: 160.0,
              left: 10.0,
            ),
            new Positioned(
              child: new CircleButton(onTap: () => print("Cool"), iconData: Icons.place, textt: Text("พยัญชนะชุด 3",textAlign: TextAlign.center) ),
              top: 160.0,
              right: 10.0,
            ),
            new Positioned(
              child: new CircleButton(onTap: () => print("Cool"), iconData: Icons.local_pizza,textt: Text("พยัญชนะชุด 4",textAlign: TextAlign.center) ),
              top: 300.0,
              left: 160.0,
            ),
            new Positioned(
              child: new CircleButton(onTap: () => print("Cool"), iconData: Icons.satellite, textt: Text("พยัญชนะชุด 1",textAlign: TextAlign.center) ),
              top: 160.0,
              left: 160.0,
            ),
          ],
        ),
      ),
    );
  }

}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;
  final Text textt;
  const CircleButton({Key key, this.onTap, this.iconData, this.textt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 80.0;

    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: size,
        height: size,

        decoration:

        new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,

        ),

        child:

          Column(
            children: <Widget>[
              new Icon(  iconData,   color: Colors.black),
              textt,
            ],
          ),


    ),


    );
  }

}