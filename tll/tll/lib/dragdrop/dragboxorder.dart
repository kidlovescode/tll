import 'package:flutter/material.dart';
import 'package:tll/dragdrop/order.dart';
import 'package:tll/dragdrop/draggable_textorder.dart';

import 'package:tll/dragdrop/drop_targetorder.dart';




class GameView extends StatefulWidget {

  List<Matching> items;



  GameView(this.items);



  @override

  _GameViewState createState() => new _GameViewState();

}



class _GameViewState extends State<GameView> {

  final _gap = 8.0;

  final _margin = 10.0;



  Map<int, Matching> pairs = {};

 // Map<int, String> pairs_ans = {};

  var ans = ['พ','ร','ะ','ม','า','ล','า'];
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
       //   new IconButton( icon: Icon(Icons.chat_bubble)),
          new Text('คำใบ้: หมวก',style: TextStyle(fontWeight: FontWeight.bold)),

          new Expanded(child: _buildDragableList(draggableSize)),

          _buildTargetRow(targetSize, draggableSize),

        ]);

  }



  Widget _buildValidateButton() => new Row(

      mainAxisAlignment: MainAxisAlignment.end,

      mainAxisSize: MainAxisSize.max,

      children: [

        //new Text('คะแนน : $score / ${widget.items.length}'),
        new Text('ตรวจคำตอบ'),

        _buildButton(validated ? Icons.refresh : Icons.check,

            validated ? _onClear : _onValidate)

      ]);



  Widget _buildDragableList(Size itemSize) => new Row(

      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      mainAxisSize: MainAxisSize.max,

      children: widget.items

          .where((item) => !item.selected)

          .map((item) => new DraggableCity(item, size: itemSize))

          .toList());



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
     // pairs_ans[targetId] = selectedItem.wguess;
      //print("Dropped at: ${targetId} by selected ${selectedItem.id}");

    });

  }



  void _onValidate() {

    setState(() {

      score = 0;
      var lst = new List(pairs.length);
      int i = 0;

      pairs.forEach((index, item) {
        lst[i] = item.wguess;
        i++;





      }



      );
       //check answer



       print("Wordd "+lst.toString());

      print("ans "+ans.toString());
       if (lst.toString().compareTo(ans.toString()) ==0)
         print("Correct ");
       else
         print("Wrong");

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