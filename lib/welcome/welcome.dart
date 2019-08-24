import 'package:flutter/material.dart';
import 'package:lottery_app/login/login_screen.dart';

class WelcomeScreen extends StatelessWidget{

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
              top: 180,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color(0xFFFAA822)
                ),
              ),
            ),
            Positioned(
              width: 136,
              height: 30,
              top: 327,
              child: Container(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontFamily: 'Futura',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              width: 292,
              height: 36,
              top: 372,
              child: Container(
                child: Text(
                  'Lorem ipsum dolor sit amet, consecteur adipiscing\nelit, sed do eiusmod tempo incididunt ut labore',
                  style: TextStyle(
                    fontFamily: 'Futura',
                    fontSize: 13,
                    color: Colors.black
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              width: 320,
              height: 48,
              bottom: 62,
              child: Container(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  color: Color(0xFFFAA822),
                  onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen())
                    );
                  },
                  child: Container(
                    width: 82,
                    height: 23,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Futura',
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ),
              ),
            ),
            Positioned(
              bottom: 34,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 16,
                    margin: EdgeInsets.only(top: 12),
                    child: Text(
                      'Don\'t have a account?',
                    ),
                  ),
                  Container(
                      width: 62,
                      height: 13,
                      margin: EdgeInsets.only(left: 10,top: 12),
                      child: InkWell(
                        onTap: (){},
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}