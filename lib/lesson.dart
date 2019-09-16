import 'package:flutter/material.dart';

main() => runApp(MaterialApp(home: MyHomePage()));

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel in vertical scrollable'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 26.0),
        itemBuilder: (BuildContext context, int index) {
          //if(index % 2 == 0) {
            //return _buildCarousel(context, index ~/ 2);
            return _buildCarousel(context, index);
          //}
          //else {
          //  return Divider();
          //}
        },
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    var less = carouselIndex+1;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('บทเรียน $less'),
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 150.0,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (BuildContext context, int index) {
              return _buildCarouselItem(context, carouselIndex, 5);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      child: Container(
        width:100,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),

        ),
      ),
    );
  }
}