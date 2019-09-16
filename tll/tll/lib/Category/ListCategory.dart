import 'package:flutter/material.dart';
import 'package:tll/Category/WCategory.dart';
import 'package:tll/Animation/animate.dart';
//Audid
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
/// Communicates the current state of the audio player.

//End audio
void main() => runApp(new ListCategory1());

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.Category}) :super(key: key);

  List<WCategory> Category;

  @override
  _ShoppingListState createState() {
    return new _ShoppingListState();
  }
}
class Category {

  String name;
  String avatarImage;
  bool isCheck;

  Category(this.name, this.avatarImage, this.isCheck);
}

class ShoppingItemList extends StatefulWidget{

  final WCategory Category;

  ShoppingItemList(WCategory Category)
      : Category = Category,
        super(key: new ObjectKey(Category));

  @override
  ShoppingItemState createState() {
    return new ShoppingItemState(Category);
  }
}
class ShoppingItemState extends State<ShoppingItemList> {

  final WCategory Category;


  ShoppingItemState(this.Category);
  //Method enable when click tile LIST


  @override
  Widget build(BuildContext context) {
    Color cellColor = Colors.black;
    //Text cellText = new Text('white');


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
          child: new Image(image: new AssetImage(Category.avatarImage)),
        ),
        title: new Row(
          children: <Widget>[
            new Expanded(child: new Text(Category.name)),

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




class _ShoppingListState extends State<ShoppingList> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("หมาวดหมู่การเรียนรู้คำ 1"),
        ),
        body: new Container(
          padding: new EdgeInsets.all(8.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new Expanded(child: new ListView(
                padding: new EdgeInsets.symmetric(vertical: 8.0),
                children: widget.Category.map((WCategory Category) {
                  return new ShoppingItemList(Category);
                }).toList(),
              )),

           /*   new RaisedButton(onPressed: () {
                for (WCategory p in widget.Category) {
                  if (p.isCheck)
                    print(p.name);
                }
              },
                child: new Text('กลับเมนู'),
              )*/
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          //onPressed: startQuiz,
          backgroundColor: Colors.deepOrange,
          /*onPressed: () {

              setState(() {

              });
            },*/
          child: Icon(
            Icons.exit_to_app,
          ),

        )
    );
  }
}


class ListCategory1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return (new MaterialApp(
      title: 'หมวดการเรียนรู้คำ 1 ',
      home: new ShoppingList(Category:
      [
        new WCategory('คำนาม', 'images/reading-icon.png', false),
        new WCategory('คำสรรพนาม', 'images/reading-icon.png', false),
        new WCategory('คำกิริยา', 'images/reading-icon.png', false),
        new WCategory('คำวิเศษณ์', 'images/reading-icon.png', false),
        new WCategory('สามาณยนาม', 'images/reading-icon.png', false),
        new WCategory('วิสามานยนาม', 'images/reading-icon.png', false),
        new WCategory('ลักษณะนาม', 'images/reading-icon.png', false),
        new WCategory('อาการนาม', 'images/reading-icon.png', false),
        new WCategory('บุรุษสรรพนาม', 'images/reading-icon.png', false),
        new WCategory('วิภาคสรรพนาม', 'images/reading-icon.png', false),
        new WCategory('อนิยมสรรพนาม', 'images/reading-icon.png', false),
        new WCategory('ปฤจฉาสรรพนาม', 'images/reading-icon.png', false),

      ],),
    )
    );

  }
}