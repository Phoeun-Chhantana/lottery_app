import 'package:flutter/material.dart';
import 'two_digit.dart';
import 'three_digit.dart';
import 'four_digit.dart';

class GameScreen extends StatefulWidget{
  int tabIndex = 0;
  GameScreen({@required this.tabIndex});

  _GameScreen createState() => _GameScreen();
}
class _GameScreen extends State<GameScreen> with SingleTickerProviderStateMixin{

  List<Tab> _tabs = [
    Tab(text: '2-Digit'),
    Tab(text: '3-Digit'),
    Tab(text: '4-Digit'),
  ];

  TabController _tabController;
  GlobalKey<ScaffoldState> _scaffoldKey;

  TwoDigitScreen _twoDigitScreen;
  ThreeDigitScreen _threeDigitScreen;
  FourthDigitScreen _fourthDigitScreen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
      initialIndex: super.widget.tabIndex
    );

    _scaffoldKey = GlobalKey();
    _twoDigitScreen = new TwoDigitScreen();
    _threeDigitScreen = new ThreeDigitScreen();
    _fourthDigitScreen = new FourthDigitScreen();
  }



  @override
  void dispose(){
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
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
                Navigator.of(context).pop();
             },
           )
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
        bottom: PreferredSize(
          preferredSize: Size(0, 85),
          child: Container(
            padding: EdgeInsets.only(left: 30,right: 30),
            child: TabBar(
              controller: _tabController,
              tabs: _tabs,
              indicatorColor: Color(0xFFF9A825),
              indicatorWeight: 5,
              labelColor: Color(0xFFF9A825),
              unselectedLabelColor: Color(0xFFB1B1B1),
              labelStyle: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500
              ),
              onTap: (index){

              },
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((Tab tab){
          if(tab.text == "2-Digit"){
            return _twoDigitScreen;
          }
          else if(tab.text == "3-Digit"){
            return _threeDigitScreen;
          }
          else return _fourthDigitScreen;
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.help),
        backgroundColor: Color(0xFFF9A825),
      ),
    );
  }
}