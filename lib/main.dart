import 'package:flutter/material.dart';
import 'package:tll/aboutus.dart';
import 'package:tll/alphabet.dart';
import 'package:tll/vowel.dart';

import 'package:tll/trainpattern/minigamealphabet.dart';

import 'package:tll/trainpattern/minigamevowel.dart';

import 'package:tll/Quiz/alphabetquiz.dart';

import 'package:tll/trainpattern/minigamealphabet.dart';
import 'package:tll/trainpattern/patternlearntone.dart';
import 'package:tll/patternlearntone2.dart';
import 'package:tll/patternmatchdragdrop.dart';
import 'package:tll/patternsortword.dart';
import 'package:tll/patternfillintheblank.dart';
import 'package:tll/tone/patterntone1.dart';
import 'package:tll/patterngridselection.dart';
import 'package:tll/patternscrapble.dart';
import 'package:tll/trainpattern/patternmatchcombine.dart';
import 'package:tll/drawhand.dart';
import 'package:tll/patternhangman.dart';
import 'package:tll/patternvlistsort.dart';
import 'package:tll/patternvlistsortimg.dart';
import 'package:tll/Quiz/quiz3.dart';
import 'package:tll/Quiz/quiz2.dart';
import 'package:tll/Quiz/quiz1.dart';

void main() => runApp(NavigateMenu());

class NavigateMenu extends StatefulWidget{
  State createState() => new NavigateMenuState();

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
    return  MaterialApp(
        routes: <String, WidgetBuilder>{
        '/': (BuildContext context) {
        return   Scaffold(
            appBar: AppBar(
              title: const Text('Design Pattern'),
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

              ],
            ),
                body: new CustomScrollView(
                    slivers: <Widget>[
                      SliverPadding(
                        padding: EdgeInsets.all(16.0),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate(
                            [ Container(
                              width: 50.0,
                              height: 100,
                              child: Card(
                                  child: InkWell(
                                      splashColor: Colors.blue.withAlpha(30),
                                      onTap: () {

                                        setState(() {

                                         Navigator.push(context, new MaterialPageRoute(builder: (context)=> new SelectPattern()));
                                        });
                                      },
                                      child:
                                      Row(
                                        children: <Widget>[
                                          new Image.network(
                                              "http://www.kidlovescode.com/gamethai/pic/menu/pattern1.jpg",
                                              height: 190, width: 190),

                                          Text('Pattern Circle 1'),

                                        ],
                                      )


                                  )


                              ),

                            ),
                              Container(
                                width: 50.0,
                                height: 100,
                                child: Card(
                                    child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quiz1()));
                                          });
                                        },
                                        child:
                                        Row(
                                          children: <Widget>[
                                            new Image.network(
                                                "http://www.kidlovescode.com/gamethai/pic/menu/pattern5.jpg",
                                                height: 190, width: 190),

                                            Text('Pattern Quiz 1'),

                                          ],
                                        )


                                    )


                                ),

                              ),
                              Container(
                                width: 50.0,
                                height: 100,
                                child: Card(
                                    child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quiz2()));
                                          });
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            new Image.network(
                                                "http://www.kidlovescode.com/gamethai/pic/menu/pattern4.jpg",
                                                height: 190, width: 190),

