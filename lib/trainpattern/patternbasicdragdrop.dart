import 'package:flutter/material.dart';
import 'package:tll/audio/playsimpleaudio.dart';
import 'package:tll/audio/playapplause.dart';
var question =TwoChoiceData();
var questionNumber = 0;
var finalScore=0;
class TwoChoiceData {
  var questions = ["สระเสียงสั้น"];
  var  choice  = [["เข่า","ข่าว"]];
  var correctAnswers  =["เข่า"];

  var audi = [["audio/game/gv1.m4a","audio/game/gv2.m4a"], ["audio/game/gv3.m4a","audio/game/gv4.m4a"]];
  var img = [["pic/game/vg1.png","pic/game/vg2.png"]];


}

void main() => runApp(DragBox());



class DragBox extends StatefulWidget {

  @override

  _DragBoxState createState() => new _DragBoxState();



}



class _DragBoxState extends State<DragBox> {

  String selection;

  //var placebox = (MainAxisSize.max - 200)/2;

  @override

  Widget build(BuildContext context) {
  return (new MaterialApp(home: Scaffold(
          appBar: new AppBar(
            title: new Text("ทดสอบ"),
            backgroundColor: Colors.blue,
          ),


          body: new Container(
          margin: const EdgeInsets.all(15.0),
      child:

      new Stack(children: [

      getTarget(),

      new Container(
        child:

          (new DraggableText(question.choice[questionNumber][0], new Offset(40.0, 60.0), question.img[questionNumber][0],
             question.audi[questionNumber][0])),




       ),

      new Container(
          child:

                (new DraggableText(question.choice[questionNumber][1], new Offset(200.0, 60.0),  question.img[questionNumber][1],
                    question.audi[questionNumber][1]))),





    ])),
      /*
      floatingActionButton: FloatingActionButton(
      onPressed: () {
    // Add your onPressed code here!
    Navigator.pop(context);
  },
    child: Icon(Icons.thumb_up),
    backgroundColor: Colors.deepOrangeAccent,
    ),
*/
    )));

  }



  getTarget() => new Positioned(

      left: 70,

      bottom: 40.0,

      child: new DragTarget(

          builder: (BuildContext context, List<dynamic> accepted,

              List<dynamic> rejected) {

            final hovered = accepted.length > 0;

            return new Container(

                width: 300.0,

                height: 350.0,


                decoration: new BoxDecoration(

                    color:  hovered ? Colors.cyan.shade100 : Colors.grey.shade200,


                    border: new Border.all(

                        width: 1.0,

                        color: hovered ? Colors.cyan : Colors.grey)),

                child: new
                Column(children: [
                  new Text(question.questions[questionNumber], style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20)),
                    new Image.network("http://www.kidlovescode.com/gamethai/pic/game/boxgame.png", width: 300,height: 300,),
                ] ));

          },

          onWillAccept: (value) => selection == null,

          onAccept: (value) => setState(() {

            selection = value;

          })));

}



class DraggableText extends StatefulWidget {

  final Offset initialOffset;

  final String text;
  final String image;
  final String audio;

  DraggableText(this.text, this.initialOffset, this.image , this.audio);



  @override

  _DraggableTextState createState() => new _DraggableTextState();

}



class _DraggableTextState extends State<DraggableText> {

  Offset position = new Offset(0.0, 0.0);



  @override

  void initState() {

    super.initState();

    position = widget.initialOffset;

  }



  @override

  Widget build(BuildContext context) {

    final item = new LabelBox(size: new Size.square(150.0), label: widget.text, image: widget.image, audio:widget.audio );

    final avatar = new LabelBox( size: new Size.square(150.0), label: widget.text, image: widget.image,  audio:widget.audio, opacity: 0.4);

    final draggable = new Draggable(

        data: widget.text,

        feedback: avatar,

        child: item,

        childWhenDragging: new Opacity(opacity: 0.0, child: item),

        onDraggableCanceled: (velocity, offset) {
        //  new AudioApp("http://www.kidlovescode.com/gamethai/"+question.audi[questionNumber][1]);
          print('_DragBoxState.build -> offset ${offset}  item ${item}');
          //check if the dragged position is in the box
          if (offset.dx >= 90 && offset.dy >=340 ){
            //checkanswer (widget.text);
            if (widget.text == question.correctAnswers[questionNumber]){
              new AudioApplause();
             ///Sound is not play.
              new AudioApp("http://www.kidlovescode.com/gamethai/"+widget.audio);
              finalScore++;
            // dispose();
              updateQuestion();
            }

          }



        });


    return new Positioned(

        left: position.dx, top: position.dy, child: draggable);

  }

  void updateQuestion(){
    setState(() {
      //position = offset;
      if(questionNumber == question.questions.length - 1){
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Summary(score: finalScore,)));

      }else{
        questionNumber++;
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new DragBox()));
      }
    });
  }

}



//Box choice

class LabelBox extends StatefulWidget {

  Offset position = new Offset(0.0, 0.0);

  final Size size;

  final String label;

  final double opacity;
  final String image;

  final String audio;

  LabelBox({this.size, this.label, this.image, this.audio, this.opacity: 1.0});



  @override

  State<StatefulWidget> createState() => new LabelBoxState();

}



class LabelBoxState extends State<LabelBox> {

  final defaultStyle = new TextStyle(

      color: Colors.white, decoration: TextDecoration.none, fontSize: 16.0);



  @override

  Widget build(BuildContext context) => new Container(

    width: widget.size.width,

    height: widget.size.height,


    color: Colors.green.withOpacity(widget.opacity),

    child: new Center(

           child: Column(
             children: <Widget>[

               new Image.network("http://www.kidlovescode.com/gamethai/"+widget.image, width: 50, height: 50,),
               new Text(        widget.label,          style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20) ,  ),
              // new IconButton( icon: new Icon(Icons.play_circle_filled) , iconSize: 30,  onPressed:()
             //  {new AudioApp("http://www.kidlovescode.com/gamethai/"+widget.audio);}
               ]
               ),


           ),



  );

}


class Summary extends StatelessWidget{

  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(

          body:

          new Container(
            margin: const EdgeInsets.all(15.0),
            child: new Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                new MaterialButton(
                  height: 150.0,
                  color: Colors.lightBlue,
                  //  onPressed: startQuiz,
                  child:   new Text("คะแนนรวม: $score",
                    style: new TextStyle(
                        fontSize: 35.0
                    ),),

                ),
                new Padding(padding: EdgeInsets.all(30.0)),

                new MaterialButton(
                  color: Colors.green,
                  onPressed: (){
                    questionNumber = 0;
                    finalScore = 0;
                    Navigator.push(context, new MaterialPageRoute(builder: (context)=> new DragBox()));
                  },
                  /* child: new Text("เริ่มใหม่",
                    style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.white
                    ),)*/
                  )

              ],
            ),
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: (){
              questionNumber = 0;
              finalScore = 0;
              Navigator.pop(context);
            },
            backgroundColor: Colors.deepOrange,
            /*onPressed: () {

              setState(() {

              });
            },*/

            child: Icon(
              Icons.exit_to_app,
            ),

          )
        /*
        new Container(

          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Text("คะแนนรวม: $score",
                style: new TextStyle(
                    fontSize: 35.0
                ),),

              new Padding(padding: EdgeInsets.all(30.0)),

              new MaterialButton(
                color: Colors.red,
                onPressed: (){
                  questionNumber = 0;
                  finalScore = 0;
                  Navigator.pop(context);
                },
                child: new Text("เริ่มใหม่",
                  style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                  ),),)

            ],
          ),
        ),
         */

      ),
    );
  }


}