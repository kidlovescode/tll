
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tll/audio/playsimpleaudio.dart';

void main() => runApp(SortWord());


class SortWord extends StatefulWidget {
  SortWord({Key key}) : super(key: key);
  createState() => SortWordState();
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
  var drag = [["ร","พ","ะ","า", "ม","ล","า"]];
  var drop = [["พ","ร","ะ","ม","า","ล","า"]]; //answer
  var hint = [["หมวก"]];
  var audio = [["http://www.kidlovescode.com/gamethai/audio/game/createw1.m4a"]];
  //var img = [["pic/menu/vw27.png","pic/menu/vw26.png","pic/menu/vw2.png","pic/menu/vw16.png","pic/menu/vw24.png"]];
}
class SortWordState extends State<SortWord> {
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




                      Wrap(
                        children: <Widget>[
                          new Container(

                             width: 60, height: 100,

                              child: new Card(
                                color: Colors.indigo[50],
                              child: new DragTarget<String>(

                                builder: (BuildContext context, List<String> incoming,
                                    List rejected) {

                                  if (successfulDrop1  == StateDrag.right ) {
                                     crr++;
                                     if (crr== dragobj.drop[questionNumber].length)   new AudioApp(dragobj.hint[questionNumber][0]);

                                    return Container (
                                        height: 100,
                                        child:Column(
                                            children: [
                                              new Card(
                                                color: Colors.indigo[50],
                                                child: new Text(dragobj.drop[questionNumber][0], style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),

                                              ),
                                              Image.network('http://www.kidlovescode.com/gamethai/pic/menu/right.png', width: 40, height: 40,),
                                            //  new AudioApplause(),

                                            ])
                                    );
                                  }else if (successfulDrop1 == StateDrag.wrong ){
                                    return Container (
                                      child: Image.network('http://www.kidlovescode.com/gamethai/pic/menu/wrong.png', width: 10, height: 10,),
                                    );
                                  }
                                },

                                onWillAccept: (data) => data == dragobj.drop[questionNumber][0],



                                onAccept: (data) {
                                  setState(() {
                                    successfulDrop1 = StateDrag.right;



                                  });
                                },

                                onLeave: (data) {


                                },
                              )
                          )
                         ),
                          new Padding(
                            padding: EdgeInsets.all(8.0),
                            //  child: const Card(child: Text('Hello World!')),

                          ),

                          new Container(

                              width: 60, height: 100,

                              child:new Card(
                                  color: Colors.indigo[50],
                                  child:
                                  new DragTarget<String>(

                                builder: (BuildContext context, List<String> incoming,
                                    List rejected) {

                                  if (successfulDrop2 == StateDrag.right ) {
                                    crr++;
                                    if (crr== dragobj.drop[questionNumber].length)   new AudioApp(dragobj.hint[questionNumber][0]);
                                    return Container (
                                        child: Column(
                                            children: [

                                        new Card(
                                        color: Colors.indigo[50],
                                          child: new Text(dragobj.drop[questionNumber][1], style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),

                                        ),
                                              Image.network('http://www.kidlovescode.com/gamethai/pic/menu/right.png', width: 40, height: 40,),

                                            ])
                                    );
                                  }else if (successfulDrop2 == StateDrag.wrong ){
                                    return Container (
                                      child: Image.network('http://www.kidlovescode.com/gamethai/pic/menu/wrong.png', width: 30, height: 30,),
                                    );
                                  }                    },

                                onWillAccept: (data) => data == dragobj.drop[questionNumber][1] ,

                                onAccept: (data) {
                                  setState(() {
                                    successfulDrop2 = StateDrag.right;
                                  });
                                },

                                onLeave: (data) {

                                },
                              )
                          )),
                          new Padding(
                            padding: EdgeInsets.all(8.0),
                            //  child: const Card(child: Text('Hello World!')),

                          ),
                          new Container(

                              width: 60, height: 100,

                              child:new Card(
                                  color: Colors.indigo[50],
                                  child:
                                  new DragTarget<String>(

                                builder: (BuildContext context, List<String> incoming,
                                    List rejected) {

                                  if (successfulDrop3 == StateDrag.right) {
                                    crr++;
                                    if (crr== dragobj.drop[questionNumber].length)   new AudioApp(dragobj.hint[questionNumber][0]);
                                    return Container (
                                        child: Column(
                                            children: [
                                              new Card(
                                                color: Colors.indigo[50],
                                                child: new Text(dragobj.drop[questionNumber][2], style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),

                                              ),
                                              Image.network('http://www.kidlovescode.com/gamethai/pic/menu/right.png', width: 40, height: 40,),

                                            ])
                                    );
                                  }else if (successfulDrop3 == StateDrag.wrong ){
                                    return Container (
                                      child: Image.network('http://www.kidlovescode.com/gamethai/pic/menu/wrong.png', width: 30, height: 30,),
                                    );
                                  }
                                },

                                onWillAccept: (data) => data == dragobj.drop[questionNumber][2] ,

                                onAccept: (data) {
                                  setState(() {
                                    successfulDrop3 = StateDrag.right;
                                  });
                                },

                                onLeave: (data) {

                                },
                              )
                          )),
                          new Padding(
                            padding: EdgeInsets.all(8.0),
                            //  child: const Card(child: Text('Hello World!')),

                          ),
                          new Container(

                              width: 60, height: 100,

                              child: new Card(
                                  color: Colors.indigo[50],
                                  child:
                                  new DragTarget<String>(

                                builder: (BuildContext context, List<String> incoming,
                                    List rejected) {

                                  if (successfulDrop4 == StateDrag.right) {
                                    crr++;
                                    if (crr== dragobj.drop[questionNumber].length)   new AudioApp(dragobj.hint[questionNumber][0]);
                                    return Container (
                                        child: Column(
                                            children: [
                                              new Card(
                                                color: Colors.indigo[50],
                                                child: new Text(dragobj.drop[questionNumber][3], style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),

                                              ),
                                              Image.network('http://www.kidlovescode.com/gamethai/pic/menu/right.png', width: 40, height: 40,),

                                            ])
                                    );
                                  }else if (successfulDrop4 == StateDrag.wrong ){
                                    return Container (
                                      child: Image.network('http://www.kidlovescode.com/gamethai/pic/menu/wrong.png', width: 30, height: 30,),
                                    );
                                  }
                                },

                                onWillAccept: (data) => data == dragobj.drop[questionNumber][3] ,

                                onAccept: (data) {
                                  setState(() {
                                    successfulDrop4 = StateDrag.right;
                                  });
                                },

                                onLeave: (data) {

                                },
                              )
                          )),
                          new Padding(
                            padding: EdgeInsets.all(8.0),
                            //  child: const Card(child: Text('Hello World!')),

                          ),
                          new Container(

                              width: 60, height: 100,

                              child: new Card(
                                  color: Colors.indigo[50],
                                  child:
                                  new DragTarget<String>(

                                builder: (BuildContext context, List<String> incoming,
                                    List rejected) {

                                  if (successfulDrop5 == StateDrag.right) {
                                    crr++;
                                    if (crr== dragobj.drop[questionNumber].length)   new AudioApp(dragobj.hint[questionNumber][0]);
                                    return Container (
                                        child: Column(
                                            children: [
                                              new Card(
                                                color: Colors.indigo[50],
                                                child: new Text(dragobj.drop[questionNumber][4], style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),

                                              ),
                                              Image.network('http://www.kidlovescode.com/gamethai/pic/menu/right.png', width: 40, height: 40,),

                                            ])
                                    );
                                  }else if (successfulDrop5 == StateDrag.wrong ){
                                    return Container (
                                      child: Image.network('http://www.kidlovescode.com/gamethai/pic/menu/wrong.png', width: 30, height: 30,),
                                    );
                                  }
                                },

                                onWillAccept: (data) => data == dragobj.drop[questionNumber][4] ,

                                onAccept: (data) {
                                  setState(() {
                                    successfulDrop5 = StateDrag.right;
                                  });
                                },

                                onLeave: (data) {

                                },
                              )
                              )),
                          new Padding(
                            padding: EdgeInsets.all(8.0),
                            //  child: const Card(child: Text('Hello World!')),

                          ),
                          new Container(

                              width: 60, height: 100,

                              child: new Card(
                                  color: Colors.indigo[50],
                                  child: new DragTarget<String>(

                                    builder: (BuildContext context, List<String> incoming,
                                        List rejected) {

                                      if (successfulDrop6  == StateDrag.right ) {
                                        crr++;
                                        if (crr== dragobj.drop[questionNumber].length)   new AudioApp(dragobj.hint[questionNumber][0]);

                                        return Container (
                                            height: 100,
                                            child:Column(
                                                children: [
                                                  new Card(
                                                    color: Colors.indigo[50],
                                                    child: new Text(dragobj.drop[questionNumber][5], style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),

                                                  ),
                                                  Image.network('http://www.kidlovescode.com/gamethai/pic/menu/right.png', width: 40, height: 40,),
                                                  //  new AudioApplause(),

                                                ])
                                        );
                                      }else if (successfulDrop6 == StateDrag.wrong ){
                                        return Container (
                                          child: Image.network('http://www.kidlovescode.com/gamethai/pic/menu/wrong.png', width: 10, height: 10,),
                                        );
                                      }
                                    },

                                    onWillAccept: (data) => data == dragobj.drop[questionNumber][5],



                                    onAccept: (data) {
                                      setState(() {
                                        successfulDrop6 = StateDrag.right;



                                      });
                                    },

                                    onLeave: (data) {


                                    },
                                  )
                              )
                          ),
                          new Padding(
                            padding: EdgeInsets.all(8.0),
                            //  child: const Card(child: Text('Hello World!')),

                          ),
                          new Container(

                              width: 60, height: 100,

                              child: new Card(
                                  color: Colors.indigo[50],
                                  child:
                                  new DragTarget<String>(

                                    builder: (BuildContext context, List<String> incoming,
                                        List rejected) {

                                      if (successfulDrop7 == StateDrag.right) {
                                        crr++;
                                        if (crr== dragobj.drop[questionNumber].length)   new AudioApp(dragobj.hint[questionNumber][0]);
                                        return Container (
                                            child: Column(
                                                children: [
                                                  new Card(
                                                    color: Colors.indigo[50],
                                                    child: new Text(dragobj.drop[questionNumber][6], style: TextStyle(fontSize: 30), textAlign: TextAlign.center,),

                                                  ),
                                                  Image.network('http://www.kidlovescode.com/gamethai/pic/menu/right.png', width: 40, height: 40,),

                                                ])
                                        );
                                      }else if (successfulDrop7 == StateDrag.wrong ){
                                        return Container (
                                          child: Image.network('http://www.kidlovescode.com/gamethai/pic/menu/wrong.png', width: 30, height: 30,),
                                        );
                                      }
                                    },

                                    onWillAccept: (data) => data == dragobj.drop[questionNumber][6] ,

                                    onAccept: (data) {
                                      setState(() {
                                        successfulDrop7 = StateDrag.right;
                                      });
                                    },

                                    onLeave: (data) {

                                    },
                                  )
                              )),
                        ], // droppable widgets here

                      ),
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
                      Draggable(
                        data: dragobj.drag[questionNumber][2],
                        // optional data to send to the drag target in next step,
                        feedback: choiceDraggableFeed(
                            dragobj.drag[questionNumber][2]),
                        child: choiceDraggable(dragobj.drag[questionNumber][2]),
                        childWhenDragging: choiceDraggable(
                            dragobj.drag[questionNumber][2]),
                      )            ,
                      new Padding(
                        padding: EdgeInsets.all(8.0),
                        //  child: const Card(child: Text('Hello World!')),

                      ),
                      Draggable(
                        data: dragobj.drag[questionNumber][3],
                        // optional data to send to the drag target in next step,
                        feedback: choiceDraggableFeed(
                            dragobj.drag[questionNumber][3]),
                        child: choiceDraggable(dragobj.drag[questionNumber][3]),
                        childWhenDragging: choiceDraggable(
                            dragobj.drag[questionNumber][3]),
                      ),
                      new Padding(
                        padding: EdgeInsets.all(8.0),
                        //  child: const Card(child: Text('Hello World!')),

                      ),
                      Draggable(
                        data: dragobj.drag[questionNumber][4],
                        // optional data to send to the drag target in next step,
                        feedback: choiceDraggableFeed(
                            dragobj.drag[questionNumber][4]),
                        child: choiceDraggable(dragobj.drag[questionNumber][4]),
                        childWhenDragging: choiceDraggable(
                            dragobj.drag[questionNumber][4]),
                      ),
                      Draggable(
                        data: dragobj.drag[questionNumber][5],
                        // optional data to send to the drag target in next step,
                        feedback: choiceDraggableFeed(
                            dragobj.drag[questionNumber][5]),
                        child: choiceDraggable(dragobj.drag[questionNumber][5]),
                        childWhenDragging: choiceDraggable(
                            dragobj.drag[questionNumber][5]),
                      ),
                      Draggable(
                        data: dragobj.drag[questionNumber][6],
                        // optional data to send to the drag target in next step,
                        feedback: choiceDraggableFeed(
                            dragobj.drag[questionNumber][6]),
                        child: choiceDraggable(dragobj.drag[questionNumber][6]),
                        childWhenDragging: choiceDraggable(
                            dragobj.drag[questionNumber][6]),
                      )
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

