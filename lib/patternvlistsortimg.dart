import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';

void main() => runApp(OrderingEventImg());
var questionNumber = 0;
class OrderingEventImg extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rerderable List',
      theme: ThemeData(
        dividerColor: Color(0x50000000),
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Reorderable List'),
    );
  }
}
var datacheck = new DataCheck();
class DataCheck{
  var event = [["แม่ไก่ฟักไข่","ไก่ออกลูกเป็นไข่","ลูกเจี๊ยบเดินได้","ไข่แตกลูกเจี๊ยบเกิด"]];
  var ans = [["ไก่ออกลูกเป็นไข่","แม่ไก่ฟักไข่","ไข่แตกลูกเจี๊ยบเกิด","ลูกเจี๊ยบเดินได้"]];
  var img = [["images/order2.png", "images/order1.png","images/order4.png","images/order3.png"]];

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class ItemData {
  ItemData(this.title, this.key);

  final String title;

  // Each item in reorderable list needs stable and unique key
  final Key key;
}

enum DraggingMode {
  iOS,
  Android,
}

class _MyHomePageState extends State<MyHomePage> {
  List<ItemData> _items, _items_img, _items_ans;



  _MyHomePageState() {
    _items = List();
    _items_img = List();
    _items = List();
    _items_ans = List();
    for (int i = 0; i< datacheck.event[questionNumber].length;i++){
      _items.add(ItemData(datacheck.event[questionNumber][i], ValueKey(i)));
      _items_ans.add(ItemData(datacheck.ans[questionNumber][i], ValueKey(i)));
      _items_img.add(ItemData(datacheck.img[questionNumber][i], ValueKey(i)));

    }


    /*
    for (int i = 0; i < 500; ++i) {
      String label = "List item $i";
      if (i == 5) {
        label += ". This item has a long label and will be wrapped.";
      }
      _items.add(ItemData(label, ValueKey(i)));
    }*/
  }

  // Returns index of item with given key
  int _indexOfKey(Key key) {
    return _items.indexWhere((ItemData d) => d.key == key);
  }

  bool _reorderCallback(Key item, Key newPosition) {
    int draggingIndex = _indexOfKey(item);
    int newPositionIndex = _indexOfKey(newPosition);

    // Uncomment to allow only even target reorder possition
    // if (newPositionIndex % 2 == 1)
    //   return false;

    final draggedItem = _items[draggingIndex];
    final draggedItemImg = _items_img[draggingIndex];

    setState(() {
      debugPrint("Reordering $item -> $newPosition");
      _items.removeAt(draggingIndex);
      _items.insert(newPositionIndex, draggedItem);
      _items_img.removeAt(draggingIndex);
      _items_img.insert(newPositionIndex, draggedItemImg);

    });
    return true;
  }

  void _reorderDone(Key item) {
    final draggedItem = _items[_indexOfKey(item)];
    debugPrint("Reordering finished for ${draggedItem.title}}");
  }

  //
  // Reordering works by having ReorderableList widget in hierarchy
  // containing ReorderableItems widgets
  //

  DraggingMode _draggingMode = DraggingMode.iOS;

  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableList(
        onReorder: this._reorderCallback,
        onReorderDone: this._reorderDone,
        child: CustomScrollView(
          // cacheExtent: 3000,
          slivers: <Widget>[
            SliverAppBar(
              actions: <Widget>[

                Icon(Icons.reorder),
                new Text ("เลื่อนขึ้นหรือลง", style: TextStyle(fontSize: 20, decorationColor: Colors.blueAccent),)


              ],
              pinned: true,
              expandedHeight: 60.0,
              backgroundColor: Colors.blue[100],

              flexibleSpace: const FlexibleSpaceBar(
                title: const Text('เรียงลำดับเหตุการณ์'),
              ),
            ),
            SliverPadding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Item(
                        imagedata: _items_img[index],

                        data: _items[index],
                        isImage: _items[index].title == _items_ans[index].title?Image.network("http://www.kidlovescode.com/gamethai/pic/menu/right.png",width: 30,height:30):
                        Image.network("http://www.kidlovescode.com/gamethai/pic/menu/wrong.png",width: 30,height:30),
                        // first and last attributes affect border drawn during dragging
                        isFirst: index == 0,
                        isLast: index == _items.length - 1,
                        draggingMode: _draggingMode,
                      );
                    },
                    childCount: _items.length,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  Item({
    this.imagedata,
    this.data,
    this.isFirst,
    this.isLast,
    this.draggingMode,
    this.isImage,
  });
  final ItemData imagedata;
  final ItemData data;
  final bool isFirst;
  final bool isLast;
  final Image isImage;
  final DraggingMode draggingMode;

  Widget _buildChild(BuildContext context, ReorderableItemState state) {
    BoxDecoration decoration;

    if (state == ReorderableItemState.dragProxy ||
        state == ReorderableItemState.dragProxyFinished) {
      // slightly transparent background white dragging (just like on iOS)
      decoration = BoxDecoration(color: Color(0xD0FFFFFF));
    } else {
      bool placeholder = state == ReorderableItemState.placeholder;
      decoration = BoxDecoration(
          border: Border(
              top: isFirst && !placeholder
                  ? Divider.createBorderSide(context) //
                  : BorderSide.none,
              bottom: isLast && placeholder
                  ? BorderSide.none //
                  : Divider.createBorderSide(context)),
          color: placeholder ? null : Colors.white);
    }

    // For iOS dragging mdoe, there will be drag handle on the right that triggers
    // reordering; For android mode it will be just an empty container
    Widget dragHandle = draggingMode == DraggingMode.iOS
        ? ReorderableListener(
      child: Container(
        padding: EdgeInsets.only(right: 18.0, left: 18.0),
        color: Color(0x08000000),
        child: Row(
            children: <Widget>[
              isImage,
              Icon(Icons.reorder, color: Colors.blueAccent),
            ]
        ),
      ),
    )
        : Container();

    Widget content = Container(
      decoration: decoration,
      child: SafeArea(
          top: false,
          bottom: false,
          child: Opacity(
            // hide content for placeholder
            opacity: state == ReorderableItemState.placeholder ? 0.0 : 1.0,
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 14.0),
                          child:
                        (
                        Row(
                            children: <Widget>[


                              new Image.asset(imagedata.title, width:100, height: 100),
                        new Text(data.title,style: Theme.of(context).textTheme.subhead)

                        ]
                      )))),
                  // Triggers the reordering
                  dragHandle,
                ],
              ),
            ),
          )),
    );

    // For android dragging mode, wrap the entire content in DelayedReorderableListener
    if (draggingMode == DraggingMode.Android) {
      content = DelayedReorderableListener(
        child: content,
      );
    }

    return content;
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableItem(
        key: data.key, //
        childBuilder: _buildChild);
  }
}