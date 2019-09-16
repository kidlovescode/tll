import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
void main() => runApp(Spinner());
class Spinner extends StatefulWidget {
  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  var text;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(

      animation: _controller,
      child: Container(width: 550.0, height: 550.0, color: Colors.white,
        foregroundDecoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('http://www.inspireadviser.com/gamethai/pic/logo.png'),
            centerSlice: Rect.fromLTWH(180.0, 180.0, 300,300),
          ),
        ),

      ),
      builder: (BuildContext context, Widget child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * 3.14,
           child:child,

        );
      },
    );
  }
}
