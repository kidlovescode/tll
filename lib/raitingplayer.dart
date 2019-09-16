import 'package:tll/Listview/listmodel.dart';
import 'package:flutter/material.dart';


import 'package:tll/Listview/listplayerinfo.dart';

import 'package:tll/Animation/animate.dart';
//Audid
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
/// Communicates the current state of the audio player.

//End audio
void main() => runApp(new ListPlayerPage());

class ListPlayer extends StatefulWidget {
  ListPlayer({Key key, this.Player}) :super(key: key);

  List<GPlayer> Player;

  @override
  _PlayerListState  createState() {
    return new _PlayerListState();
  }
}

class PlayerItemList extends StatefulWidget{

  final GPlayer Player;

  PlayerItemList(GPlayer Player)
      : Player= Player,
        super(key: new ObjectKey(Player));

  @override
  PlayerItemState createState() {
    return new PlayerItemState(Player);
  }
}
class PlayerItemState extends State<PlayerItemList> {

  final GPlayer Player;


  PlayerItemState(this.Player);
  //Method enable when click tile LIST


  @override
  Widget build(BuildContext context) {
    Color cellColor = Colors.black;
    Text cellText = new Text('white');


    _changeCell() {
      setState(() {
        var cellColor = Colors.lightBlue;
        print("Container clicked " + cellColor.toString());
      });

    }
    return new ListTile(
        onTap:null,
        //onTap: () => runApp(Spinner()),
        //onke => runApp(Spinner());
        leading: new CircleAvatar(
          backgroundColor: Colors.blue,
          child: new Image(image: new AssetImage(Player.avatarImage)),
        ),
        title: new Row(
          children: <Widget>[
            new Expanded(child: new Text(Player.name)),

            //   new Checkbox(value: Category.isCheck, onChanged: (bool value) {
            //     setState(() {
            //       Category.isCheck = value;
            //     });
            //  })
          ],
        )
    );
  }
}




class _PlayerListState extends State<ListPlayer> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("บอร์ดคะแนน"),
        ),
        body: new Container(
          padding: new EdgeInsets.all(8.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new Expanded(child: new ListView(
                padding: new EdgeInsets.symmetric(vertical: 15.0),
                children: widget.Player.map((GPlayer Player) {
                  return new PlayerItemList(Player);
                }).toList(),
              )),
              new RaisedButton(onPressed: () {

                for (GPlayer p in widget.Player) {
                  //if (p.isCheck)
                    new Text(''+p.score.toString());
                }
              },
                child: new Text('กลับเมนู'),
              )
            ],
          ),
        )
    );
  }
}


class ListPlayerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return (new MaterialApp(
      title: 'บอร์ดคะแนน',
      home: new ListPlayer(Player:
      [
        new GPlayer('ดช.โตมร ยอดขยัน', 'images/player1.png', 199),
        new GPlayer('ดญ.อันดามัน สวยดี', 'images/player2.png', 111),
        new GPlayer('ดช.ปราชญ์ ฉลาดมาก', 'images/player3.png', 100),
        new GPlayer('ดญ.แน่งน้อย เสงี่ยม', 'images/player4.png', 40),


      ],),
    )
    );

  }
}