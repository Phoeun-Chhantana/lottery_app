import 'package:flutter/material.dart';
import 'package:lottery_app/welcome/welcome.dart';
import 'dart:async';

class IntroScreen extends StatefulWidget{
  _IntroScreen createState() => _IntroScreen();
}

class _IntroScreen extends State<IntroScreen>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadingTime();
  }

  loadingTime() async{
    Duration _duration = await Duration(seconds: 2);
    return Timer(_duration,navigationToWelcomeScreen);
  }

  void navigationToWelcomeScreen(){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => WelcomeScreen()), (x){
      return false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                width: 125.0,
                height: 125.0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Color(0xFFFAA822)
                  ),
                ),
              ),
              Positioned(
                width: 26,
                height: 26,
                bottom: 63,
                child: Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              Positioned(
                width: 96,
                height: 16,
                bottom: 32,
                child: Container(
                  child: Text(
                    'version beta 1.0',
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Color(0xFF707070),
                    ),
                  ),
                ),
              )
//              Container(
//                width: 26,
//                height: 26,
//                margin: EdgeInsets.only(top: 647,bottom: 63,left: 195,right: 192),
//                child: Align(
//                  alignment: Alignment.bottomCenter,
//                  child: CircularProgressIndicator(),
//                ),
//              ),
//              Container(
//                margin: EdgeInsets.only(top: 688,bottom: 32,left: 152,right: 152),
//                child: Text(
//                  'version beta 1.0',
//                  style: TextStyle(
//                    fontSize: 13.0,
//                    color: Color(0xFF707070),
//                  ),
//                ),
//              )
            ],
          )
      ),
    );
  }
}