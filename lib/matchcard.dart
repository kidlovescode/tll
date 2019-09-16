import 'package:flutter/material.dart';
import 'package:tll/slidecard.dart';

class MatchCard {
  int redColor = 0;
  int greenColor = 0;
  int blueColor = 0;
  double margin = 0;
  Image pic;
  MatchCard(int red, int green, int blue, double marginTop, Image picture) {
    redColor = red;
    greenColor = green;
    blueColor = blue;
    margin = marginTop;
    pic = picture;
  }

}