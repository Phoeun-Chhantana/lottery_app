import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WinningHistory extends StatefulWidget{
  _WinningHistory createState() => _WinningHistory();
}

class _WinningHistory extends State<WinningHistory>{
  
  bool _isCheckResult = false;
  String _dropDownValue = 'TODAY';
  String _currentDate = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _currentDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    _isCheckResult = ModalRoute.of(context).settings.arguments; //retrieve
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: SizedBox(
          width: 138,
          child: Text(
            'Winning History',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 17,
              fontFamily: 'Futura'
            ),
          ),
        ),
        centerTitle: true,
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
              Navigator.of(context).pop();
            },
          )
        ),
        bottom: PreferredSize(
          preferredSize: Size(0, 55),
          child: _dropDownWidget()
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          itemBuilder: (context,index){
            return Column(
              children: <Widget>[
                _topContainer(index + 1),
                Container(
                  margin: EdgeInsets.only(left: 28,right: 28,bottom: 16),
                  height: 146,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 12,left: 24),
                            child: Text(
                              'GAME'
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 12,right: 48),
                            child: Text(
                              'RESULT'
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 12,left: 24),
                            child: Text(
                              '2D',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Futura',
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 12,right: 48),
                            child: Text(
                              '22,42',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Futura',
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 12,left: 24),
                            child: Text(
                              '3D',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Futura',
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 12,right: 48),
                            child: Text(
                              '422,142',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Futura',
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 12,left: 24),
                            child: Text(
                              '4D',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Futura',
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 12,right: 48),
                            child: Text(
                              '1422,8142',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Futura',
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          itemCount: 5,
        ),
      ),
    );
  }

  Widget _dropDownWidget(){
    return DropdownButton<String>(
      value: _isCheckResult ? _currentDate : _dropDownValue,
      onChanged: (String newVal){
        setState(() {
          _dropDownValue = newVal;
        });
      },
      iconEnabledColor: Color(0xFFF9A825),
      iconSize: 30,
      style: TextStyle(
        fontSize: 17,
        fontFamily: 'Futura',
        fontWeight: FontWeight.bold,
        color: Color(0xFF623D00)
      ),
      elevation: 0,
      items: _dropDownItem.map<DropdownMenuItem<String>>((String value){
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList()
    );
  }

  List<String> get _dropDownItem{
    if(_isCheckResult){
      return [_currentDate];
    }
    else{
      return ['TODAY','YESTERDAY'];
    }
  }

  Widget _topContainer(int index){
    return Container(
      child: Container(
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.only(top: 16, left: 28,right: 28),
        child: Column(
          children: <Widget>[
            Container(
              width: 358,
              height: 50,
              //margin: EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                color: Color(0xFF1A28B2F0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 24),
                    child: Text(
                      '28/02/2019',
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFF623D00),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 24),
                    child: Text(
                      'Round $index',
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFF623D00),
                        fontWeight: FontWeight.bold
                      ),
                    ),
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