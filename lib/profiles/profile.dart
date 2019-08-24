import 'package:flutter/material.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget{
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> with SingleTickerProviderStateMixin{

  List<Tab> _tabs = [
    Tab(text: 'IN'),
    Tab(text: 'OUT')
  ];

  TabController _tabController;
  List<Widget> _contentTabs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: _tabs.length, vsync: this,initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        //elevation: 0,
//        title: SizedBox(
//          width: 66,
//          height: 17,
//          child: Text(
//            'Account',
//            style: TextStyle(
//              fontWeight: FontWeight.w900,
//              fontSize: 17,
//              fontFamily: 'Futura'
//            ),
//          ),
//        ),
//        centerTitle: true,
//        leading: Container(
//          width: 50,
//          height: 50,
//          child: InkWell(
//            child: Icon(
//              Icons.arrow_back,
//              color: Color(0xFFF9A825),
//              size: 27.38
//            ),
//            borderRadius: BorderRadius.circular(50),
//            onTap: (){
//              Navigator.of(context).pop();
//            },
//          )
//        ),
//      ),
//      body: NestedScrollView(
//        headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
//          return <Widget>[
//            SliverOverlapAbsorber(
//              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//              child: SliverAppBar()
//            )
//          ];
//        },
//        body: Container(
//          child: Text('sssssssssss'),
//        ),
//      )
//    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 320,
                forceElevated: innerBoxIsScrolled,
                //pinned: true,
                //floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 272,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          //color: Colors.red
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'Naruto Uzumaki',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Futura'
                                ),
                              ),
                              margin: EdgeInsets.only(top: 10),
                            ),
                            Container(
                              width: 156,
                              height: 16,
                              child: Text(
                                'Phnom Penh, Cambodia',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Futura',
                                    color: Color(0xFFB1B1B1)
                                ),
                              ),
                            ),
                            Container(
                                width: 100,
                                height: 100,
                                margin: EdgeInsets.only(top: 10),
                                child: CircleAvatar(
                                  child: Image(image: AssetImage('assets/images/twitch_avatar.png')),
                                )
                            ),
                            Container(
                              width: 50,
                              height: 16,
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                'Balance',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Futura',
                                    color: Color(0xFFB1B1B1)
                                ),
                              ),
                            ),
                            Container(
                              //width: 116,
                              height: 26,
                              child: Text(
                                '20.943 SRY',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: 'Futura',
                                    color: Color(0xFF49B55A),
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                              width: 69,
                              height: 30,
                              margin: EdgeInsets.only(top: 16),
                              child: FlatButton(
                                onPressed: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => EditProfileScreen())
                                  );
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusDirectional.circular(25)
                                ),
                                color: Color(0xFFF9A825),
                                child: Text(
                                  'EDIT',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Futura',
                                      fontSize: 17,
                                      color: Colors.white
                                  ),
                                ),
                              )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: TabBar(
                  controller: _tabController,
                  tabs: _tabs,
                )
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: _tabs.map((Tab tab){
            if(tab.text == 'IN'){
              return _tabIn();
            }
            else{
              return _tabOut();
            }
          }).toList(),
        )
      ),
    );
  }

  Widget _body(){
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 272,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  'Naruto Uzumaki',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Futura'
                  ),
                ),
                margin: EdgeInsets.only(top: 10),
              ),
              Container(
                width: 156,
                height: 16,
                child: Text(
                  'Phnom Penh, Cambodia',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Futura',
                    color: Color(0xFFB1B1B1)
                  ),
                ),
              ),
              Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 10),
                  child: CircleAvatar(
                    child: Image(image: AssetImage('assets/images/twitch_avatar.png')),
                  )
              ),
              Container(
                width: 50,
                height: 16,
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Balance',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Futura',
                    color: Color(0xFFB1B1B1)
                  ),
                ),
              ),
              Container(
                //width: 116,
                height: 26,
                child: Text(
                  '20.943 SRY',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Futura',
                      color: Color(0xFF49B55A),
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                  width: 69,
                  height: 30,
                  margin: EdgeInsets.only(top: 16),
                  child: FlatButton(
                    onPressed: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => EditProfileScreen())
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(25)
                    ),
                    color: Color(0xFFF9A825),
                    child: Text(
                      'EDIT',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Futura',
                          fontSize: 17,
                          color: Colors.white
                      ),
                    ),
                  )
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 50,
          padding: EdgeInsets.only(top: 14),
          child: TabBar(
            controller: _tabController,
            tabs: _tabs,
            indicatorColor: Colors.black,
            indicatorWeight: 2,
            onTap: (index){

            },
          ),
        ),
        Container(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              controller: _tabController,
              children: _tabs.map((Tab tab){
                if(tab.text == 'IN'){
                  return SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 58,
                            padding: EdgeInsets.only(top: 36,left: 16),
                            color: Color(0xFFF8F8F8),
                            child: Text(
                              '29/06/2019',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF707070)
                              ),
                            ),
                          ),
                          _tabIn()
                        ],
                      ),
                    ),
                  );
                }
                else{
                  return SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 58,
                          padding: EdgeInsets.only(top: 36,left: 16),
                          color: Color(0xFFF8F8F8),
                          child: Text(
                            '29/06/2019',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF707070)
                            ),
                          ),
                        ),
                        _tabOut()
                      ],
                    ),
                  );
                }
              }).toList(),
            )
        ),
      ],
    );
  }

  Widget _tabIn(){
    return Container(
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (context,index){
          return Divider(height: 5);
        },
        itemBuilder: (context,index){
          return Container(
            height: 72,
            alignment: Alignment.center,
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFFFD54F)
                ),
                child: Icon(
                  Icons.compare_arrows,color: Colors.white,
                ),
              ),
              title: Text(
                'Transfer between SEREY account',
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Futura',
                  color: Color(0xFF707070)
                ),
              ),
              trailing: Container(
                child: Text(
                  '30 SRY',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Futura',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00BF83)
                  ),
                ),
              )
            ),
          );
        },
        itemCount: 2,
      ),
    );
  }

  Widget _tabOut(){
    return Container(
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (context,index){
          return Divider(height: 5);
        },
        itemBuilder: (context,index){
          return Container(
            height: 72,
            alignment: Alignment.center,
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFFFFD54F)
                ),
                child: Icon(
                  Icons.compare_arrows,color: Colors.white,
                ),
              ),
              title: Text(
                'Transfer between SEREY account',
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Futura',
                  color: Color(0xFF707070)
                ),
              ),
              trailing: Container(
                child: Text(
                  '30 SRY',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Futura',
                    fontWeight: FontWeight.bold,
                    color: Colors.red
                  ),
                ),
              )
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }

}