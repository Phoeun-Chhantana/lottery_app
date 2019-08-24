import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class BettedScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 316,
              child: Container(
                width: 114,
                height: 20,
                child: Text(
                  'Good Luck!',
                  style: TextStyle(
                    fontFamily: 'Futura',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF623D00)
                  ),
                ),
              ),
            ),
            Positioned(
              top: 344,
              child: Container(
                width: 222,
                height: 36,
                //margin: EdgeInsets.only(bottom: 244),
                child: Text(
                  'You have successfully place bet.\n Result shall be announced soon.',
                  style: TextStyle(
                    fontFamily: 'Futura',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF949BA0)
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              bottom: 42,
              child: Container(
                width: 181,
                height: 50,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                  ),
                  color: Color(0xFFF9A825),
                  onPressed: (){
                    Navigator.popUntil(context, ModalRoute.withName('/home'));
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Futura',
                      fontSize: 24,
                      color: Colors.white
                    ),
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}