import 'package:flutter/material.dart';
import 'package:tll/aboutus.dart';
import 'package:tll/alphabet.dart';
import 'package:tll/vowel.dart';
import 'package:tll/patternalphabetquiz.dart';


void main(){
  runApp(
      new MaterialApp(
        home: new NavigateMenu(),
      )
  );
}

class NavigateMenu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new NavigateMenuState();
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'คำแนะนำ', icon: Icons.help),
  const Choice(title: 'ผู้พัฒนา', icon: Icons.account_box),

];

class NavigateMenuState extends State<NavigateMenu>{
  Choice _selectedChoice = choices[0]; // The app's "state".

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(

        appBar: AppBar(
          title: const Text('เรียนภาษาไทยแสนสนุก'),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(choices[0].icon),
              onPressed: () {
               // _select(choices[0]);
                _showMaterialDialog();
              },
            ),
            // action button
            IconButton(
              icon: Icon(choices[1].icon),
              onPressed: () { aboutUs();
               // _select(choices[1]);
              },
            ),
            // overflow menu
        /*    PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.skip(2).map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.title),
                  );
                }).toList();
              },
            ),
            */
          ],
        ),

        body: new Container(
          color: Colors.white,
          //margin: const EdgeInsets.all(25.0),
          child: new Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new MaterialButton(
                  height: 170.0,

                  //onPressed: startQuiz,
                  child:
                  new Image.network("http://www.kidlovescode.com/gamethai/pic/learning1.jpg",
                      height: 180,width: 250),
                  /*
                  new Text("หมวดการเรียนรู้ฝึกอ่านออกเสียง",
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                    ),), onPressed: () {},
                */
              ),
              new Padding(padding: EdgeInsets.all(10.0)),
              new MaterialButton(
                  height: 80.0,
                  color: Colors.lightBlue[800],
                  onPressed: startAlphabet,
                  child: new Text("ฝึกอ่านพยัญชนะ/Alphabets",
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                    ),)
              ),
              new Padding(padding: EdgeInsets.all(10.0)),
              new MaterialButton(
                  height: 80.0,
                  color: Colors.lightBlue[800],
                  onPressed: startVowel,
                  child: new Text("ฝึกอ่านสระ/Vowels",
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                    ),)
              ),
              new Padding(padding: EdgeInsets.all(10.0)),
/*
              new MaterialButton(
                  height: 80.0,
                  color: Colors.green,
                  onPressed: startGame,
                  child: new Text("เล่นเกม/Play game",
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                    ),)
              ),
 */
            ],
          ),
        ),




    );
  }

  void startAlphabet(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Alphabet()));
    });
  }
  void startVowel(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Vowel()));
    });
  }

  void aboutUs(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new AboutUs()));
    });
  }
  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('คำแนะนำ'),
            content: Text('ฝึกอ่านพยัญชนะ และสระในภาษาไทย \n'
                'พยัญชนะมีทั้งหมด 44 ตัวอักษร \n'
                'สระมีทั้งหมด 21 เสียง \n'
                '> กดปุ่มเพื่อเลือกเฝึกอ่าน หรือ\n'
                '> เล่นเกมเพื่อทบทวน'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('ปิด')),

            ],
          );
        });
  }


  _dismissDialog() {
    Navigator.pop(context);
  }
}
