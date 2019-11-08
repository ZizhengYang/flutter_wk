import 'package:flutter/material.dart';
import './Task/CategoryTask.dart';
import './Task/EasyMoneyTask.dart';
import './Task/HotTask.dart';
import './Task/RecommendationTask.dart';

class UserTaskPage extends StatelessWidget {

  TextEditingController _searchBoxContronller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 4,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "waikuaiInfo",
        home: new Scaffold(
          /*
         * Page main part
         * 页面主要内容
         */
          appBar: new PreferredSize(
            preferredSize: Size(1000,120),
            child: new AppBar(
              backgroundColor: Colors.black,
              title: Container(
                  alignment: Alignment.topCenter,
                  child: new Column(
                      children: <Widget>[
                        new Text(
                          "外快信息",
                          style: new TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.yellow[700],
                              decoration: TextDecoration.none
                          ),
                        ),
//                        new Container(
//                          child: new FlatButton(
//                            onPressed: () {},
//                            child: new TextField(
//                              maxLines: 1,
//                              controller: _searchBoxContronller,
//                              style: new TextStyle(
//                                fontSize: 16.0,
//                              ),
//                              decoration: new InputDecoration(
//                                  hintText: "搜索外快",
//                                  contentPadding: EdgeInsets.all(6),
//                                  border: InputBorder.none
//                              ),
//                            ),
//                          ),
//                        )
                      ],
                  )
              ),
              flexibleSpace: Container(
                child: new FlatButton(
                  onPressed: () {},
                  child: new TextField(
                    maxLines: 1,
                    controller: _searchBoxContronller,
                    style: new TextStyle(
                      fontSize: 16.0,
                    ),
                    decoration: new InputDecoration(
                      hintText: "搜索外快",
                      contentPadding: EdgeInsets.all(6),
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
              bottom: new TabBar(
                indicatorWeight: 5,
                indicatorPadding: EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 0),
                indicatorColor: Colors.yellow[700],
                labelColor: Colors.yellow[700],
                unselectedLabelColor: Colors.grey,
                tabs: <Widget>[
                  new Tab(
                    text: "推荐",
                    icon: new Icon(Icons.thumb_up, size: 20),
                  ),
                  new Tab(
                    text: "热门",
                    icon: new Icon(Icons.whatshot, size: 20),
                  ),
                  new Tab(
                    text: "快赚",
                    icon: new Icon(Icons.fast_forward, size: 20),
                  ),
                  new Tab(
                    text: "分类",
                    icon: new Icon(Icons.grid_on, size: 20),
                  )
                ],
              ),
            )
          ),
          body: new TabBarView(
            children: <Widget>[
              new CategoryTask(),
              new EasyMoneyTask(),
              new HotTask(),
              new RecommendationTask()
            ],
          ),
        ),
      )
    );
  }

}

//class UserTaskAppBar extends StatefulWidget implements PreferredSizeWidget {
//
//  final double height;
//  final double elevation;
//  final Widget text;
//
//  const UserTaskAppBar(
//      {Key key,
//        this.height: 46.0,
//        this.elevation: 0.5,
//        this.text: null,
//      }
//  ) : super(key: key);
//
//  @override
//  State<StatefulWidget> createState() => new UserTaskAppBarState();
//
//  @override
//  // TODO: implement preferredSize
//  Size get preferredSize => Size.fromHeight(height);//这里设置控件（appBar）的高度
//
//}
//
//class UserTaskAppBarState extends State<UserTaskAppBar> {
//
//  @override
//  Widget build(BuildContext context) {
//
//  }
//
//}
//
//class UserTaskBody extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//
//  }
//
//}

//new Column(
//children: <Widget>[
///*
//               * Upper part:
//               * 上部分页面:
//               * Page name 页面名称
//               * Search box 搜索框
//               * Top bar 上选框
//               */
//new Column(
//children: <Widget>[
//new Container(
//color: Colors.black,
//alignment: Alignment.topCenter,
//padding: EdgeInsets.only(top: 30, left: 5, right: 5, bottom: 5),
//child: new Text(
//"外快信息",
//style: new TextStyle(
//fontSize: 30.0,
//fontWeight: FontWeight.w900,
//color: Colors.yellow[700],
//decoration: TextDecoration.none
//),
//),
//),
//new Container(
//color: Colors.black,
//alignment: Alignment.topCenter,
//padding: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
//child: new Card(
//child: new Row(
//children: <Widget>[
//new SizedBox(width: 5.0),
//new Icon(Icons.search, color: Colors.grey),
//Expanded(
//child: new TextField(
//maxLines: 1,
//controller: _searchBoxContronller,
//style: new TextStyle(
//fontSize: 16.0,
//),
//decoration: new InputDecoration(
//hintText: "搜索外快",
//contentPadding: EdgeInsets.all(6),
//border: InputBorder.none
//),
//),
//),
//new IconButton(icon: new Icon(Icons.cancel), onPressed: () {_searchBoxContronller.clear();}, color: Colors.grey)
//],
//),
//),
//),
//new Container(
//color: Colors.black,
//child: new TabBar(
//tabs: <Widget>[
//new Tab(
//text: "推荐",
//icon: new Icon(Icons.thumb_up),
//),
//new Tab(
//text: "热门",
//icon: new Icon(Icons.whatshot),
//),
//new Tab(
//text: "快赚",
//icon: new Icon(Icons.fast_forward),
//),
//new Tab(
//text: "分类",
//icon: new Icon(Icons.grid_on),
//)
//],
//),
//),
//],
//),
///*
//             * Middle part:
//             * 中部分页面:
//             * Select view 筛选外块
//             * Sort button 外快排序
//             * List view 外快表单
//             */
//new Column(
//children: <Widget>[
//new TabBarView(
//children: <Widget>[
//new CategoryTask(),
//new EasyMoneyTask(),
//new HotTask(),
//new RecommendationTask()
//]
//)
//],
//)
//],
//),