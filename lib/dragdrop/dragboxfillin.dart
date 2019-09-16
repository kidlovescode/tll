import 'package:flutter/material.dart';
import 'package:tll/dragdrop/fillin.dart';
import 'package:tll/dragdrop/draggable_textfillin.dart';
import 'package:tll/dragdrop/drop_targetfillin.dart';




class GameView extends StatefulWidget {

  List<Matching> items;



  GameView(this.items);



  @override

  _GameViewState createState() => new _GameViewState();

}



class _GameViewState extends State<GameView> {

  final _gap = 2.0;

  final _margin = 5.0;



  Map<int, Matching> pairs = {};



  bool validated = false;



  int score = 0;



  Size getDragableSize({Size areaSize, int numItems}) {

    final landScape = areaSize.width > areaSize.height;

    final targetWidth =

        (areaSize.width - (2 * _margin) - (_gap * (numItems - 1))) / numItems;

    return new Size(targetWidth, areaSize.height * (landScape ? 0.25 : 0.2));

  }



  Size getTargetSize({Size areaSize, int numItems}) {

    final landScape = areaSize.width > areaSize.height;

    final targetWidth =

        (areaSize.width - (2 * _margin) - (_gap * (numItems - 1))) / numItems;

    return new Size(targetWidth, areaSize.height * (landScape ? 0.45 : 0.3));

  }



  Widget _buildButton(IconData icon, VoidCallback onPress) => new Padding(

      padding: new EdgeInsets.all(10.0),

      child: new FloatingActionButton(

          backgroundColor: Colors.green,

          child: new Icon(icon),

          onPressed: onPress));



  @override

  Widget build(BuildContext context) {

    final mq = MediaQuery.of(context);



    final size = mq.size;

    final numItems = widget.items.length;

    final draggableSize = getDragableSize(areaSize: size, numItems: numItems);

    final targetSize = getTargetSize(areaSize: size, numItems: numItems);

    return new Column(

        mainAxisAlignment: mq.orientation == Orientation.landscape

            ? MainAxisAlignment.end

            : MainAxisAlignment.spaceEvenly,

        children: [

          _buildValidateButton(),
          _buildSentence(),
          _buildWord('1'),
          new Expanded(child:
          _buildTargetRow(targetSize, draggableSize),

          ),
          _buildDragableList(draggableSize)


        ]);

  }

  Widget _buildSentence() => new
      Center(
        child: Container(

          constraints: BoxConstraints.expand(
            height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
          ),
          padding: const EdgeInsets.all(5.0),
          color: Colors.teal.shade700,
          alignment: Alignment.center,
          child: Text('ฉัน  ไป ... ซื้อ ....', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
          foregroundDecoration: BoxDecoration(
              image: DecorationImage(
              image: NetworkImage('https://www.example.com/images/frame.png'),
              //centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
            ),
          ),
          //transform: Matrix4.rotationZ(0.1),



        ),
      );

  Widget _buildWord(word) => new
  Center(
      child: Row(
        children: <Widget>[
          new CircleAvatar(
            backgroundColor: Colors.lightGreen,
            radius: 10.0,
            child: new Text(word,
              style: new TextStyle(color: Colors.white,
                  fontSize: 12.0),),
          )
        ],

      ),
  );





      Widget _buildValidateButton() => new Row(

      mainAxisAlignment: MainAxisAlignment.end,

      mainAxisSize: MainAxisSize.max,

      children: [

        new Text('ตรวจคำตอบ'),

        _buildButton(validated ? Icons.refresh : Icons.check,

            validated ? _onClear : _onValidate)

      ]);

  Widget _buildTargetRow(Size targetSize, Size itemSize) =>

      new NotificationListener<SelectionNotification>(

          onNotification: _onSelection,

          child: new Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              mainAxisSize: MainAxisSize.max,

              children: widget.items

                  .map((item) => new DropTarget(item,

                  selectedItem: pairs[item.id],

                  size: targetSize,

                  itemSize: itemSize))

                  .toList()));

  Widget _buildDragableList(Size itemSize) => new Row(

      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      mainAxisSize: MainAxisSize.max,

      children: widget.items

          .where((item) => !item.selected)

          .map((item) => new DraggableCity(item, size: itemSize))

          .toList());







  bool _onSelection(SelectionNotification notif) {

    setState(() {

      // on de-selection

      if (notif.cancel) {

        if (notif.item != null) notif.item.selected = false;

        pairs.remove(notif.dropIndex);

      } else {

        // if target was associated with other country

        if (pairs[notif.dropIndex] != null)

          pairs[notif.dropIndex].selected = false;



        // if country was associated with other dropTarget

        if (pairs.containsValue(notif.item))

          pairs.remove(pairs.keys.firstWhere((k) => pairs[k] == notif.item));

        _onItemSelection(notif.item, notif.dropIndex);

      }

    });

    return false;

  }



  void _onItemSelection(Matching selectedItem, int targetId) {

    setState(() {

      if (selectedItem != null) {

        selectedItem.selected = true;

        selectedItem.status = Status.none;

      }



      pairs[targetId] = selectedItem;

    });

  }



  void _onValidate() {

    setState(() {

      score = 0;

      pairs.forEach((index, item) {

        if (item.id == index) {

          item.status = Status.correct;

          score++;

        } else

          item.status = Status.wrong;

      });

      validated = true;

    });

  }



  void _onClear() {

    setState(() {

      pairs.forEach((index, item) {

        item.status = Status.none;

        item.selected = false;

      });

      pairs.clear();

      validated = false;

    });

  }

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home:new FillWord()
    );
  }
}
class FillWord extends StatelessWidget{
  List cards = new List.generate(20, (i)=>new CustomWord());
  @override
  Widget build(BuildContext context) {
    return new   Container(
            child: new ListView(
              children: cards,
            )

        );
  }
}

class CustomWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  new Card(
      child: new Column(
        children: <Widget>[

          new Padding(
              padding: new EdgeInsets.all(7.0),
              child: new Row(
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.all(7.0),
                    child: new Icon(Icons.thumb_up),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(7.0),
                    child: new Text('Like',style: new TextStyle(fontSize: 18.0),),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(7.0),
                    child: new Icon(Icons.comment),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(7.0),
                    child: new Text('Comments',style: new TextStyle(fontSize: 18.0)),
                  )

                ],
              )
          )
        ],
      ),
    );
  }
}
