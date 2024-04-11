import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const CustomSubmitButton({
     Key ? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue, // Default color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: onPressed,

      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}