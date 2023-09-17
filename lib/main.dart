import 'package:flutter/material.dart';
import 'package:attendance/screens/main_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{

  await Hive.initFlutter();

  var box = await Hive.openBox('Mybox');

  runApp(MaterialApp(
    home: MainScreen(),
  ));
}