import 'package:flutter/material.dart';
import './UserSide/UserTaskPage.dart';
import './UserSide/SkillInfoPage.dart';


class MainNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainNavigationBarState();
}

class MainNavigationBarState extends State<MainNavigationBar> with TickerProviderStateMixin {
  PageController _pageController;
  int _currentPageNum;

  @override
  void initState() {
    super.initState();
    _currentPageNum = 1;
    _pageController = new PageController(initialPage: this._currentPageNum);
//    pageController  = TabController(vsync: this, length: 5);
  }

  void onPageChanged(int currentPageNum) {
    setState(() {
      this._currentPageNum = currentPageNum;
    });
  }

  void onTap(int index) {
    _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease
    );
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: new PageView(
          children: <Widget>[
            new UserTaskPage(),
            new SkillInfoPage(),
            new UserTaskPage(),
            new UserTaskPage(),
            new UserTaskPage()
          ],
          controller: _pageController,
          onPageChanged: onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: new Icon(Icons.attach_money), title: Text("外快")),
            BottomNavigationBarItem(icon: new Icon(Icons.build), title: Text("技能")),
            BottomNavigationBarItem(icon: new Icon(Icons.work), title: Text("工作台")),
            BottomNavigationBarItem(icon: new Icon(Icons.chat), title: Text("社区")),
            BottomNavigationBarItem(icon: new Icon(Icons.person), title: Text("我的"))
          ],
          selectedItemColor: Colors.yellow[700],
          unselectedItemColor: Colors.grey[600],
          showUnselectedLabels: true,
          onTap: onTap,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentPageNum,
        ),
      ),
//      home: new Scaffold(
//        body: new TabBarView(controller: controller, children: <Widget>[
//          new UserTaskPage(),
//          new UserTaskPage(),
//          new UserTaskPage(),
//          new UserTaskPage(),
//          new UserTaskPage()
//        ]),
//        bottomNavigationBar: BottomNavigationBar(
//            items: <BottomNavigationBarItem>[
//              BottomNavigationBarItem(icon: new Icon(Icons.attach_money), title: Text("外快")),
//              BottomNavigationBarItem(icon: new Icon(Icons.build), title: Text("技能")),
//              BottomNavigationBarItem(icon: new Icon(Icons.work), title: Text("工作台")),
//              BottomNavigationBarItem(icon: new Icon(Icons.chat), title: Text("社区")),
//              BottomNavigationBarItem(icon: new Icon(Icons.person), title: Text("我的"))
//            ],
//            //fixedColor: Colors.blue,
//            backgroundColor: Colors.blue,
//            selectedItemColor: Colors.blue,
//        ),
//        bottomNavigationBar: new SizedBox(
//          height: 50,
//          child: new Material(
//            color: Colors.blue,
//            child: new TabBar(
//              controller: controller,
//              labelStyle: TextStyle(fontSize: 10),
//              unselectedLabelStyle: TextStyle(fontSize: 0),
//              tabs: <Tab>[
//                new Tab(icon: new Icon(Icons.attach_money), text: "外快"),
//                new Tab(icon: new Icon(Icons.build), text: "技能"),
//                new Tab(icon: new Icon(Icons.work), text: "工作台"),
//                new Tab(icon: new Icon(Icons.chat), text: "社区"),
//                new Tab(icon: new Icon(Icons.person), text: "我的"),
//              ],
//            ),
//          ),
//        ),
//      ),
    );
  }
}