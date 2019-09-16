import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:tll/datamodel/Category1_3.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:tll/dialog/popupscore.dart';
var questionNumber = 0;
var datam ;
var answer ;
var ch ;
//void main() => runApp(WordScrabble(0));
void main() {
  runApp(MaterialApp(home: WordScrabble(0)));
}
var ques = new Question();
class Question{
     var ques = [["ขนมทองหยอด"]];
     var grid = ["ก","ข","ค","ท","จ","า",
                 "ข","น","อ","อ","ส","า",
                 "น","ม","อ","ง","า","า",
                 "ข","ห","ย","อ","ด","ี",
                 "า","ป","า","โ","น","ม",
                 "น","า","น","ม","ก","า"];
     var answ = [["ข","น","ม"], ["ท","อ","ง"],
     ["ห","ย","อ","ด"],["ข","น"],["น","ม"],["ย","อ","ด"],["ท","อ"],["ย","อ"]];
}
////Share variable from data model
var score = 0;
var quest ;
var corrN ;
var learningtopic = 1;
var buttonCenterColor = Colors.yellow;
class WordScrabble extends StatefulWidget {
  //DataCategory1_3 datam;
  WordScrabble(topic){

    datam  = new DataCategory1_3(topic);
    answer = datam.getAnswer();
    ch =  datam.getChoice();
    quest = datam.getQuestion();
    corrN = datam.getCorrectNumber();
  }
  @override
  State<StatefulWidget> createState() {
    return  _WordScrabbleState();
  }
}

class  _WordScrabbleState extends State<WordScrabble> {

  Color  rightButton = new Color.fromARGB(155, 173, 213, 107) ;
  Color  wrongButton = new Color.fromARGB(155, 246, 95, 107);

  final  playButton = new Color.fromARGB(155,116, 108, 244);
  var colorButton, colorButton1, colorButton2,colorButton3,colorButton4,colorButton5,colorButton6,colorButton7,colorButton8
  ,colorButton9,colorButton10,colorButton11,colorButton12,colorButton13,colorButton14 ;



  void initState() {
    super.initState();
    setState(() {
    });

  }
  void _setColorButton() {
    super.initState();
    setState(() {
      colorButton = rightButton;
      print ("yes");
    });

  }




  @override
  Widget build(BuildContext context) {
    colorButton1 = playButton;colorButton2 = playButton;colorButton3 = playButton;
    colorButton4 = playButton;colorButton5 = playButton;colorButton6 = playButton;
    colorButton7 = playButton;colorButton8 = playButton;colorButton9 = playButton;
    colorButton10 = playButton;colorButton11 = playButton;colorButton12 = playButton;
    colorButton13 = playButton;colorButton14 = playButton;
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('แยกคำ'),
        ),
        body:  new
        Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
             new Container (
               padding: const EdgeInsets.all(8.0),
               child: Text("คำ:"+ques.ques[questionNumber][0], style: TextStyle(fontSize: 30),),),
        new Container(
            height: 570,
          child: Grid(),

        ), new Container(

                // child: new  Text ("คำที่แยกได้: "+TapWord.toString()),

               ),
             ]),
      ),
    );
  }
  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('ฝึกฝนในระดับที่สูงขึ้น'),
            content: Text('หากต้องการฝึกในระดับที่สูงขึ้นให้เลือก ไประดับถัดไป'),
            actions: <Widget>[
              FlatButton(

                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('ปิด')),
              FlatButton(
                onPressed: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (context)=> new WordScrabble(1)));
                  _dismissDialog();
                },
                child: Text('ไประดับถัดไป'),
              )
            ],
          );
        });
  }
  void startAlphabet(){
    setState(() {
      //Navigator.push(context, new MaterialPageRoute(builder: (context)=> new WordTone(TERM)));
    });
  }
  _dismissDialog() {
    Navigator.pop(context);
  }
}


var tapWord=[] ; //contain word
var TapWord=[] ; //answer
var taw=[];

