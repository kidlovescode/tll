
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:audioplayer/audioplayer.dart';
void main() => runApp(FillTheBlank());


class FillTheBlank extends StatefulWidget {
  FillTheBlank({Key key}) : super(key: key);
  createState() => FillTheBlankState();
}
var questionNumber = 0;
var crr=0;
var turn = true;
enum StateDrag {
  none,
  right,
  wrong,

}
var dragobj = new DataDragAndDrop();
class DataDragAndDrop{
  var drag = [["ฉัน","กิน"]];
  var drop = [["พระต้อง","_","เพลให้เสร็จก่อน ญาติโยมจึงจะ","_","ข้าวได้"]]; //answer
  var ans = [["","ฉัน","","กิน",""]];
  var hint = [["แยกแยะคำ"]];
  var audio = [["http://www.kidlovescode.com/gamethai/audio/game/createw1.m4a"]];
//var img = [["pic/menu/vw27.png","pic/menu/vw26.png","pic/menu/vw2.png","pic/menu/vw16.png","pic/menu/vw24.png"]];
}
class FillTheBlankState extends State<FillTheBlank> {
  var successfulDrop2 = StateDrag.none, successfulDrop3= StateDrag.none, successfulDrop4= StateDrag.none, successfulDrop5= StateDrag.none,
      successfulDrop6= StateDrag.none,successfulDrop7= StateDrag.none;
  var successfulDrop1= StateDrag.none ;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            appBar: AppBar(
              title: Text('สร้างคำ'),

            ),
            body:
            Column(
                children: [
                  Column(

                      children: [
                        Row(
                            children: [
                              Image.network("http://www.kidlovescode.com/gamethai/pic/menu/ddins.png", width : 70, height:70),
                              Text ("ลากเพื่อสร้างคำ", style: TextStyle(fontSize: 20),)
                            ]

                        ),
                        new Text("คำใบ้: "+dragobj.hint[questionNumber][0], style: TextStyle(fontSize: 30),)
                      ]

                  ),


            new DropTargetCreate(),

                  new Padding(
                    padding: EdgeInsets.all(30.0),
                    //  child: const Card(child: Text('Hello World!')),

                  ),


                  Wrap(
                    children: <Widget>[
                      Draggable(
                        data: dragobj.drag[questionNumber][0],
                        // optional data to send to the drag target in next step,
                        child: choiceDraggable(
                            dragobj.drag[questionNumber][0]), // widget
                        feedback: choiceDraggableFeed(dragobj.drag[questionNumber][0]),
                        childWhenDragging: choiceDraggable(
                            dragobj.drag[questionNumber][0]),
                      ),
                      new Padding(
                        padding: EdgeInsets.all(8.0),
                        //  child: const Card(child: Text('Hello World!')),

                      ),
                      Draggable(
                        data: dragobj.drag[questionNumber][1],
                        // optional data to send to the drag target in next step,
                        feedback: choiceDraggableFeed(
                            dragobj.drag[questionNumber][1]),
                        child: choiceDraggable(dragobj.drag[questionNumber][1]),
                        childWhenDragging: choiceDraggable(
                            dragobj.drag[questionNumber][1]),
                      ),
                      new Padding(
                        padding: EdgeInsets.all(8.0),
                        //  child: const Card(child: Text('Hello World!')),

                      ),

                    ], // draggable widgets here
                  )
                ])
        )
    );
  }
}

class choiceDraggable extends StatelessWidget{
  var textch;
  var screenwidth = MainAxisSize.max ;


  choiceDraggable(ch){
    textch = ch;

  }
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
        child: Container(

            color: Colors.blue[100],
            // padding: EdgeInsets.all(5.0),
            width: 100, height:60,
            child : Card (
              color: Colors.blue[100],
              child: Text(textch, style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),
            )
          /* Column(
    children: <Widget>[
        new RaisedButton(onPressed: null,




        ),

    ],
    ), */
        ));
  }

}


class choiceDraggableFeed extends StatelessWidget{
  var textch;
  var screenwidth = MainAxisSize.max ;


