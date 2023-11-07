import 'package:attendance/screens/auth_screen.dart';
import 'package:attendance/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:attendance/screens/main_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

void main() async {

  await Hive.initFlutter();

  var box = await Hive.openBox('Mybox');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(MaterialApp(
    home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
    builder: (ctx,snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting){
        return SplashScreen();
      }
      if(snapshot.hasData){
        return MainScreen();
      }
      return AuthScreen();
    },
    ),
  ));
}