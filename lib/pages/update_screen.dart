import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

class UpdateScreen extends StatelessWidget {
  static const PLAY_STORE_URL = 'my playstore url here';
  static const APP_STORE_URL = 'my appstore url here';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Required'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Update the app to continue using it.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),

            ElevatedButton(
              child: const Text('Update Now'),
              onPressed: () {
                if (kIsWeb) {
                  print('Running on web!');
                } else if (defaultTargetPlatform == TargetPlatform.android) {
                  print('Running on Android!');
                  _launchURL(PLAY_STORE_URL);
                } else if (defaultTargetPlatform == TargetPlatform.iOS) {
                  print('Running on iOS!');
                  _launchURL(APP_STORE_URL);
                } else if (defaultTargetPlatform == TargetPlatform.macOS) {
                  print('Running on macOS!');
                } else if (defaultTargetPlatform == TargetPlatform.windows) {
                  print('Running on Windows!');
                } else if (defaultTargetPlatform == TargetPlatform.linux) {
                  print('Running on Linux!');
                } else {
                  print('Running on an unsupported platform!');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }
}