class CreateDialogScore extends StatelessWidget {
  var Score;
  var Total;
  CreateDialogScore(score,total) {
    Score = score;
    Total = total;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  CupertinoAlertDialog(
      title: Text('คะแนน'),
      content: Text('คุณทำได้ '+Score+" จาก "+Total+ " คะแนน"),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Close')),
        FlatButton(
          onPressed: () {
            print('HelloWorld!');
            Navigator.pop(context);
          },
          child: Text('Print HelloWorld!'),
        )
      ],
    );
  }



  _dismissDialog() {
    //   Navigator.pop(context);
  }
}


class NextLevel extends StatelessWidget {
  // a property on this class

  // a constructor for this class


  Widget build(context) {

    return SimpleDialog(
      title: const Text('ลองฝึกฝนขั้นที่ยากขึ้นไหม ?'),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            //Navigator.push(context, );
          },
          child: const Text('ไปกันเลย'),
        ),
        SimpleDialogOption(
          onPressed: () { //Navigator.pop(context, );
          },
          child: const Text('เอาไว้ก่อน'),
        ),
      ],
    );

  }
}



class Grid extends StatefulWidget {
  @override
  GridState createState() {
    return new GridState();
  }
}

class GridState extends State<Grid> {
  final Set<int> selectedIndexes = Set<int>();
  final Set<int> selectedIndexesAns = Set<int>();

  final key = GlobalKey();
  final Set<_Foo> _trackTaped = Set<_Foo>();

  var data;

  _detectTapedItem(PointerEvent event) {
    final RenderBox box = key.currentContext.findRenderObject();
    final result = BoxHitTestResult();
    Offset local = box.globalToLocal(event.position);
    if (box.hitTest(result, position: local)) {
      for (final hit in result.path) {
        /// temporary variable so that the [is] allows access of [index]
        final target = hit.target;
        if (target is _Foo && !_trackTaped.contains(target)) {
          _trackTaped.add(target);
          _selectIndex(target.index);
       //   print (target.index);
          tapWord.add (target.data);


        }
      }
    }
  }

  _selectIndex(int index) {
    setState(() {
      selectedIndexes.add(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _detectTapedItem,
      onPointerMove: _detectTapedItem,
      onPointerUp: _clearSelection,
      child: GridView.builder(
        key: key,
        itemCount: 36,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          childAspectRatio: 1.0,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemBuilder: (context, index) {
          return Foo(
            index: index,
            data: ques.grid[index],
            child: Container(
              color: selectedIndexes.contains(index) ? Colors.green : Colors.indigo[100],
              child: new Text(ques.grid[index],style: TextStyle(fontSize: 40),textAlign: TextAlign.center,),
            ),
          );
        },
      ),
    );
  }

  void _clearSelection(PointerUpEvent event) {
    var found = false;
   // print (tapWord);
    for (int j = 0; j < ques.answ.length;j++){
        if (equalsIgnoreAsciiCase(ques.answ[j].toString(),tapWord.toString())) {
          //print(tapWord.toString());
          found = true;
          setState(() {
            TapWord.add(tapWord.toString());
          });

          tapWord.clear();
         //   selectedIndexesAns.union(selectedIndexes);
        //  selectedIndexesAns.addAll(selectedIndexes);
        //  selectedIndexes.clear();
          final String url ="http://www.kidlovescode.com/gamethai/audio/correct.mp4";


            AudioPlayer  audio = new AudioPlayer();
            audio.play(url);
          break;
        }
    }
      if (found ==false) {
        tapWord.clear();
    _trackTaped.clear();  //Clear if  not the answer
      setState(() {
         selectedIndexes.clear();
       });
    }
  }
}

class Foo extends SingleChildRenderObjectWidget {
  final int index;
  final String data;
  Foo({Widget child, this.index, this.data, Key key}) : super(child: child, key: key);

  @override
  _Foo createRenderObject(BuildContext context) {
           _Foo()..index = index;
           _Foo()..data = data;
      return _Foo();
    //return _Foo()..index = index;
  }

  @override
  void updateRenderObject(BuildContext context, _Foo renderObject) {
    renderObject..index = index;
    renderObject..data = data;
  }
}

class _Foo extends RenderProxyBox {
  int index;

  String data;
}