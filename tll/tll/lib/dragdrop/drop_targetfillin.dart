
import 'package:tll/dragdrop/draggable_viewfillin.dart';
import 'package:tll/dragdrop/fillin.dart';
import 'package:flutter/material.dart';



typedef void DropItemSelector(Matching item, DropTarget target);



class SelectionNotification extends Notification {

  final int dropIndex;

  final Matching item;

  final bool cancel;



  SelectionNotification(this.dropIndex, this.item, {this.cancel: false});

}



class DropTarget extends StatefulWidget {

  final Matching item;



  final Size size;

  final Size itemSize;



  Matching _selection;



  Matching get selection => _selection;



  get id => item.id;



  set selection(Matching value) {

    clearSelection();

    _selection = value;

  }



  DropTarget(this.item, {this.size, Matching selectedItem, this.itemSize}) {

    _selection = selectedItem;

  }

  @override

  _DropTargetState createState() => new _DropTargetState();



  void clearSelection() {

    if (_selection != null) _selection.selected = false;

  }

}



class _DropTargetState extends State<DropTarget> {

  static const double kFingerSize = 50.0;



  @override

  Widget build(BuildContext context) {

    return new Padding(

        padding: new EdgeInsets.all(4.0),

        child:

        widget.selection != null ? addDraggable(getTarget()) : getTarget());

  }



  Widget addDraggable(DragTarget target) => new Draggable<Matching>(

      data: widget.selection,

      dragAnchor: DragAnchor.pointer,

      onDraggableCanceled: onDragCancelled,

      feedback: getCenteredAvatar(),

      child: target);



  DragTarget getTarget() => new DragTarget<Matching>(

      onWillAccept: (item) => widget.selection != item,

      onAccept: (value) {

        new SelectionNotification(widget.item.id, value).dispatch(context);

      },

      builder: (BuildContext context, List<Matching> accepted,

          List<dynamic> rejected) {

        return new SizedBox(

            child: new Container(

                width: widget.size.width,

                height: widget.size.height,

                decoration: new BoxDecoration(

                    color: accepted.isEmpty

                        ? (widget.selection != null

                        ? getDropBorderColor(widget.selection.status)

                        : Colors.grey[300])

                        : Colors.cyan[100],

                    border: new Border.all(

                        width: 2.0,

                        color:

                        accepted.isEmpty ? Colors.grey : Colors.cyan[300])),

                child: widget.selection != null

                    ? new Column(children: [

                  new Padding(

                      padding: new EdgeInsets.symmetric(vertical: 16.0),

                      child: new Text(widget.item.wchoice)),

                  new Center(

                      child: new SizedBox(

                          width: widget.itemSize.width,

                          height: widget.itemSize.height,

                          child: new Material(

                              elevation: 1.0,

                              child: new Center(

                                child: new Text(

                                  widget.selection.wguess,

                                ),

                              )))),

                ])

                    : new Center(child: new Text(widget.item.wchoice))));

      });



  void onDragCancelled(Velocity velocity, Offset offset) {

    setState(() {

      widget.selection = null;

      new SelectionNotification(widget.item.id, widget.selection, cancel: true)

          .dispatch(context);

    });

  }



  Widget getCenteredAvatar() => new Transform(

      transform: new Matrix4.identity()

        ..translate(-100.0 / 2.0, -(100.0 / 2.0)),

      child: new DragAvatarBorder(

        new Text(widget.selection?.wguess,

            style: new TextStyle(

                fontSize: 16.0,

                color: Colors.white,

                decoration: TextDecoration.none)),

        size: widget.itemSize,

        color: Colors.cyan,

      ));

}