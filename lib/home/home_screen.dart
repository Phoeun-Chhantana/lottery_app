import 'package:flutter/material.dart';
import 'package:lottery_app/games/game_screen.dart';
import 'package:lottery_app/profiles/profile.dart';
import 'package:lottery_app/menu/menu_screen.dart';

class HomeScreen extends StatefulWidget{
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>{

  Color _borderColor;
  bool _isPopped;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _isPopped = false;
    _borderColor = Colors.transparent;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _isPopped = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(left: 8),
          child: Ink.image(
            image: AssetImage('assets/images/twitch_avatar.png'),
            width: 36,
            height: 36,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen()
                  )
                );
              },
            ),
          ),
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 8,bottom: 8,right: 8),
            child: FlatButton(
              onPressed: (){

              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
              ),
              color: Color(0xFFF9A825),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'SRY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Boing',
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  Container(
                    //width: 55,
                    height: 23,
                    margin: EdgeInsets.only(bottom: 7,top: 6,left: 8),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '1,000',
                        style: TextStyle(
                          color: Color(0xFF623D00),
                          fontSize: 20,
                          fontFamily: 'Boing',
                          fontWeight: FontWeight.w800
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: _contentBody(),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => MenuScreen()));
        },
        backgroundColor: Color(0xFFF9A825),
        tooltip: 'Menu',
        elevation: 1,
        child: IconButton(
          onPressed: null,
          icon: Icon(Icons.settings),
          iconSize: 40,
          disabledColor: Colors.white,
        )
      ),
    );
  }

  Widget _contentBody(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              margin: EdgeInsets.only(top: 87,left: 12,right: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
//                border: Border.all(
//                  color: _borderColor,
//                  width: 3
//                )
              ),
              child: FlatButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GameScreen(tabIndex: 0))
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                color: Color(0xFF1A28B2F0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      child: Image(image: AssetImage('assets/images/two.png')),
                    ),
                    Container(
                      width: 62,
                      height: 20,
                      margin: EdgeInsets.only(top: 21),
                      child: Text(
                        '2-DIGIT',
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFF707070)
                        ),
                      ),
                    )
                  ],
                ),
              )
            ),
            Container(
                width: 150,
                height: 150,
                margin: EdgeInsets.only(top: 87,left: 12,right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.transparent,
                    width: 3
                  )
                ),
                child: FlatButton(
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => GameScreen(tabIndex: 1))
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  color: Color(0xFF1A28B2F0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        child: Image(image: AssetImage('assets/images/three.png')),
                      ),
                      Container(
                        width: 62,
                        height: 20,
                        margin: EdgeInsets.only(top: 21),
                        child: Text(
                          '3-DIGIT',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFF707070)
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ),
          ],
        ),
        Container(
          width: 150,
          height: 150,
          margin: EdgeInsets.only(top: 25,left: 0,right: 158,bottom: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.transparent,
              width: 3
            )
          ),
          child: FlatButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => GameScreen(tabIndex: 2))
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            color: Color(0xFF1A28B2F0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  child: Image(image: AssetImage('assets/images/four.png')),
                ),
                Container(
                  width: 62,
                  height: 20,
                  margin: EdgeInsets.only(top: 21),
                  child: Text(
                    '4-DIGIT',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF707070)
                    ),
                  ),
                )
              ],
            ),
          )
        ),
      ],
    );
  }
}