                                            Text('Pattern Quiz 2'),

                                          ],
                                        )

                                    )


                                ),

                              ),
                              Container(
                                width: 50.0,
                                height: 100,
                                child: Card(
                                    child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quiz3()));
                                          });
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            new Image.network(
                                                "http://www.kidlovescode.com/gamethai/pic/menu/pattern3.jpg",
                                                height: 190, width: 190),

                                            Text('Pattern Quiz 3'),

                                          ],
                                        )

                                    )


                                ),

                              ),
                              Container(
                                width: 50.0,
                                height: 100,
                                child: Card(
                                    child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(context, new MaterialPageRoute(builder: (context)=> new QuizText()));
                                          });
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            new Image.network(
                                                "http://www.kidlovescode.com/gamethai/pic/menu/pattern2.jpg",
                                                height: 190, width: 190),

                                            Text('Pattern Quiz 4'),

                                          ],
                                        )

                                    )


                                ),

                              ),
                              Container(
                                width: 50.0,
                                height: 100,
                                child: Card(
                                    child: InkWell(
                                      splashColor: Colors.blue.withAlpha(30),
                                      onTap: () {
                                        setState(() {
                                          Navigator.push(context, new MaterialPageRoute(builder: (context)=> new WordTone()));
                                        });
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          new Image.network(
                                              "http://www.kidlovescode.com/gamethai/pic/menu/pattern7.jpg",
                                              height: 190, width: 190),

                                          Text('Pattern Tone 1'),

                                        ],
                                      )
                                      ,
                                    )


                                ),

                              ),
                              Container(
                                width: 50.0,
                                height: 100,
                                child: Card(
                                    child: InkWell(
                                      splashColor: Colors.blue.withAlpha(30),
                                      onTap: () {
                                        setState(() {
                                          Navigator.push(context, new MaterialPageRoute(builder: (context)=> new SliderGrid()));
                                        });
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          new Image.network(
                                              "http://www.kidlovescode.com/gamethai/pic/menu/pattern6.jpg",
                                              height: 190, width: 190),

                                          Text('Pattern Tone 2'),

                                        ],
                                      )
                                      ,
                                    )


                                ),

                              ),
                              Container(
                                width: 50.0,
                                height: 100,
                                child: Card(
                                    child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(context, new MaterialPageRoute(builder: (context)=> new ToneMarkPractise()));
                                          });
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            new Image.network(
                                                "http://www.kidlovescode.com/gamethai/pic/pattern6.jpg",
                                                height: 190, width: 190),

                                            Text('Practise Tone3'),

                                          ],
                                        )
                                    )


                                ),

                              ),

                              Container(
                                width: 50.0,
                                height: 100,
                                child: Card(
                                    child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(context, new MaterialPageRoute(builder: (context)=> new DragScreen()));
                                          });
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            new Image.network(
                                                "http://www.kidlovescode.com/gamethai/pic/pattern7.jpg",
                                                height: 190, width: 190),

                                            Text('Matching'),

                                          ],
                                        )
                                    )


                                ),

                              ),
                              Container(
                                width: 50.0,
                                height: 100,
                                child: Card(
                                    child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(context, new MaterialPageRoute(builder: (context)=> new SortWord()));
                                          });
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            new Image.network(
                                                "http://www.kidlovescode.com/gamethai/pic/pattern8.jpg",
                                                height: 190, width: 190),

                                            Text('Fill in 1'),

                                          ],
                                        )
                                    )


                                ),

                              ),
                              Container(
                                width: 50.0,
                                height: 100,
                                child: Card(
                                    child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(context, new MaterialPageRoute(builder: (context)=> new FillTheBlank()));
                                          });
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            new Image.network(
                                                "http://www.kidlovescode.com/gamethai/pic/pattern9.jpg",
                                                height: 190, width: 190),

                                            Text('Fill in 2'),

                                          ],
                                        )
                                    )


                                ),

                              ),
                              Container(
                                width: 50.0,
                                height: 100,
                                child: Card(
                                    child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(context, new MaterialPageRoute(builder: (context)=> new GridSelection(0)));
                                          });

                                        },
                                        child: Row(
                                          children: <Widget>[
                                            new Image.network(
                                                "http://www.kidlovescode.com/gamethai/pic/pattern10.jpg",
                                                height: 190, width: 190),

                                            Text('Grid Selection'),

                                          ],
                                        )
                                    )


                                ),

                              ),

                              Container(
                                width: 50.0,
                                height: 100,
                                child: Card(
                                    child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(context, new MaterialPageRoute(builder: (context)=> new WordScrabble(0)));
                                          });
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            new Image.network(
                                                "http://www.kidlovescode.com/gamethai/pic/pattern11.jpg",
                                                height: 190, width: 190),

                                            Text('Scrabble'),

                                          ],
                                        )
                                    )


                                ),

                              ),
                              Container(
                                width: 50.0,
                                height: 100,
                                child: Card(
                                    child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(context, new MaterialPageRoute(builder: (context)=> new CombineWordPtr()));
                                          });
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            new Image.network(
                                                "http://www.kidlovescode.com/gamethai/pic/pattern12.jpg",
                                                height: 190, width: 190),

                                            Text('Combine word'),

                                          ],
                                        )
                                    )


                                ),

                              ),
                              Container(
                                width: 50.0,
                                height: 100,
                                child: Card(
                                    child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Draw()));
                                          });
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            new Image.network(
                                                "http://www.kidlovescode.com/gamethai/pic/pattern13.jpg",
                                                height: 190, width: 190),

                                            Text('Draw alphabet'),

                                          ],
                                        )
                                    )


                                ),

                              ),
                              Container(
                                width: 50.0,
                                height: 100,
                                child: Card(
                                    child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(context, new MaterialPageRoute(builder: (context)=> new OrderingEvent()));
                                          });
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            new Image.network(
                                                "http://www.kidlovescode.com/gamethai/pic/pattern14.jpg",
                                                height: 190, width: 190),

                                            Text('Ordering event 1'),

                                          ],
                                        )
                                    )


                                ),

                              ),
                              Container(
                                width: 50.0,
                                height: 100,
                                child: Card(
                                    child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(context, new MaterialPageRoute(builder: (context)=> new OrderingEventImg()));
                                          });
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            new Image.network(
                                                "http://www.kidlovescode.com/gamethai/pic/pattern15.jpg",
                                                height: 190, width: 190),

                                            Text('Ordering event 2'),

                                          ],
                                        )
                                    )


                                ),

                              ),
                              Container(
                                width: 50.0,
                                height: 100,
                                child: Card(
                                    child: InkWell(
                                        splashColor: Colors.blue.withAlpha(30),
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quessing()));
                                          });
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            new Image.network(
                                                "http://www.kidlovescode.com/gamethai/pic/pattern16.jpg",
                                                height: 190, width: 190),

                                            Text('Quessing with Hangman'),

                                          ],
                                        )
                                    )


                                ),

                              ),


                            ],
                          ),
                        ),

                      ),

                ],

         ));
        }

        },
                      );



      }
