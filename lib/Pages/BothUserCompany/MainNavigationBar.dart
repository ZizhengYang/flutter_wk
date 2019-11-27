import 'package:flutter/material.dart';
import '../UserSide/UserTaskPage.dart';
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
    _currentPageNum = 1;
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
    );
  }
}