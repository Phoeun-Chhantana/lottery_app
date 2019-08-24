import 'package:flutter/material.dart';
import 'package:lottery_app/home/home_screen.dart';

class EditProfileScreen extends StatefulWidget{
  _EditProfileScreen createState() => _EditProfileScreen();
}
class _EditProfileScreen extends State<EditProfileScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 66,
          height: 17,
          child: Text(
            'Account',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 17,
                fontFamily: 'Futura'
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      leading: Container(
        width: 50,
        height: 50,
        child: InkWell(
          child: Icon(
          Icons.arrow_back,
          color: Color(0xFFF9A825),
          size: 27.38
          ),
          borderRadius: BorderRadius.circular(50),
            onTap: (){
              //Navigator.popUntil(context, ModalRoute.withName('/home'));
              Navigator.of(context).pop();
            },
          )
        ),
        actions: <Widget>[
          Container(
            width: 50,
            height: 50,
            child: InkWell(
              child: Icon(
                Icons.check,
                color: Color(0xFFF9A825),
                size: 27.38
              ),
              borderRadius: BorderRadius.circular(50),
              onTap: (){
                Navigator.of(context).pop();
              },
            )
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 58,
            color: Color(0xFF8F8F8),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.only(left: 28,bottom: 4),
                child: Text(
                  'Profile'.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'SF Compact Text',
                    fontSize: 12,
                    color: Color(0xFF707070),
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 112,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 28),
                  width: 75,
                  height: 75,
                  child: Image(image: AssetImage('assets/images/twitch_avatar.png')),
                ),
                Container(
                  margin: EdgeInsets.only(left: 28.25),
                  width: 100,
                  height: 18,
                  child: InkWell(
                    onTap: (){

                    },
                    splashColor: Colors.red,
                    child: Text(
                      'Change Photo',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SF Compact Text',
                        color: Color(0xFF007AFF)
                      ),
                    ),
                  )
                )
              ],
            )
          ),
          Container(
            width: double.infinity,
            height: 56,
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 28),
                  child: Icon(
                    Icons.person,
                    size: 25,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 35,
                      height: 15,
                      margin: EdgeInsets.only(left: 16),
                      child: Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF707070),
                          fontFamily: 'SF Compact Text'
                        ),
                      ),
                    ),
                    Container(
                      //width: 35,
                      height: 18,
                      margin: EdgeInsets.only(left: 16,top: 8),
                      child: Text(
                        'Lalisa Manoban',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'SF Compact Text'
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ),
          Container(
              width: double.infinity,
              height: 56,
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 28),
                    child: Icon(
                      Icons.location_on,
                      size: 25,
                      color: Color(0xFFD9D9D9),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 52,
                        height: 15,
                        margin: EdgeInsets.only(left: 16),
                        child: Text(
                          'Location',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF707070),
                            fontFamily: 'SF Compact Text'
                          ),
                        ),
                      ),
                      Container(
                        //width: 35,
                        height: 18,
                        margin: EdgeInsets.only(left: 16,top: 8),
                        child: Text(
                          'Toul Kork, Phnom Penh',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: 'SF Compact Text',
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}