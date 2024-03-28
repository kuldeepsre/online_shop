import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/them/ThemeCubit.dart';
import 'categores_screen.dart';

class ViewMoreScreen extends   StatefulWidget {
@override
_RemoteConfigTextDemoState createState() => _RemoteConfigTextDemoState();
}

class _RemoteConfigTextDemoState extends State<ViewMoreScreen> {
  final RemoteConfig _remoteConfig = RemoteConfig.instance;
  String _message = 'Loading...';

  @override
  void initState() {
    super.initState();
    _fetchRemoteConfig();
  }

  Future<void> _fetchRemoteConfig() async {
    try {
/*      await _remoteConfig.fetch(expiration: const Duration(seconds: 5));
      await _remoteConfig.activateFetched();*/
      setState(() {
        // Update message based on fetched configuration
        _message = _remoteConfig.getString('base_uat') ?? _message;
        print(_message);
      });
    } catch (exception) {
      print('Failed to fetch remote config: $exception');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remote Config Text Demo'),
      ),
      body: Center(
        child: Text(
          _message,
          style: TextStyle(fontSize: 18,color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}