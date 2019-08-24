import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:flutter_counter/flutter_counter.dart';
import 'package:lottery_app/number_counter/number_counter.dart';
import 'bet_screen.dart';
import 'package:lottery_app/model/lottery_model.dart';
import 'package:provider/provider.dart';
import 'game_container.dart';

class TwoDigitScreen extends StatefulWidget{
  _TwoDigitScreen createState() => _TwoDigitScreen();
}

class _TwoDigitScreen extends State<TwoDigitScreen> with GameContainer{

  TextEditingController _firstController;
  TextEditingController _secondController;
  FocusNode _focusNode;

  List<Widget> _listTwoDigits = [];
  bool _isAdded;

  List<LotteryModel> _twoDigits = [];
  GameContainer _gameContainer;

  @override
  void initState() {
    super.initState();

    _firstController = TextEditingController();
    _secondController = TextEditingController();
    _focusNode = FocusNode();
    _isAdded = false;

    //For Two Digit
    _listTwoDigits.add(numberField(_firstController,null,TextInputAction.next));
    _listTwoDigits.add(numberField(_secondController,_focusNode,TextInputAction.done));
  }

  @override
  void dispose(){
    _firstController.dispose();
    _secondController.dispose();
    super.dispose();
  }


  @override
  Widget numberField(TextEditingController controller, FocusNode focusNode, TextInputAction inputAction) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF1A28B2F0)
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [

        ],
        textInputAction: inputAction,
        decoration: InputDecoration(
            border: InputBorder.none,
            counter: Text(''),
            contentPadding: EdgeInsets.only(left: 15,top: 5,bottom: -15)
        ),
        style: TextStyle(
            fontSize: 35,
            color: Color(0xFF623D00),
            fontWeight: FontWeight.bold
        ),
        onEditingComplete: (){
          if(_firstController.text.isNotEmpty){
            _setFocus();
          }
          if(_secondController.text.isNotEmpty){
            if(_firstController.text.isEmpty){
              FocusScope.of(context).isFirstFocus;
            }
            else FocusScope.of(context).unfocus();
          }
        },
        onChanged: (val){
          setState(() {
            hasNumber();
          });
        },
      ),
    );
  }

  Widget _getNumberField(int length){
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(), //disable scroll
        itemBuilder: (context,index){
          return _listTwoDigits[index];
        },
        shrinkWrap: true,
        itemCount: length,
      )
    );
  }

