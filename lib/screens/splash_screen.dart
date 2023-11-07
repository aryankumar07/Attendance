import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading..."),
      ),
      body: Center(
        child: Text("Loading your Attendeance screen"),
      ),
    );
  }
}