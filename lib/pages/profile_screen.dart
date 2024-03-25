import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/them/ThemeCubit.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  final themState  =context.watch<ThemeCubit>().state;
    return Scaffold(
      backgroundColor: themState.backgroundColor,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
          child: Text('Go to Settings'),
        ),
      ),
    );
  }
}