          color: Colors.white,
         // padding: EdgeInsets.all(5.0),
          width: 60, height:60,
          child : Card (

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
          width: 60, height:60,
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


 class DragTargetWord extends StatefulWidget {
   DragTargetWord({Key key}) : super(key: key);

   createState() => DragTargetWorldState();

 }
class DragTargetWorldState extends  State<SortWord> {
  var successfulDrop1;
   @override
   Widget build(BuildContext context) {
     // Material is a conceptual piece of paper on which the UI appears.
     return Material(
         child: Container(

   width: 60, height: 60,

   child: Card(
       child:
   new DragTarget<String>(

   builder: (BuildContext context, List<String> incoming,
   List rejected) {

   if (successfulDrop1  == StateDrag.right ) {

   return Container (
   child:Row(
   children: [
   Image.network('http://www.kidlovescode.com/gamethai/pic/menu/right.png', width: 40, height: 40,),

   ])
   );
   }else if (successfulDrop1 == StateDrag.wrong ){
   return Container (
   child: Image.network('http://www.kidlovescode.com/gamethai/pic/menu/wrong.png', width: 10, height: 10,),
   );
   }
   },

   onWillAccept: (data) => data == dragobj.drop[questionNumber][0],



   onAccept: (data) {
   setState(() {
   successfulDrop1 = StateDrag.right;



   });
   },

   onLeave: (data) {


   },
   )
   )));
   }
}