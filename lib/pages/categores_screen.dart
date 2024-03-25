import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/categories');
          },
          child: const Text('Go to Categories'),
        ),
      ),
    );
  }
}