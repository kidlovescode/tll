import 'package:tll/dragdrop/matching2.dart';

import 'package:tll/dragdrop/draggable_view2.dart';

import 'package:flutter/material.dart';



class DraggableCity extends StatefulWidget {

  final Matching item;

  final Size size;



  bool enabled = true;

  DraggableCity(this.item, {this.size});



  @override

  _DraggableCityState createState() => new _DraggableCityState();

}



class _DraggableCityState extends State<DraggableCity> {

  @override

  Widget build(BuildContext context) {

    return new Padding(

        padding: new EdgeInsets.all(4.0),

        child: new Draggable<Matching>(

            onDraggableCanceled: (velocity, offset) {

              setState(() {

                widget.item.selected = false;

                widget.item.status = Status.none;

              });

            },

            childWhenDragging: new DragAvatarBorder(new Image.asset(widget.item.wguess),

                color: Colors.grey[200], size: widget.size),

            child: new Container(

                width: widget.size.width,

                height: widget.size.height,

                color: widget.item.selected ? Colors.grey : Colors.cyan,

                child: new Center(

                  child: new Image.asset(widget.item.wguess)),

                ),

            data: widget.item,

            feedback: new DragAvatarBorder(

              new Image.asset(widget.item.wguess),

              size: widget.size,

              color: Colors.cyan,

           )));}



}