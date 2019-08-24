import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:lottery_app/model/lottery_model.dart';
import 'package:toast/toast.dart';
import 'package:provider/provider.dart';
import 'winning_history.dart';

class MyLotteryScreen extends StatefulWidget{

  _MyLotteryScreen createState() => _MyLotteryScreen();
}

class _MyLotteryScreen extends State<MyLotteryScreen> with SingleTickerProviderStateMixin{

  List<Tab> _tabs = [
    Tab(text: 'Pending'.toUpperCase()),
    Tab(text: 'Finshed'.toUpperCase())
  ];

  TabController _tabController;
  final String _text = 'Show Detail';
  List<String> _texts = [];

  List<List<LotteryModel>> _lotteries = [
    [new TwoDigitModel(2, 2, 10)],
    [new TwoDigitModel(6, 2, 20),new TwoDigitModel(1, 2, 60)],
    [new TwoDigitModel(7, 1, 20),new TwoDigitModel(3, 3, 60),new TwoDigitModel(9, 8, 200)],
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: _tabs.length, vsync: this);

    addText(_lotteries.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 90,
          child: Text(
            'My Lottery',
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
          preferredSize: Size(0,65),
          child: TabBar(
            controller: _tabController,
            tabs: _tabs,
            indicatorColor: Colors.transparent,
            labelColor: Color(0xFFF9A825),
            labelStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
            unselectedLabelColor: Color(0xFFB1B1B1),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: TabBarView(
          controller: _tabController,
          children: _tabs.map((Tab tab){
            if(tab.text == 'Pending'.toUpperCase()){
              return ListView.builder(
                itemBuilder: (context,index){
                  return Column(
                    children: <Widget>[
                      _topContainer(),
                      _texts[index] == 'Show Less' ? _showDetail(_lotteries[index]) : _showLess(_lotteries[index]),
                      Container(
                          height: 50,
                          margin: EdgeInsets.only(left: 28,right: 28,bottom: 16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 24),
                                child: Text(
                                  _texts[index] == 'Show Less' ? 'Total: ' + _calculateTotal(_lotteries[index]).toString() + ' SRY' : '',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Futura',
                                    color: Color(0xFF623D00),
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                              GestureDetector(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  margin: EdgeInsets.only(right: 24),
                                  child: Text(
                                    _texts[index],
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Futura',
                                        color: Color(0xFFB1B1B1)
                                    ),
                                  ),
                                ),
                                onTap: (){
                                  if(_texts[index] == 'Show Detail'){
                                    setState(() {
                                      _texts[index] = 'Show Less';
                                    });
                                  }
                                  else{
                                    setState(() {
                                      _texts[index] = 'Show Detail';
                                    });
                                  }
                                },
                              )
                            ],
                          )
                      ),
                    ],
                  );
                },
                itemCount: _lotteries.length,
              );
            }
            else{
              return ListView.builder(
                itemBuilder: (context,index){
                  return Column(
                    children: <Widget>[
                      _topContainer(),
                      _texts[index] == 'Show Less' ? _showDetail(_lotteries[index]) : _showLess(_lotteries[index]),
                      Container(
                          height: 50,
                          margin: EdgeInsets.only(left: 28,right: 28,bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 24),
                                child: _texts[index] == 'Show Detail' ? checkResult : Container()
                              ),
                              GestureDetector(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  margin: EdgeInsets.only(right: 24),
                                  child: Text(
                                    _texts[index],
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Futura',
                                      color: Color(0xFFB1B1B1)
                                    ),
                                  ),
                                ),
                                onTap: (){
                                  if(_texts[index] == 'Show Detail'){
                                    setState(() {
                                      _texts[index] = 'Show Less';
                                    });
                                  }
                                  else{
                                    setState(() {
                                      _texts[index] = 'Show Detail';
                                    });
                                  }
                                },
                              )
                            ],
                          )
                      ),
                    ],
                  );
                },
                itemCount: _lotteries.length,
              );
            }
          }).toList(),
        )
      )
    );
  }

  void addText(int length){
    for(int i=0;i<length;i++){
      _texts.insert(i, _text);
    }
  }

  int _calculateTotal(List<LotteryModel> lotteries){
    int _total = 0;
    for(LotteryModel lottery in lotteries){
      _total += lottery.getAmount;
    }
    return _total;
  }

  Widget get checkResult{
    return Container(
      child: GestureDetector(
        child: Text(
          'Check Result',
          style: TextStyle(
            fontSize: 17,
            fontFamily: 'Futura',
            color: Color(0xFF623D00),
            fontWeight: FontWeight.w500
          ),
        ),
        onTap: (){
          Navigator.pushNamed(context,'/winning',arguments: true);
        },
      ),
    );
  }

  Widget _showLess(List<LotteryModel> lotteries){
    return Column(
      children: <Widget>[
        Container(
        width: 358,
        //height: 130,
        margin: EdgeInsets.only(left: 28,right: 28),
        padding: EdgeInsets.only(bottom: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
          ),
        ),
        child: Container(
          child: Column(
            //alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  child: Text(
                    lotteries.length.toString(),
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  margin: EdgeInsets.only(top: 7),
                ),
                Container(
                  child: Text(
                    'numbers',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFFB1B1B1)
                    ),
                  ),
                  //margin: EdgeInsets.only(top: 34),
                ),
                Container(
                  child: Text(
                    'Total: ' + _calculateTotal(lotteries).toString() + ' SRY',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  //margin: EdgeInsets.only(top: 54),
                ),
              ]
            ),
          )
        ),
      ],
    );
  }

  Widget _showDetail(List<LotteryModel> lotteries) {
    return Container(
      margin: EdgeInsets.only(left: 28,right: 28),
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
                  margin: EdgeInsets.only(top: 16,right: 30,left: 0),
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
                            margin: EdgeInsets.only(top: 16,right: 28,left: 0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                lotteries[index].getPickedNumber,
                                style: TextStyle(fontSize: 15),
                              ),
                            )
                          ),
                          Container(
                            child: Container(
                              //width: 48,
                              height: 18,
                              margin: EdgeInsets.only(top: 16,left: 0,right: 28),
                              child: Text(
                               lotteries[index].getAmount.toString() + ' SRY',
                                style: TextStyle(fontSize: 15)
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                itemCount: lotteries.length
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _topContainer(){
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
                color: Color(0xFFF9A825),
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
                      'Round 1',
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

//  Widget _contentContainer(bool isDetail) {
//    return Container(
//      margin: EdgeInsets.only(left: 28,right: 28),
//      child: isDetail ? _showDetail() : _showLess(),
//    );
//  }
}