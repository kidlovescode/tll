import 'package:flutter/material.dart';
import 'matchcard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'เลือกสระเสียงสั้น',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'เลือกสระเสียงสั้น'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> cardList;

  void _removeCard(index) {
    setState(() {
      cardList.removeAt(index);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardList = _getMatchCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child:

        Stack(
       //   alignment: Alignment.center,
          children: [

                Stack(
                  children:cardList,
                ),
          new Positioned(
            left:20,
            bottom:0,
            child:
            new
            Row(
             children: <Widget>[
               Image.network("http://www.kidlovescode.com/gamethai/pic/choiceyes.jpg", width: 150, height:150,),
               Padding(
                 padding: EdgeInsets.all(30.0),
                 child: Text('   '),
               ),
               Image.network("http://www.kidlovescode.com/gamethai/pic/choiceno.jpg",width: 150, height:150),

             ]
            )
          ),
             ]
            // Max Size


          ),
      ),
    );
  }

  myCard(){
    MatchCard(255, 0, 0, 10);
  }
  List<Widget> _getMatchCard() {
    List<MatchCard> cards = new List();
    cards.add(MatchCard(255, 0, 0, 10));
    cards.add(MatchCard(0, 255, 0, 20));
    cards.add(MatchCard(0, 0, 255, 30));
    cards.add(MatchCard(255, 0, 0, 40));
    cards.add(MatchCard(0, 255, 0, 50));
    cards.add(MatchCard(0, 0, 255, 60));
    cards.add(MatchCard(255, 0, 0, 10));
    cards.add(MatchCard(0, 255, 0, 20));
    cards.add(MatchCard(0, 0, 255, 30));
    cards.add(MatchCard(255, 0, 0, 10));


    List<Widget> cardList = new List();

    for (int x = 0; x < 10; x++) {
      cardList.add(Positioned(
        top: cards[x].margin,
        child: Draggable(
          onDragEnd: (drag){
            _removeCard(x);
          },
          childWhenDragging: Container(),
          feedback: Card(
            elevation: 12,
            color: Color.fromARGB(255, cards[x].redColor, cards[x].greenColor, cards[x].blueColor),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: 240,
              height: 300,
            ),
          ),
          child: Card(
            elevation: 12,
            color: Color.fromARGB(255, cards[x].redColor, cards[x].greenColor, cards[x].blueColor),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: 240,
              height: 300,
            ),
          ),
        ),
      ));
    }

    return cardList;
  }
}