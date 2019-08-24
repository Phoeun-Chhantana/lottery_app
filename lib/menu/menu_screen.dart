import 'package:flutter/material.dart';
import 'my_lottery.dart';
import 'winning_history.dart';

class MenuScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF9A825),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.white,
            size: 30,
          ),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          color: Color(0xFFF9A825),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Menu',
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Futura'
                ),
              ),
              Container(
                width: 145,
                height: 30,
                margin: EdgeInsets.only(top: 32),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MyLotteryScreen())
                      );
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                          'My Lottery',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  )
                )
              ),
              Container(
                  width: 165,
                  height: 30,
                  margin: EdgeInsets.only(top: 16),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.pushNamed(context,'/winning',arguments: false);
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Winning History',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  )
                )
              ),
              Container(
                  width: 145,
                  height: 30,
                  margin: EdgeInsets.only(top: 16),
                  child: FlatButton(
                    onPressed: (){

                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'How to Play',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  )
                )
              ),
              Container(
                  width: 145,
                  height: 30,
                  margin: EdgeInsets.only(top: 16),
                  child: FlatButton(
                    onPressed: (){

                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Contact Us',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  )
                )
              ),
            ],
          ),
        )
      ),
    );
  }
}