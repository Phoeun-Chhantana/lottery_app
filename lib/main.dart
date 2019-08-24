import 'package:flutter/material.dart';
import 'package:lottery_app/intro/intro.dart';
import 'package:lottery_app/welcome/welcome.dart';
import 'package:lottery_app/home/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:lottery_app/menu/winning_history.dart';

void main(){

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        //primarySwatch: Colors.white,
        primaryColor: Colors.white
      ),
      home: IntroScreen(),
      routes: {
        '/home' : (context) => HomeScreen(),
        '/winning' : (context) => WinningHistory()
      },
    );
  }
}