//  Widget _numberField(TextEditingController controller,FocusNode focusNode,TextInputAction inputAction){
//    return Container(
//      width: 50,
//      height: 50,
//      margin: EdgeInsets.only(right: 5),
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(10),
//        color: Color(0xFF1A28B2F0)
//      ),
//      child: TextField(
//        controller: controller,
//        focusNode: focusNode,
//        keyboardType: TextInputType.number,
//        maxLength: 1,
//        inputFormatters: [
//
//        ],
//        textInputAction: inputAction,
//        decoration: InputDecoration(
//          border: InputBorder.none,
//          counter: Text(''),
//          contentPadding: EdgeInsets.only(left: 15,top: 5,bottom: -15)
//        ),
//        style: TextStyle(
//          fontSize: 35,
//          color: Color(0xFF623D00),
//          fontWeight: FontWeight.bold
//        ),
//        onEditingComplete: (){
//          if(_firstController.text.isNotEmpty){
//            _setFocus();
//          }
//          if(_secondController.text.isNotEmpty){
//            if(_firstController.text.isEmpty){
//              FocusScope.of(context).isFirstFocus;
//            }
//            else FocusScope.of(context).unfocus();
//          }
//        },
//        onChanged: (val){
//          setState(() {
//            _hasNumber();
//          });
//        },
//      ),
//    );
//  }

  @override
  Widget pickedNumberContainer(bool isAdded){
    if(isAdded == false){
      return Container(
        //width: 358,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
          )
        ),
        child: const Text(
          'No selected Number',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xFF848383)
          ),
        ),
      );
    }
    else{
      return Container(
//        width: 358,
//        height: 130,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
            )
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    width: 20,
                    height: 15,
                    margin: EdgeInsets.only(left: 12,top: 16,right: 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('NO',style: TextStyle(fontSize: 12,color: Color(0xFF848383),fontFamily: 'Futura')),
                    )
                  ),
                  Container(
                    width: 49,
                    height: 15,
                    margin: EdgeInsets.only(top: 16,right: 28,left: 0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('NUMBER',style: TextStyle(fontSize: 12,color: Color(0xFF848383),fontFamily: 'Futura')),
                    )
                  ),
                  Container(
                    width: 54,
                    height: 15,
                    margin: EdgeInsets.only(top: 16,left: 0,right: 15),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('AMOUNT',style: TextStyle(fontSize: 12,color: Color(0xFF848383),fontFamily: 'Futura')),
                    )
                  )
                ],
              ),
              Container(
                //height: 150,
                margin: EdgeInsets.only(bottom: 15),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(), //disable scroll
                  itemBuilder: (context,index){
                    return Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 18,
                            height: 18,
                            margin: EdgeInsets.only(left: 15,top: 16,right: 0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text((index + 1).toString(),style: TextStyle(fontSize: 15)),
                            )
                          ),
                          Container(
                            width: 18,
                            height: 18,
                            margin: EdgeInsets.only(top: 16,right: 15,left: 0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                _twoDigits[index].getPickedNumber,
                                style: TextStyle(fontSize: 15),
                              ),
                            )
                          ),
                          Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  //width: 48,
                                  height: 18,
                                  margin: EdgeInsets.only(top: 16,left: 0,right: 5),
                                  child: Text(
                                    _twoDigits[index].getAmount.toString() + ' SRY',
                                    style: TextStyle(fontSize: 15)
                                  ),
                                ),
                                Container(
                                  width: 14,
                                  height: 14,
                                  margin: EdgeInsets.only(top: 15,left: 0,right: 12),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF9A825),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Tooltip(
                                    message: 'Decrement',
                                    preferBelow: false,
                                    child: InkWell(
                                      onTap: (){
                                        setState(() {
                                          _twoDigits.removeAt(index);
                                        });
                                        if(_twoDigits.length == 0){
                                          setState(() {
                                            _isAdded = false;
                                          });
                                          clearController();
                                        }
                                      },
                                      child: Icon(
                                          const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                                          color: Colors.white,size: 15),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  )
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: _twoDigits.length,
                ),
              ),
              Divider(height: 5,color: Colors.grey),
              Container(
                height: 50,
                margin: EdgeInsets.only(left: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Total: $calculateTotal SRY',
                    style: TextStyle(
                      fontSize: 17
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      );
    }
  }

  @override
  int  get calculateTotal{
    int _total = 0;
    for(LotteryModel lottery in _twoDigits){
      _total += lottery.getAmount;
    }
    return _total;
  }

  @override
  Widget get placeBetButton{
    return Container(
      width: 181,
      height: 50,
      child: FlatButton(
        onPressed: (){
          setState(() {
            _isAdded = false;
          });
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => BettedScreen())
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: Color(0xFFF9A825),
        child: Container(
          width: 125,
          height: 23,
          alignment: Alignment.center,
          child: Text(
            'Place bet'.toUpperCase(),
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Futura',
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.left,
          ),
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Positioned(
                top: 16,
                left: 28,
                right: 28,
                child: Container(
                  width: 358,
                  height: 252,
                  //margin: EdgeInsets.only(top: 16,left: 28,right: 28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
              Positioned(
                top: 31,
                right: 44,
                child: Container(
                  width: 69,
                  height: 30,
                  child: FlatButton(
                    disabledColor: Color(0xFF80F9A825),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    color: Color(0xFFF9A825),
                    onPressed: hasNumber() ? onAdded : null,
                    child: Text(
                      'ADD',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                ),
              ),
              Positioned(
                top: 46,
                left: 129,
                right: 129,
                child: Container(
                  width: 100,
                  height: 20,
                  alignment: Alignment.center,
                  //margin: EdgeInsets.only(top: 46,left: 157),
                  child: Text(
                    'Pick Number',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 76,
                left: 126.61,
                right: 126.39,
                child: Container(
                  alignment: Alignment.center,
                  child: _getNumberField(_listTwoDigits.length),
                ),
              ),
              Positioned(
                top: 141,
                left: 157,
                right: 157,
                child: Container(
                  width: 44,
                  height: 15,
                  alignment: Alignment.center,
                  //margin: EdgeInsets.only(top: 141,left: 185),
                  child: Text(
                    'Amount',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF949BA0)
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 161,
                left: 118,
                right: 118,
                child: Container(
                  alignment: Alignment.center,
                  //margin: EdgeInsets.only(top: 161,left: 146),
                  child: NumberCounter(),
                ),
              ),
              Positioned(
                top: 223,
                left: 133,
                right: 133,
                child: Container(
                  width: 92,
                  height: 15,
                  alignment: Alignment.center,
                  //margin: EdgeInsets.only(top: 223,left: 161),
                  child: Text(
                    'Potential Reward',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF949BA0)
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 238,
                left: 147,
                //right: 147,
                child: Container(
                  //width: 64,
                  height: 20,
                  //alignment: Alignment.center,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '950 SRY',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Futura'
                      ),
                    ),
                  )
                ),
              ),
              Positioned(
                top: 300,
                left: 28,
                right: 28,
                child: Container(
                  //width: 358,
                  height: 50,
                  alignment: Alignment.center,
                  //margin: EdgeInsets.only(top: 300,left: 28),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)
                    ),
                    color: Color(0xFFF9A825)
                  ),
                  child: Text(
                    'Picked Numbers',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Futura'
                    ),
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 350,left: 28,right: 28),
                child: pickedNumberContainer(_isAdded),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 24,bottom: 17),
            child: _isAdded == true ? placeBetButton : Container(),
          ),
        ],
      )
    );
  }

  void _setFocus(){
    setState(() {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  bool hasNumber(){
    if(_firstController.text.length > 0 && _secondController.text.length > 0){
      return true;
    }
    else return false;
  }

  @override
  void onAdded(){
    int _first = int.parse(_firstController.text.trim());
    int _second = int.parse(_secondController.text.trim());
    setState(() {
      _isAdded = true;
      _twoDigits.add(new TwoDigitModel(_first, _second, 100));
    });
    clearController();
  }

  @override
  void clearController(){
    setState(() {
      _firstController.clear();
      _secondController.clear();
    });
  }

}