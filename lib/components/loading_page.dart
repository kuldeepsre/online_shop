import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class LoadingPage extends StatelessWidget {
  const LoadingPage({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.safePercentHeight * 75,
      child: const Center(
        child: CircularProgressIndicator(
            backgroundColor: Colors.orange,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
      ),
    );
  }
}