import 'package:flutter/material.dart';
import 'package:lottery_app/number_counter/number_counter.dart';
import 'package:toast/toast.dart';
import 'package:lottery_app/model/lottery_model.dart';
import 'package:lottery_app/games/two_digit.dart';
import 'three_digit.dart';

abstract class GameContainer{

  List<LotteryModel> _lotteries = [];

  bool _isAdded = false;

  Widget numberField(TextEditingController controller,FocusNode focusNode,TextInputAction inputAction);
  bool hasNumber();
  void clearController();
  Widget get placeBetButton;
  void onAdded();
  int get calculateTotal;
  Widget pickedNumberContainer(bool isAdded);

//  Widget gameContainer(BuildContext context,State state,bool hasNumber,List<Widget> numberField,List<TextEditingController> controllers){
//    return Container(
//        width: double.infinity,
//        height: double.infinity,
//        child: ListView(
//          shrinkWrap: true,
//          children: <Widget>[
//            Stack(
//              children: <Widget>[
//                Positioned(
//                  top: 16,
//                  left: 28,
//                  right: 28,
//                  child: Container(
//                    width: 358,
//                    height: 252,
//                    //margin: EdgeInsets.only(top: 16,left: 28,right: 28),
//                    decoration: BoxDecoration(
//                      color: Colors.white,
//                      borderRadius: BorderRadius.circular(10)
//                    ),
//                  ),
//                ),
//                Positioned(
//                  top: 31,
//                  right: 44,
//                  child: Container(
//                    width: 69,
//                    height: 30,
//                    child: FlatButton(
//                      disabledColor: Color(0xFF80F9A825),
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(25)
//                      ),
//                      color: Color(0xFFF9A825),
//                      onPressed: hasNumber ? (){
//                        if(controllers.length == 2){
//                          int first = int.parse(controllers[0].text.trim());
//                          int second = int.parse(controllers[1].text.trim());
//                          state.setState((){
//                            _isAdded = true;
//                            _lotteries.add(new TwoDigitModel(first, second, 20));
//                          });
//                          controllers[0].clear();
//                          controllers[1].clear();
//                        }
//                        else if(controllers.length == 3){
//                          int first = int.parse(controllers[0].text.trim());
//                          int second = int.parse(controllers[1].text.trim());
//                          int third = int.parse(controllers[2].text.trim());
//                          state.setState((){
//                            _isAdded = true;
//                            _lotteries.add(new ThreeDigitModel(first, second,third, 20));
//                          });
//                          controllers[0].clear();
//                          controllers[1].clear();
//                        }
//                        else{
//
//                        }
//                      } : null,
//                      child: Text(
//                        'ADD',
//                        style: TextStyle(
//                          color: Colors.white,
//                          fontSize: 17,
//                          fontWeight: FontWeight.bold
//                        ),
//                      )
//                    ),
//                  ),
//                ),
//                Positioned(
//                  top: 46,
//                  left: 129,
//                  right: 129,
//                  child: Container(
//                    width: 100,
//                    height: 20,
//                    alignment: Alignment.center,
//                    //margin: EdgeInsets.only(top: 46,left: 157),
//                    child: Text(
//                      'Pick Number',
//                      style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                        fontSize: 17
//                      ),
//                    ),
//                  ),
//                ),
//                Positioned(
//                  top: 76,
//                  //left: 126.61,
//                  right: 126.39,
//                  child: Container(
//                    alignment: Alignment.center,
//                    child: Container(
//                      height: 50,
//                      child: ListView.builder(
//                        scrollDirection: Axis.horizontal,
//                        physics: NeverScrollableScrollPhysics(), //disable scroll
//                        itemBuilder: (context,index){
//                          return numberField[index];
//                        },
//                        shrinkWrap: true,
//                        itemCount: numberField.length,
//                      ),
//                    ),
//                  ),
//                ),
//                Positioned(
//                  top: 141,
//                  left: 157,
//                  right: 157,
//                  child: Container(
//                    width: 44,
//                    height: 15,
//                    alignment: Alignment.center,
//                    //margin: EdgeInsets.only(top: 141,left: 185),
//                    child: Text(
//                      'Amount',
//                      style: TextStyle(
//                        fontSize: 12,
//                        fontFamily: 'Futura',
//                        fontWeight: FontWeight.w700,
//                        color: Color(0xFF949BA0)
//                      ),
//                    ),
//                  ),
//                ),
//                Positioned(
//                  top: 161,
//                  left: 118,
//                  right: 118,
//                  child: Container(
//                    alignment: Alignment.center,
//                    //margin: EdgeInsets.only(top: 161,left: 146),
//                    child: NumberCounter(),
//                  ),
//                ),
//                Positioned(
//                  top: 223,
//                  left: 133,
//                  right: 133,
//                  child: Container(
//                    width: 92,
//                    height: 15,
//                    alignment: Alignment.center,
//                    //margin: EdgeInsets.only(top: 223,left: 161),
//                    child: Text(
//                      'Potential Reward',
//                      style: TextStyle(
//                          fontSize: 12,
//                          color: Color(0xFF949BA0)
//                      ),
//                    ),
//                  ),
//                ),
//                Positioned(
//                  top: 238,
//                  left: 147,
//                  //right: 147,
//                  child: Container(
//                  //width: 64,
//                    height: 20,
//                    //alignment: Alignment.center,
//                    child: Align(
//                      alignment: Alignment.center,
//                      child: Text(
//                        '950 SRY',
//                        style: TextStyle(
//                          fontSize: 16,
//                          color: Colors.black,
//                          fontWeight: FontWeight.bold,
//                          fontFamily: 'Futura'
//                        ),
//                      ),
//                    )
//                  ),
//                ),
//                Positioned(
//                  top: 300,
//                  left: 28,
//                  right: 28,
//                  child: Container(
//                  //width: 358,
//                    height: 50,
//                    alignment: Alignment.center,
//                    //margin: EdgeInsets.only(top: 300,left: 28),
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.only(
//                        topRight: Radius.circular(10),
//                        topLeft: Radius.circular(10)
//                      ),
//                      color: Color(0xFFF9A825)
//                    ),
//                    child: Text(
//                      'Picked Numbers',
//                      style: TextStyle(
//                        fontSize: 17,
//                        fontWeight: FontWeight.w700,
//                        fontFamily: 'Futura'
//                      ),
//                    )
//                  ),
//                ),
//                Container(
//                  margin: EdgeInsets.only(top: 350,left: 28,right: 28),
//                  child: pickedNumberContainer(_isAdded),
//                ),
//              ],
//            ),
//            Container(
//              alignment: Alignment.center,
//              margin: EdgeInsets.only(top: 24,bottom: 17),
//              child: _isAdded == true ? Container() : Container(),
//            ),
//          ],
//        )
//    );
//  }
//
//  Widget pickedNumberContainer(bool isAdded){
//    if(isAdded == false){
//      return Container(
//        //width: 358,
//        height: 60,
//        alignment: Alignment.center,
//        decoration: BoxDecoration(
//          color: Colors.white,
//          borderRadius: BorderRadius.only(
//            bottomLeft: Radius.circular(10),
//            bottomRight: Radius.circular(10)
//          )
//        ),
//        child: Text(
//          'No selected Number',
//          style: TextStyle(
//              fontSize: 12,
//              color: Color(0xFF848383)
//          ),
//        ),
//      );
//    }
//    else{
//      return Container(
////        width: 358,
////        height: 130,
//          child: Container(
//            width: double.infinity,
//            decoration: BoxDecoration(
//                color: Colors.white,
//                borderRadius: BorderRadius.only(
//                    bottomLeft: Radius.circular(10),
//                    bottomRight: Radius.circular(10)
//                )
//            ),
//            child: Column(
//              children: <Widget>[
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  mainAxisSize: MainAxisSize.max,
//                  children: <Widget>[
//                    Container(
//                        width: 20,
//                        height: 15,
//                        margin: EdgeInsets.only(left: 12,top: 16,right: 0),
//                        child: Align(
//                          alignment: Alignment.centerLeft,
//                          child: Text('NO',style: TextStyle(fontSize: 12,color: Color(0xFF848383),fontFamily: 'Futura')),
//                        )
//                    ),
//                    Container(
//                        width: 49,
//                        height: 15,
//                        margin: EdgeInsets.only(top: 16,right: 28,left: 0),
//                        child: Align(
//                          alignment: Alignment.center,
//                          child: Text('NUMBER',style: TextStyle(fontSize: 12,color: Color(0xFF848383),fontFamily: 'Futura')),
//                        )
//                    ),
//                    Container(
//                        width: 54,
//                        height: 15,
//                        margin: EdgeInsets.only(top: 16,left: 0,right: 15),
//                        child: Align(
//                          alignment: Alignment.centerRight,
//                          child: Text('AMOUNT',style: TextStyle(fontSize: 12,color: Color(0xFF848383),fontFamily: 'Futura')),
//                        )
//                    )
//                  ],
//                ),
//                Container(
//                  //height: 150,
//                  margin: EdgeInsets.only(bottom: 15),
//                  child: ListView.builder(
//                    shrinkWrap: true,
//                    physics: NeverScrollableScrollPhysics(), //disable scroll
//                    itemBuilder: (context,index){
//                      return Container(
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: <Widget>[
//                            Container(
//                                width: 18,
//                                height: 18,
//                                margin: EdgeInsets.only(left: 15,top: 16,right: 0),
//                                child: Align(
//                                  alignment: Alignment.centerLeft,
//                                  child: Text((index + 1).toString(),style: TextStyle(fontSize: 15)),
//                                )
//                            ),
//                            Container(
//                                width: 18,
//                                height: 18,
//                                margin: EdgeInsets.only(top: 16,right: 15,left: 0),
//                                child: Align(
//                                  alignment: Alignment.center,
//                                  child: Text(
//                                    _lotteries[index].getPickedNumber,
//                                    style: TextStyle(fontSize: 15),
//                                  ),
//                                )
//                            ),
//                            Container(
//                              child: Row(
//                                children: <Widget>[
//                                  Container(
//                                    //width: 48,
//                                    height: 18,
//                                    margin: EdgeInsets.only(top: 16,left: 0,right: 5),
//                                    child: Text(
//                                      _lotteries[index].getAmount.toString() + ' SRY',
//                                      style: TextStyle(fontSize: 15)
//                                    ),
//                                  ),
//                                  Container(
//                                      width: 14,
//                                      height: 14,
//                                      margin: EdgeInsets.only(top: 15,left: 0,right: 12),
//                                      decoration: BoxDecoration(
//                                        color: Color(0xFFF9A825),
//                                        borderRadius: BorderRadius.circular(50),
//                                      ),
//                                      child: Tooltip(
//                                        message: 'Decrement',
//                                        preferBelow: false,
//                                        child: InkWell(
//                                          onTap: (){
////                                            setState(() {
////                                              _lotteries.removeAt(index);
////                                            });
////                                            if(_twoDigits.length == 0){
////                                              setState(() {
////                                                _isAdded = false;
////                                              });
////                                              //clearController();
////                                            }
//                                          },
//                                          child: Icon(
//                                              const IconData(0xe15b, fontFamily: 'MaterialIcons'),
//                                              color: Colors.white,size: 15),
//                                          borderRadius: BorderRadius.circular(50),
//                                        ),
//                                      )
//                                  ),
//                                ],
//                              ),
//                            )
//                          ],
//                        ),
//                      );
//                    },
//                    itemCount: _lotteries.length,
//                  ),
//                ),
//                Divider(height: 5,color: Colors.grey),
//                Container(
//                  height: 50,
//                  margin: EdgeInsets.only(left: 24),
//                  child: Align(
//                    alignment: Alignment.centerLeft,
//                    child: Text(
//                      'Total: SRY',
//                      style: TextStyle(
//                          fontSize: 17
//                      ),
//                    ),
//                  ),
//                )
//              ],
//            ),
//          )
//      );
//    }
//  }
}