import 'package:flutter/material.dart';
void main() => runApp(DrawPaint());
class DrawPaint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.deepOrangeAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Shapes'),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomPaint(
            painter: ShapesPainter(),
            child: Container(
              height: 700,
            ),
          ),
        ),
      ),
    );
  }
}
class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // set the paint color to be white
    paint.color = Colors.white;
    // Create a rectangle with size and width same as the canvas
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    // draw the rectangle using the paint
    canvas.drawRect(rect, paint);
    paint.color = Colors.yellow;
    // create a path
    var path = Path();
    path.lineTo(size.width/2, 0);
    path.lineTo(size.width/2, size.height/2);
    paint.color = Colors.yellow;
    path.close();

    final p1 = Offset(size.width/2, size.height/5);
    final p2 = Offset(size.width/2, 300);
    paint.color = Colors.blue;
    paint.strokeWidth = 10;

    canvas.drawLine(p1, p2, paint);
//    drawLeg(canvas,paint,size);
    final p3 = Offset(size.width/2, 300);
    final p4 = Offset(size.width/2-50, 350);
    final p5 = Offset(size.width/2+50, 350);
    final p6 = Offset(size.width/2-100, size.height/5 + 50);
    final p7 = Offset(size.width/2+100, size.height/5 + 50);

    paint.color = Colors.blue;
    paint.strokeWidth = 10;

    canvas.drawLine(p3, p4, paint);
    canvas.drawLine(p3, p5, paint);
    canvas.drawLine(p1, p6, paint);
    canvas.drawLine(p1, p7, paint);




    // set the color property of the paint
    paint.color = Colors.deepOrange;
    // center of the canvas is (x,y) => (width/2, height/2)
    var center = Offset(size.width / 2, size.height / 9);
    // draw the circle with center having radius 75.0
    canvas.drawCircle(center, 45.0, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
  drawLeg(canvas,paint,size){



  }
}