  choiceDraggableFeed(ch){
    textch = ch;

  }
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
        child: Container(
          color: Colors.deepOrangeAccent[100],
          width: 100, height:60,
          child:
          Column(
            children: <Widget>[
              new Card(
                child: new Text(textch, style: TextStyle(fontSize: 30),),
              )
            ],
          ),
        ));
  }

}


class DragCreate extends StatefulWidget {
  @override
  DragCreateState createState() =>  new DragCreateState();
}
class DragCreateState extends State<DragCreate> {
  Widget build(BuildContext context) {
    final children = <Widget>[
    ];
    for (int i = 0; i < dragobj.drag[questionNumber].length; i++) {
      Draggable(
        data: dragobj.drag[questionNumber][i],
        // optional data to send to the drag target in next step,
        feedback: choiceDraggableFeed(
            dragobj.drag[questionNumber][i]),
        child: choiceDraggable(dragobj.drag[questionNumber][i]),
        childWhenDragging: choiceDraggable(
            dragobj.drag[questionNumber][i]),
      );
      children.add(new Padding(
        padding: EdgeInsets.all(8.0),
        //  child: const Card(child: Text('Hello World!')),

      ),);
    }
    return Wrap(
      children: children,
    );
  }
}


class DropTargetCreate extends StatefulWidget {
  @override
  DropTargetCreateState createState() =>  new DropTargetCreateState();
}
class DropTargetCreateState extends State<DropTargetCreate> {

  var successfuldrop = [
    StateDrag.none,
    StateDrag.none,
    StateDrag.none,
    StateDrag.none,
    StateDrag.none,
    StateDrag.none,
    StateDrag.none,
    StateDrag.none,
    StateDrag.none,
    StateDrag.none,
  ];

  Widget build(BuildContext context) {
    final children = <Widget>[
    ];
    for (int i = 0; i < dragobj.drop[questionNumber].length; i++) {
      children.add(
        new Container(



            child:new Card(

                child:
                new DragTarget<String>(

                  builder: (BuildContext context, List<String> incoming,
                      List rejected) {

                    if (successfuldrop[i] == StateDrag.right ) {
                      final String url ="http://www.kidlovescode.com/gamethai/audio/correct.mp4";
                      AudioPlayer audio = new AudioPlayer();
                      audio.play(url);
                      crr++;
                      if (crr== dragobj.drop[questionNumber].length)  {
                        AudioPlayer audio = new AudioPlayer();
                        audio.play(dragobj.hint[questionNumber][0]);
                      }
                      return Container (
                          height: dragobj.drop[questionNumber][i] != "_" ? 60:100,
                          child: Column(
                              children: [

                                new Card(
                                  color:    dragobj.drop[questionNumber][i] != "_" ? Colors.white:Colors.indigo[50],
                                  child: new Text(dragobj.ans[questionNumber][i], style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),

                                ),
                                Image.network('http://www.kidlovescode.com/gamethai/pic/menu/right.png', width: 40, height: 40,),

                              ])
                      );
                    }else if (dragobj.drop[questionNumber][i] != "_"  ){
                      return Container (
                          child: new Text(dragobj.drop[questionNumber][i], style: TextStyle(fontSize: 30),)
                        //Image.network('http://www.kidlovescode.com/gamethai/pic/menu/wrong.png', width: 30, height: 30,),
                      );
                    }else if (dragobj.drop[questionNumber][i] == "_"  ){
                      return Container (
                        color: Colors.indigo[50],
                        width:100, height: 100,
                        //Image.network('http://www.kidlovescode.com/gamethai/pic/menu/wrong.png', width: 30, height: 30,),
                      );
                    }

                  },

                  onWillAccept: (data) => data == dragobj.ans[questionNumber][i] ,

                  onAccept: (data) {
                    setState(() {
                      successfuldrop[i] = StateDrag.right;
                    });
                  },

                  onLeave: (data) {

                  },
                )
            )),


      );
      children.add(new Padding(
        padding: EdgeInsets.all(8.0),
        //  child: const Card(child: Text('Hello World!')),

      ),);
    }
    return Wrap(
      children: children,
    );
  }
}