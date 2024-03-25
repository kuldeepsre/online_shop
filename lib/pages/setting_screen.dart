import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/them/ThemeCubit.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final themeState = context.watch<ThemeCubit>().state;
    return Scaffold(
      backgroundColor: themeState.backgroundColor,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/Settings');
          },
          child: Text('Settings'),
        ),
      ),
    );
  }
}