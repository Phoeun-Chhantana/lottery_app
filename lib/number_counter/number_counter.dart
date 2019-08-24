import 'package:flutter/material.dart';

class NumberCounter extends StatefulWidget{
  _NumberCounter createState() => _NumberCounter();
}

class _NumberCounter extends State<NumberCounter>{

  int _value,_min;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _value = 1;
  }

  void _add(){
    setState(() {
     _value += 1;
    });
  }

  void _minus(){
    if(_value != 0){
      setState(() {
        _value -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 122,
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFE9F7FE)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: Color(0xFFF9A825),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Tooltip(
              message: 'Decrement',
              preferBelow: false,
              child: InkWell(
                onTap: _value == 1 ? null : _minus,
                child: Icon(
                    const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                    color: Colors.white,size: 15),
                borderRadius: BorderRadius.circular(50),
              ),
            )
          ),
          Container(
            width: 28,
            height: 26,
            margin: EdgeInsets.only(left: 19,right: 19,top: 8,bottom: 8),
            alignment: Alignment.center,
            child: Text(
              '$_value',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400
              ),
            ),
          ),
          Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: Color(0xFFF9A825),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Tooltip(
                message: 'Increment',
                preferBelow: false,
                child: InkWell(
                  onTap: _add,
                  child: Icon(
                      IconData(0xe145, fontFamily: 'MaterialIcons'),
                      color: Colors.white,size: 17
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              )
          )
        ],
      ),
    );
  }
}