/* Not call
  void startMiniGameAlphabet(BuildContext context){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new SelectPattern()));
    });
  }
  //import 'package:tll/Quiz/alphabetquiz.dart';
  void startMiniGameQuiz1(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quiz1()));
    });
  }
  //import 'package:tll/Quiz/quiz2.dart';
  void startMiniGameQuiz2(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quiz2()));
    });
  }

  //import 'package:tll/Quiz/quiz3.dart';
  void startMiniGameQuiz3(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quiz3()));
    });
  }
  //import 'package:tll/Quiz/quiz1.dart';
  void startMiniGameQuiz4(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new QuizText()));
    });
  }
  void startCombineWord(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new CombineWordPtr()));
    });
  }
  void startTonemark(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new WordTone()));
    });
  }
  void startTonemark2(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new SliderGrid()));
    });
  }
  void startTonemark3(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new ToneMarkPractise()));
    });
  }
  void startScrabble(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new WordScrabble(0)));
    });
  }
  void startFillIn1(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new SortWord()));
    });
  }
  void startFillIn2(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new FillTheBlank()));
    });
  }
  void startOrdering1(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new OrderingEvent()));
    });
  }
  void startOrdering2(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new OrderingEventImg()));
    });
  }

  void startMiniGameVowel(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new SelectPatternVowel()));
    });
  }
  void startAlphabet(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Alphabet()));
    });
  }
  void startHangman(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Quessing()));
    });
  }
  void startGridSelection(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new GridSelection(0)));
    });
  }
  void startDrawHand(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Draw()));
    });
  }
  void startVowel(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Vowel()));
    });
  }
  void startGame(){
    setState(() {
      //   Navigator.push(context, new MaterialPageRoute(builder: (context)=> new AnimalQuiz ()));
    });
  }
  void startMatching(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new DragScreen()));
    });
  }
  */
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
            content: Text('รูปแบบการออกแบบเกม \n'
                'ใช้เพื่อนำไปพัฒนาเกม \n'

                '> กดเลือกรูปแบบแล้วทดลองเล่น\n'
                'Back กดย้อนกลับไปเมนู'),
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
