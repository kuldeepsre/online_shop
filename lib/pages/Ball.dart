import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ball extends StatefulWidget {
  final Animation<double> animation;
  final int index;

  const Ball({required this.animation, required this.index});

  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -100 * widget.animation.value),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        );
      },
    );
  }
}