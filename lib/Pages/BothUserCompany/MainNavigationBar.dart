import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_wai_kuai/Pages/UserSide/CommunityPage.dart';
import 'package:test_wai_kuai/Pages/UserSide/UserTaskPage.dart';
import '../../Examples/UserTaskPage.dart';
import '../UserSide/SkillInfoPage.dart';


class MainNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainNavigationBar_State();
}

class _MainNavigationBar_State extends State<MainNavigationBar> with TickerProviderStateMixin {
  PageController _pageController;
  int _currentPageNum;

  @override
  void initState() {
    super.initState();
    _currentPageNum = 0;
    _pageController = new PageController(initialPage: this._currentPageNum);
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
      home: new Scaffold(
        body: new PageView(
          children: <Widget>[
            new UserTaskPage(),
            new SkillInfoPage(),
            new UserTaskPage(),
            new CommunityPage(),
            new UserTaskPage()
          ],
          controller: _pageController,
          onPageChanged: onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: FFNavigationBar(
          theme: FFNavigationBarTheme(
            selectedItemTextStyle: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            unselectedItemTextStyle: new TextStyle(fontSize: 14),
            barHeight: 66,
            itemWidth: 55,
            barBackgroundColor: Colors.white,
            selectedItemBorderColor: Color.fromARGB(255, 248, 130, 0),
            selectedItemBackgroundColor: Colors.yellow,
            selectedItemIconColor: Color(0xFF2D3447),
            selectedItemLabelColor: Color(0xFF2D3447),
          ),
          selectedIndex: this._currentPageNum,
          onSelectTab: onTap,
          items: [
            FFNavigationBarItem(
              iconData: Icons.attach_money,
              label: '外快',
            ),
            FFNavigationBarItem(
              iconData: Icons.build,
              label: '技能',
            ),
            FFNavigationBarItem(
              iconData: Icons.work,
              label: '工作台',
            ),
            FFNavigationBarItem(
              iconData: Icons.chat,
              label: '社区',
            ),
            FFNavigationBarItem(
              iconData: Icons.person,
              label: '我的',
            ),
          ],
        ),
      ),
    );
  }
}

//class MainNavigationBar extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() => _MainNavigationBar_State();
//}
//
//class _MainNavigationBar_State extends State<MainNavigationBar> with TickerProviderStateMixin {
//  PageController _pageController;
//  int _currentPageNum;
//
//  @override
//  void initState() {
//    super.initState();
//    _currentPageNum = 1;
//    _pageController = new PageController(initialPage: this._currentPageNum);
//  }
//
//  void onPageChanged(int currentPageNum) {
//    setState(() {
//      this._currentPageNum = currentPageNum;
//    });
//  }
//
//  void onTap(int index) {
//    _pageController.animateToPage(
//        index,
//        duration: const Duration(milliseconds: 300),
//        curve: Curves.ease
//    );
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      // Remove the debug banner
//      debugShowCheckedModeBanner: false,
//      home: Scaffold(
//        body: new PageView(
//          children: <Widget>[
//            new UserTaskPage(),
//            new SkillInfoPage(),
//            new UserTaskPage(),
//            new CommunityPage(),
//            new UserTaskPage()
//          ],
//          controller: _pageController,
//          onPageChanged: onPageChanged,
//          physics: NeverScrollableScrollPhysics(),
//        ),
//        bottomNavigationBar: BubbledNavigationBar(
//          defaultBubbleColor: Colors.blue,
//          onTap: onTap,
//          items: <BubbledNavigationBarItem>[
//            BubbledNavigationBarItem(
//              icon:       Icon(LineIcons.money, size: 30, color: Colors.red),
//              activeIcon: Icon(LineIcons.money, size: 30, color: Colors.white),
//              title: Text('外快', style: TextStyle(color: Colors.white, fontSize: 12),),
//            ),
//            BubbledNavigationBarItem(
//              icon:       Icon(LineIcons.wrench, size: 30, color: Colors.red),
//              activeIcon: Icon(LineIcons.wrench, size: 30, color: Colors.white),
//              title: Text('技能', style: TextStyle(color: Colors.white, fontSize: 12),),
//            ),
//            BubbledNavigationBarItem(
//              icon:       Icon(Icons.work, size: 30, color: Colors.red),
//              activeIcon: Icon(Icons.work, size: 30, color: Colors.white),
//              title: Text('工作台', style: TextStyle(color: Colors.white, fontSize: 12),),
//            ),
//            BubbledNavigationBarItem(
//              icon:       Icon(LineIcons.connectdevelop, size: 30, color: Colors.red),
//              activeIcon: Icon(LineIcons.connectdevelop, size: 30, color: Colors.white),
//              title: Text('社区', style: TextStyle(color: Colors.white, fontSize: 12),),
//            ),
//            BubbledNavigationBarItem(
//              icon:       Icon(Icons.person, size: 30, color: Colors.red),
//              activeIcon: Icon(Icons.person, size: 30, color: Colors.white),
//              title: Text('我的', style: TextStyle(color: Colors.white, fontSize: 12),),
//            ),
//            BottomNavigationBarItem(icon: new Icon(Icons.attach_money), title: Text("外快")),
//            BottomNavigationBarItem(icon: new Icon(Icons.build), title: Text("技能")),
//            BottomNavigationBarItem(icon: new Icon(Icons.work), title: Text("工作台")),
//            BottomNavigationBarItem(icon: new Icon(Icons.chat), title: Text("社区")),
//            BottomNavigationBarItem(icon: new Icon(Icons.person), title: Text("我的"))
//          ],
//          selectedItemColor: Color.fromARGB(255, 248, 130, 0),
//          unselectedItemColor: Color(0xFF2D3447),
//          showUnselectedLabels: true,
//          onTap: onTap,
//          type: BottomNavigationBarType.fixed,
//          currentIndex: _currentPageNum,
//        ),
//      ),
//    );
//  }
//}