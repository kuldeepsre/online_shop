import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Ball.dart';

class GameWidget extends StatefulWidget {
  final int ballCount;

  const GameWidget({Key? key, required this.ballCount}) : super(key: key);

  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;
  late List<int> _scores;
  late List<Ball> _balls;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.ballCount, (index) => AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true));
    _animations = _controllers.map((controller) => Tween<double>(begin: 0, end: 1).animate(controller)).toList();
    _scores = List.filled(widget.ballCount, 0);
    _balls = List.generate(widget.ballCount, (index) => Ball(animation: _animations[index], index: index));
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _jump(int index) {
    setState(() {
      _scores[index]++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: _balls.map((ball) => ball).toList(),
        ),
        SizedBox(height: 20),
        Column(
          children: List.generate(
            widget.ballCount,
                (index) => Text(
              'Ball ${index + 1} Score: ${_scores[index]}',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            for (var controller in _controllers) {
              controller.forward();
            }
          },
          child: Text('Start Game'),
        ),
        ElevatedButton(
          onPressed: () {
            for (var controller in _controllers) {
              controller.stop();
            }
          },
          child: Text('Stop Game'),
        ),
        ElevatedButton(
          onPressed: () {
            final random = Random();
            final index = random.nextInt(widget.ballCount);
            _jump(index);
          },
          child: Text('Jump Random Ball'),
        ),
      ],
    );
  }
}