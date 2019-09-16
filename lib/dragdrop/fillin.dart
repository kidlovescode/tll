import 'package:flutter/material.dart';



enum Status { none, correct, wrong }



class Matching {

  final int id;

  final String wguess;

  final String wchoice;

  bool _selected = false;



  bool get selected => _selected;



  void set selected(bool value) {

    _selected = value;

    if( _selected == false )

      status = Status.none;

  }

  Status status;



  Matching(this.id, this.wguess, this.wchoice, {this.status: Status.none});



  @override

  String toString() {

    return 'Item{id: $id, wquess: $wguess, wchoice: $wchoice,'

        ' selected: $selected, status: $status}';

  }

}



Color getDropBorderColor(Status status) {

  Color c;

  switch (status) {

    case Status.none:

      c = Colors.grey[300];

      break;

    case Status.correct:

      c = Colors.green[200];

      break;

    case Status.wrong:

      c = Colors.red[200];

      break;

  }

  return c;

}