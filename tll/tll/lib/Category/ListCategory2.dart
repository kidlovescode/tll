import 'package:flutter/material.dart';
import 'package:tll/Category/WCategory.dart';
import 'package:tll/Animation/animate.dart';
import 'package:tll/alphabet.dart';

//Audid
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
/// Communicates the current state of the audio player.

//End audio
void main() => runApp(new ListCategory2());
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

runGame(){
//  void startQuiz1(){
    setState(() {
      Navigator.push(context, new MaterialPageRoute(builder: (context)=> new Alphabet()));
    });
  //}

}
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
      //  onTap:null,
        //onTap: () => runApp(Alphabet()),

        //onke => runApp(Spinner());
        onTap:()=> runGame,
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
          title: new Text("หมวดการอ่านออกเสียง "),
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
              new RaisedButton(onPressed: () {
                for (WCategory p in widget.Category) {
                  if (p.isCheck)
                    print(p.name);
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
class ListCategory2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return (new MaterialApp(
      title: 'หมวดการอ่านออกเสียง ',
      home: new ShoppingList(Category:
      [
        new WCategory('อักษรไทย', 'images/reading-icon.png', false),
        new WCategory('สระ', 'images/reading-icon.png', false),
        new WCategory('ตัวสะกด', 'images/reading-icon.png', false),
        new WCategory('พยางค์และสระผสม', 'images/reading-icon.png', false),
        new WCategory('อักษรนำ', 'images/reading-icon.png', false),
        new WCategory('การสะกดคำ', 'images/reading-icon.png', false),
        new WCategory('คำที่มี รร ', 'images/reading-icon.png', false),
        new WCategory('การอ่านไม่ออกเสียง', 'images/reading-icon.png', false),

],),
));
}
}