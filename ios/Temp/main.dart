import 'package:flutter/material.dart';
//void main() => runApp(new BottomNavigationWidget());

//class Main extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//
//    );
//  }
//}

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> with TickerProviderStateMixin {
  TabController controller;
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
//    list
//      ..add(ProjectPage())
//      ..add(ProjectPage())
//      ..add(ProjectPage())
//      ..add(ProjectPage());
    super.initState();
    controller  = TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: new TabBarView(controller: controller, children: <Widget>[
//          new ProjectPage(),
//          new ProjectPage(),
//          new ProjectPage(),
//          new ProjectPage(),
//          new ProjectPage()
        ]),
        bottomNavigationBar: new SizedBox(
          height: 50,
          child: new Material(
            color: Colors.blue,
            child: new TabBar(
              controller: controller,
              labelStyle: TextStyle(fontSize: 10),
              unselectedLabelStyle: TextStyle(fontSize: 0),
              tabs: <Tab>[
                new Tab(icon: new Icon(Icons.attach_money, size: 10), text: "外快"),
                new Tab(icon: new Icon(Icons.build, size: 10), text: "技能"),
                new Tab(icon: new Icon(Icons.work, size: 10), text: "工作台"),
                new Tab(icon: new Icon(Icons.chat, size: 10), text: "社区"),
                new Tab(icon: new Icon(Icons.person, size: 10), text: "我的"),
              ],
//            new Tab(
//              text: "HOME",
//              icon: Icon(Icons.home)
//            ),
//            new Tab(
//                text: "Email",
//                icon: Icon(Icons.email)
//            ),
//            new Tab(
//                text: "PAGES",
//                icon: Icon(Icons.pages)
//            ),
//            new Tab(
//                text: "AIRPLAY",
//                icon: Icon(Icons.airplay)
//            ),
//            new Tab(
//                icon: Icon(
//                  Icons.home,
//                  color: _bottomNavigationColor,
//                ),
//                text: 'HOME'
//            new Tab(
//                icon: Icon(
//                  Icons.email,
//                  color: _bottomNavigationColor,
//                ),
//                title: Text(
//                  'Email',
//                  style: TextStyle(color: _bottomNavigationColor),
//                )),
//            new Tab(
//                icon: Icon(
//                  Icons.pages,
//                  color: _bottomNavigationColor,
//                ),
//                title: Text(
//                  'PAGES',
//                  style: TextStyle(color: _bottomNavigationColor),
//                )),
//            new Tab(
//                icon: Icon(
//                  Icons.airplay,
//                  color: _bottomNavigationColor,
//                ),
//                title: Text(
//                  'AIRPLAY',
//                  style: TextStyle(color: _bottomNavigationColor),
//                )),
//          ],

            ),
          ),
        ),
      ),
    );
  }
}