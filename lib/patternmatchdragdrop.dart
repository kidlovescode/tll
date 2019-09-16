
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';
//import 'package:createword/audio/playcool.dart';

void main() => runApp(DragScreen());


class DragScreen extends StatefulWidget {
  DragScreen({Key key}) : super(key: key);
  createState() => DragScreenState();
}
var questionNumber = 0;
var turn = true;
enum StateDrag {
  none,
  right,
  wrong,

}
var dragobj = new DataDragAndDrop();
class DataDragAndDrop{
  var drag = [["ไก่","ลำใย","ม้า","อ้อย", "หัว"]];
  var drop = [["ไก่","ลำใย","ม้า","อ้อย","หัว"]]; //answer
  var img = [["pic/menu/vw27.png","pic/menu/vw26.png","pic/menu/vw2.png","pic/menu/vw16.png","pic/menu/vw24.png"]];
}
class DragScreenState extends State<DragScreen> {
  var successfulDrop2 = StateDrag.none, successfulDrop3= StateDrag.none, successfulDrop4= StateDrag.none, successfulDrop5= StateDrag.none;
  var successfulDrop1= StateDrag.none ;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
          appBar: AppBar(
            title: Text('จับคู่เรียนรู้สระ'),

          ),
      body:
          Column(
          children: [
            Row(

              children: [
                   Image.network("http://www.kidlovescode.com/gamethai/pic/menu/ddins.png", width : 70, height:70),
                  Text ("ลากเพื่อจับคู่", style: TextStyle(fontSize: 20),)
              ]

          ),

      Row(
        children: [
          new Padding(
            padding: EdgeInsets.all(5.0),
            //  child: const Card(child: Text('Hello World!')),

          ),
          new DropTargetCreate(),

          new Padding(
            padding: EdgeInsets.all(30.0),
            //  child: const Card(child: Text('Hello World!')),

          ),
          new DragCreate(),

        ],
      ),

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
      padding: EdgeInsets.all(8.0),
       width: 180, height:80,
       child : Text(textch, style: TextStyle(fontSize: 30),),
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
          color: Colors.blue[300],
          width: 200, height:80,
          child:
          Column(
            children: <Widget>[

              new Text(textch, style: TextStyle(fontSize: 30),),

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
      children.add(Draggable(
        data: dragobj.drag[questionNumber][i],
        // optional data to send to the drag target in next step,
        feedback: choiceDraggableFeed(
            dragobj.drag[questionNumber][i]),
        child: choiceDraggable(dragobj.drag[questionNumber][i]),
        childWhenDragging: choiceDraggable(
            dragobj.drag[questionNumber][i]),
      ));
      children.add(new Padding(
        padding: EdgeInsets.all(8.0),
        //  child: const Card(child: Text('Hello World!')),

      ),);
    }
    return Column(
      children: children,
    );
  }
}
class DropTargetCreate extends StatefulWidget {
  @override
  DropTargetCreateState createState() =>  new DropTargetCreateState();
}
class DropTargetCreateState extends State<DropTargetCreate>{

  var successfuldrop = [StateDrag.none,StateDrag.none,StateDrag.none,StateDrag.none,StateDrag.none,StateDrag.none,StateDrag.none,StateDrag.none,StateDrag.none,StateDrag.none,];

  Widget build(BuildContext context) {
    final children = <Widget>[
    ];
    for (int i = 0; i < dragobj.drop[questionNumber].length; i++) {
      children.add(
        new Container(

            width: 150, height: 100,
            decoration:
            BoxDecoration(
              color: Colors.white,
              image: new DecorationImage(
                image: NetworkImage("http://www.kidlovescode.com/gamethai/" +
                    dragobj.img[questionNumber][i]),
              ),
              border: Border.all(
                color: Colors.black,
                width: 3.0,
              ),
            ),
            child:
            new DragTarget<String>(

              builder: (BuildContext context, List<String> incoming,
                  List rejected) {

                if (successfuldrop[i] == StateDrag.right) {
                  final String url ="http://www.kidlovescode.com/gamethai/audio/correct.mp4";
                   AudioPlayer audio = new AudioPlayer();
                      audio.play(url);
                  return Container(
                      child: Row(
                          children: [
                            Image.network(
                              ("http://www.kidlovescode.com/gamethai/" +
                                  dragobj.img[questionNumber][i]), width: 100,
                              height: 100,),
                            Image.network(
                              'http://www.kidlovescode.com/gamethai/pic/menu/right.png',
                              width: 40, height: 40,),

                          ])
                  );
                } else if (successfuldrop[i] == StateDrag.wrong) {
                  return Container(
                    child: Image.network(
                      'http://www.kidlovescode.com/gamethai/pic/menu/wrong.png',
                      width: 10, height: 10,),
                  );
                }
              },

              onWillAccept: (data) => data == dragobj.drop[questionNumber][i],

              onAccept: (data) {
                setState(() {
                  successfuldrop[i] = StateDrag.right;
                });
              },

              onLeave: (data) {


              },
            ),
        ),


      );
      children.add(new Padding(
        padding: EdgeInsets.all(8.0),
        //  child: const Card(child: Text('Hello World!')),

      ),);
    }
    return Column(
      children: children,
    );
  }


}