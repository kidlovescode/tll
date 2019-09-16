import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tll/audio/playapplause.dart';
import 'package:tll/audio/playtonemark.dart';
/*
void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}
*/
var tonedata = new ToneData();
class ToneData {
  var tonedata = ["เห็น","บัว","ขาว","พราว","อยู่","ใน","บึง","ใหญ่"];
  var toneans = ["จัตวา","สามัญ","จัตวา","สามัญ","เอก","สามัญ","สามัญ","เอก"];
  var toneau = ["tone/gt1.m4a","tone/gt2.m4a","tone/gt3.m4a","tone/gt4.m4a","tone/gt5.m4a","tone/gt6.m4a","tone/gt7.m4a","tone/gt8.m4a" ];
}
void main(){
  runApp(new MaterialApp(
    home: new SliderGrid(),
  ));
}


class PatternLearnTone extends StatefulWidget {
  @override
  _State createState() => new _State();
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
//State is information of the application that can change over time or when some actions are taken.
class _State extends State<PatternLearnTone>{

  double _value = 0.0;
  void _setvalue(double value) => setState(() => _value = value);
  double leveltone = 0;
  _displayLevel(level){
    leveltone = level;
    if (level==0) {

      return "เสียงสามัญ";
    }
    else  if  (level==1) {

      return "เสียงเอก";
    }
    else if  (level==2) {

      return "เสียงโท";
    }
    else if  (level==3) {

      return "เสียงตรี";
    }
    else if  (level==4) {


      return "เสียงจัตวา";
    }


  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('เรียนรู้การผันวรรณยุกต์'),
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(choices[0].icon),
            onPressed: () {
              // _select(choices[0]);
              _showMaterialDialog();
            },
          ),

        ],
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
                onChanged:(_value){
                _setvalue(_value);
                //var play = new AudioTone(leveltone.toInt());
               //play.play();
                },min: 0,  max:5,
                activeColor: Colors.lightGreen,
                inactiveColor: Colors.red,

              )
            ],
          ),
        ),
      ),
    );
  }
  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('คำแนะนำ'),
            content: Text('การผันวรรณยุกต์มีทั้งหมด 5 ระดับ \n'
                '> เลื่อนหรือแตะที่เส้น เพื่อเลือกระดับเสียง \n'
                '> ถ้าเป็นระดับเสียงที่ถูกต้องจะมีเสียงอ่าน\n'
                ),
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


class SliderGrid extends StatefulWidget {
  @override
  _GridState createState() => new _GridState();
}

class _GridState extends State<SliderGrid> {
  var val1=0,val2=0,val3=0,val4=0,val5 = 0;
 var leveltone = 0;
  _displayLevel(level){

    if (level==0)
      return "เริ่ม";
    else  if  (level==1) {

      return "เสียงสามัญ";
    }
    else if  (level==2)
      return "เสียงเอก";
    else if  (level==3)
      return "เสียงโท";
    else if  (level==4)
      return "เสียงตรี";

    else if  (level==5)
      return "เสียงจัตวา";
     leveltone = level;
  }

  final generatedList = List.generate(20, (index) => 'Item $index');
  @override
  build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ผันวรรณยุกต์"),
        backgroundColor: Colors.red,
        elevation: 1.0,
      ),
      body: new Container(
        color: Colors.white,
        child: new Transform(
          alignment: FractionalOffset.center,
          // Rotate sliders by 90 degrees
          transform: new Matrix4.identity()..rotateZ(0  * 3.1415927 / 180),
          child:
               CustomScrollView(
                   slivers: <Widget>[
                          SliverPadding(
                               padding: EdgeInsets.all(16.0),
                               sliver: SliverList(
                                 delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                                   // To convert this infinite list to a list with three items,
                                   // uncomment the following line:
                                   // if (index > 3) return null;
                                   //return Container(color: Colors.green, height: 150.0);
                                   return new DrawSlider(index);
                                 },
                                   // Or, uncomment the following line:
                                    childCount: tonedata.tonedata.length,

                                 ),
                               ))
                 ]



    ),
  //  )
          )

    )
    );
}


}


class DrawSlider extends StatefulWidget
{
  var colorb;

  var answ;
  var chtext;
  var howManyAns;
  var Index;
  DrawSlider(index){
        Index = index;
  }
  @override
  DrawSliderState createState() =>  new DrawSliderState(Index);

}

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


class DrawSliderState extends State<DrawSlider> {
  Color colorb;
  String chtext,answer;
  Color colorslider = Colors.blueAccent;
  Color colorcard = Colors.white;

  Color colorright = Colors.green[100];

  Color colorwrong = Colors.red[100];


  bool choosen;
  int timechoose;
  int howMany ;
  var Index;
  DrawSliderState(index){
      Index = index;
  }

  var val1=0,val2=0,val3=0,val4=0,val5 = 0;
  var leveltone = 0;
  String tonemark = "";
  String strtone;
  _displayLevel(level){

    if (level==0) {
      strtone = "เริ่ม";
      return "เริ่ม";
    }
    else  if  (level==1) {
      strtone = "สามัญ";
      return "สามัญ";
    }
    else if  (level==2) {
      strtone = "เอก";
      return "เอก";
    }
    else if  (level==3) {
      strtone = "โท";
      return "โท";
    }
    else if  (level==4) {
      strtone = "ตรี";

      return "ตรี";
    }

    else if  (level==5) {
      strtone = "จัตวา";

      return "จัตวา";
    }
    leveltone = level;
  }
  _doColor(){
    if  (tonedata.toneans[Index] == _displayLevel(val1.round()).toString()){

      new AudioApplause();
      setState(() {
        colorcard= colorright;
      });
      tonemark = strtone ;

    }else {
      setState(() {
        colorcard= colorwrong;
        tonemark = "";
      });

    }

  }

  @override
  Widget build(BuildContext context) {
    return  new
   Card(
     color: colorcard,
     child:
     Padding(
       padding: EdgeInsets.all(15.0),

     child:

     Row(

     children:[
       new Text(tonemark, style: TextStyle( fontSize: 20),),

    Slider(
      value: val1.toDouble(),
      min: 0.0,
      max: 5.0,
      divisions: 5,
      activeColor: colorslider,
      label: _displayLevel(val1.round()),

      onChanged: (double newValue) {


        setState(() {
          val1 = newValue.round();
        });
      },
      onChangeEnd: (double newValue)
      {

         _doColor();

      },

    ),new Text(tonedata.tonedata[Index],style: TextStyle( fontSize: 20, color: colorslider),),


       new AudioToneMark("http://www.kidlovescode.com/gamethai/audio/tone/"+tonedata.toneau[Index]),


     ])));

  }
}

/*
  children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.green,
           //   backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
              child: new Text(tonedata.tonedata[index.toInt()]),
            ),
            SizedBox(width: 15.0),

 */