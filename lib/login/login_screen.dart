import 'package:flutter/material.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:lottery_app/home/home_screen.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget{
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> with WidgetsBindingObserver{

  TextEditingController _usernameController;
  TextEditingController _passwordController;

  FocusNode _focusNode;
  double _positionTopUsername = 0;
  double _positionTopPassword = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _usernameController = TextEditingController();
    _passwordController = TextEditingController();

    WidgetsBinding.instance.addObserver(this);
    _focusNode = new FocusNode();

    _positionTopUsername = 406;
    _positionTopPassword = 470;
  }
  void setFocus(){
    FocusScope.of(context).requestFocus(_focusNode);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _focusNode.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  onTapFocusUsername(){
    setState(() {
      _positionTopUsername = 330;
    });
  }

  onTapFocusPassword(){
    setState(() {
      _positionTopPassword = 330;
    });
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final value = WidgetsBinding.instance.window.viewInsets.bottom;
    if(value > 0){

    }
    else{
      //detect when keyboard disappear
      setState(() {
        _positionTopUsername = 406;
        _positionTopPassword = 470;
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  width: 125.0,
                  height: 125.0,
                  top: 88,
                  child: Container(
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0), color: Color(0xFFFAA822)
              ),
            ),
          ),
          Positioned(
            width: 136,
            height: 30,
            top: 235,
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
            width: 320,
            height: 48,
            top: _positionTopUsername,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Color(0xFFF5F8FD),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 18),
                child: TextField(
                  controller: _usernameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: 17,
                      color: Color(0xFFB8C2C8),
                      fontFamily: 'Futura'
                    ),
                  ),
                  onEditingComplete: (){
                    setFocus();
                    setState(() {
                      _positionTopUsername = 406;
                      _positionTopPassword = 330;
                    });
                  },
                  onTap: (){
                    onTapFocusUsername();
                  },
                ),
              )
            ),
          ),
            Positioned(
              width: 320,
              height: 48,
              top: _positionTopPassword,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Color(0xFFF5F8FD)
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: TextField(
                    controller: _passwordController,
                    textInputAction: TextInputAction.done,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color: Color(0xFFB8C2C8),
                        fontFamily: 'Futura'
                      ),
                    ),
                    onTap: (){
                      onTapFocusPassword();
                      setState(() {
                        _positionTopUsername = 406;
                      });
                    },
                    onEditingComplete: (){
                      setState(() {
                        _positionTopPassword = 470;
                        FocusScope.of(context).unfocus(); // dismiss keyboard
                      });
                    },
                  ),
                )
              ),
            ),
            Positioned(
              width: 320,
              height: 48,
              top: 534,
              child: Container(
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  color: Color(0xFFFAA822),
                  onPressed: (){
                    Navigator.of(context).pushNamedAndRemoveUntil('/home', ModalRoute.withName('/'));
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
                  top: 597,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 16,
                        child: Text(
                          'Don\'t have a account?',
                        ),
                      ),
                      Container(
                        width: 62,
                        height: 13,
                        margin: EdgeInsets.only(left: 10),
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
                )
            ],
          ),
        ),
      ),
    );
  }
}