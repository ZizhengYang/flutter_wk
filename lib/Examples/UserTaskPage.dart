//import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//
//import '../Pages/UserSide/Task/CategoryTask.dart';
//import '../Pages/UserSide/Task/EasyMoneyTask.dart';
//import '../Pages/UserSide/Task/HotTask.dart';
//import '../Pages/UserSide/Task/RecommendationTask.dart';
//import '../Pages/UserSide/UtilPages/QRPage.dart';
//
//class UserTaskPage2 extends StatelessWidget {
//  TextEditingController _searchBoxContronller = TextEditingController();
//
//  SelectView(IconData icon, String text, String id) {
//    return new PopupMenuItem<String>(
//        value: id,
//        child: new Row(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            new Icon(icon, color: Color(0xFF2D3447)),
//            new Text(text),
//          ],
//        )
//    );
//  }
//
//  JumpPage(Widget tar, BuildContext context) {
//    Navigator.push(
//      context,
//      new MaterialPageRoute(
//          builder: (context) => tar
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new DefaultTabController(
//      length: 4,
//      child: new Scaffold(
//        drawer: new Drawer(),
//        /*
//           * Page main part
//           * 页面主要内容
//           */
//        appBar: new PreferredSize(
//            preferredSize: Size(1000, 90),
//            child: new AppBar(
//              backgroundColor: Color(0xFF2D3447),
////                    leading: new Icon(Icons.home),
//              title: new Container(
//                width: 900,
//                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
//                child: new RaisedButton(
//                  color: Colors.white,
//                  onPressed: () {},
//                  child: new Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      new Icon(Icons.search, color: Colors.grey),
//                      new Text("搜索赚小钱",textAlign: TextAlign.start,
//                          style: TextStyle(fontSize: 16, color: Colors.grey))
//                    ],
//                  ),
//                ),
//              ),
//              actions: <Widget>[
//                new PopupMenuButton<String>(
//                  itemBuilder: (BuildContext context) =>
//                  <PopupMenuItem<String>>[
//                    this.SelectView(Icons.add_to_photos, '发起群聊', 'A'),
//                    this.SelectView(Icons.group_add, '添加服务', 'B'),
//                    this.SelectView(Icons.cast_connected, '扫一扫码', 'C'),
//                  ],
//                  onSelected: (String action) {
//                    // 点击选项的时候
//                    switch (action) {
//                      case 'A':
//                        break;
//                      case 'B':
//                        break;
//                      case 'C':
////                        JumpPage(new QRPage(), context);
//                        break;
//                    }
//                  },
//                )
//              ],
////              title: Container(
////                  alignment: Alignment.topCenter,
////                  child: new Column(
////                      children: <Widget>[
////                        new Container(height: 10),
////                        new Text(
////                          "外快信息",
////                          style: new TextStyle(
////                              fontSize: 30.0,
////                              fontWeight: FontWeight.w900,
////                              color: Colors.yellow[700],
////                              decoration: TextDecoration.none
////                          ),
////                        ),
////                      ],
////                  )
////              ),
////              flexibleSpace: Container(
////                child: new FlatButton(
////                  onPressed: () {},
////                  child: new TextField(
////                    maxLines: 1,
////                    controller: _searchBoxContronller,
////                    style: new TextStyle(
////                      fontSize: 16.0,
////                    ),
////                    decoration: new InputDecoration(
////                        hintText: "",
////                        contentPadding: EdgeInsets.all(6),
////                        border: InputBorder.none),
////                  ),
////                ),
////              ),
//              bottom: new TabBar(
//                indicatorWeight: 2,
//                indicatorPadding:
//                    EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 0),
//                indicatorColor: Colors.yellow[700],
//                labelColor: Colors.yellow[700],
//                unselectedLabelColor: Colors.grey,
//                tabs: <Widget>[
//                  new Tab(
//                    text: "推荐",
////                    icon: new Icon(Icons.thumb_up, size: 20),
//                  ),
//                  new Tab(
//                    text: "热门",
////                    icon: new Icon(Icons.whatshot, size: 20),
//                  ),
//                  new Tab(
//                    text: "快赚",
////                    icon: new Icon(Icons.fast_forward, size: 20),
//                  ),
//                  new Tab(
//                    text: "分类",
////                    icon: new Icon(Icons.grid_on, size: 20),
//                  )
//                ],
//              ),
//            )),
//        body: new TabBarView(
//          children: <Widget>[
//            new RecommendationTask(),
//            new HotTask(),
//            new EasyMoneyTask(),
//            new CategoryTask()
//          ],
//        ),
//      ),
//    );
//  }
//}
//
////class UserTaskAppBar extends StatefulWidget implements PreferredSizeWidget {
////
////  final double height;
////  final double elevation;
////  final Widget text;
////
////  const UserTaskAppBar(
////      {Key key,
////        this.height: 46.0,
////        this.elevation: 0.5,
////        this.text: null,
////      }
////  ) : super(key: key);
////
////  @override
////  State<StatefulWidget> createState() => new UserTaskAppBarState();
////
////  @override
////  Size get preferredSize => Size.fromHeight(height);//这里设置控件（appBar）的高度
////
////}
////
////class UserTaskAppBarState extends State<UserTaskAppBar> {
////
////  @override
////  Widget build(BuildContext context) {
////
////  }
////
////}
////
////class UserTaskBody extends StatelessWidget {
////
////  @override
////  Widget build(BuildContext context) {
////
////  }
////
////}
//
////new Column(
////children: <Widget>[
/////*
////               * Upper part:
////               * 上部分页面:
////               * Page name 页面名称
////               * Search box 搜索框
////               * Top bar 上选框
////               */
////new Column(
////children: <Widget>[
////new Container(
////color: Colors.black,
////alignment: Alignment.topCenter,
////padding: EdgeInsets.only(top: 30, left: 5, right: 5, bottom: 5),
////child: new Text(
////"外快信息",
////style: new TextStyle(
////fontSize: 30.0,
////fontWeight: FontWeight.w900,
////color: Colors.yellow[700],
////decoration: TextDecoration.none
////),
////),
////),
////new Container(
////color: Colors.black,
////alignment: Alignment.topCenter,
////padding: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
////child: new Card(
////child: new Row(
////children: <Widget>[
////new SizedBox(width: 5.0),
////new Icon(Icons.search, color: Colors.grey),
////Expanded(
////child: new TextField(
////maxLines: 1,
////controller: _searchBoxContronller,
////style: new TextStyle(
////fontSize: 16.0,
////),
////decoration: new InputDecoration(
////hintText: "搜索外快",
////contentPadding: EdgeInsets.all(6),
////border: InputBorder.none
////),
////),
////),
////new IconButton(icon: new Icon(Icons.cancel), onPressed: () {_searchBoxContronller.clear();}, color: Colors.grey)
////],
////),
////),
////),
////new Container(
////color: Colors.black,
////child: new TabBar(
////tabs: <Widget>[
////new Tab(
////text: "推荐",
////icon: new Icon(Icons.thumb_up),
////),
////new Tab(
////text: "热门",
////icon: new Icon(Icons.whatshot),
////),
////new Tab(
////text: "快赚",
////icon: new Icon(Icons.fast_forward),
////),
////new Tab(
////text: "分类",
////icon: new Icon(Icons.grid_on),
////)
////],
////),
////),
////],
////),
/////*
////             * Middle part:
////             * 中部分页面:
////             * Select view 筛选外块
////             * Sort button 外快排序
////             * List view 外快表单
////             */
////new Column(
////children: <Widget>[
////new TabBarView(
////children: <Widget>[
////new CategoryTask(),
////new EasyMoneyTask(),
////new HotTask(),
////new RecommendationTask()
////]
////)
////],
////)
////],
////),
//
////import 'package:flutter/cupertino.dart';
////import 'package:flutter/material.dart';
////import 'package:flutter/rendering.dart';
////import 'package:flutter_tab_bar_no_ripple/flutter_tab_bar_no_ripple.dart';
////import 'package:cupertino_tabbar/cupertino_tabbar.dart' as CupertinoTabBar;
////import 'package:pull_to_refresh/pull_to_refresh.dart';
////import './Task/CategoryTask.dart';
////import './Task/EasyMoneyTask.dart';
////import './Task/HotTask.dart';
////import './Task/RecommendationTask.dart';
//
//class UserTaskPage3 extends StatefulWidget {
//
//  @override
//  UserTaskPageState3 createState() => UserTaskPageState3();
//}
//
//class UserTaskPageState3 extends State<UserTaskPage3> with SingleTickerProviderStateMixin {
//
//  TabController _controller;
//  ScrollController _scrollController;
//
//  @override
//  void initState() {
//    _controller = TabController(vsync: this, length: 24);
//    _scrollController = ScrollController();
//    super.initState();
//  }
//
//  @override
//  void dispose() {
//    _controller.dispose();
//    _scrollController.dispose();
//    super.dispose();
//  }
//
//  PopupMenuItem<String> SelectView(IconData icon, String text, String id) {
//    return new PopupMenuItem<String>(
//        value: id,
//        child: new Row(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            new Icon(icon, color: Color(0xFF2D3447)),
//            new Text(text),
//          ],
//        )
//    );
//  }
//
//  Widget generateSearchBox() {
//    return new Container(
//        height: 40,
//        padding: EdgeInsets.only(left: 5, right: 5),
//        decoration: BoxDecoration(
//          color: Colors.white,
//          borderRadius: BorderRadius.all(Radius.circular(15)),
//        ),
//        child: Row(
//            children: <Widget>[
//              SizedBox(width: 5),
//
//              Icon(
//                Icons.search,
//                size: 24,
//                color: Colors.grey[400],
//              ),
//
//              SizedBox(width: 10),
//
//              Text(
//                  "搜索 职业/教程/朋友",
//                  maxLines: 1,
//                  overflow: TextOverflow.ellipsis,
//                  style: TextStyle(
//                      fontSize: 16,
//                      color: Colors.grey,
//                      fontWeight: FontWeight.w300
//                  )
//              )
//            ])
//    );
//  }
//
//  Widget generateAppBar() {
//    return new AppBar(
//      elevation: 0,
//      backgroundColor: Color(0xFF2D3447),
//      title: generateSearchBox(),
////      flexibleSpace: new SmartRefresher(
////          enablePullDown: true,
////          enablePullUp: false,
////          header: WaterDropMaterialHeader(backgroundColor: Color(0xFF2D3447), color: Color.fromARGB(255, 248, 130, 0), distance: 40),
////          controller: _refreshController,
////          onRefresh: _onRefresh,
////          onLoading: _onLoading,
////          child: buildList(0)
////      ),
//      actions: <Widget>[
//        new PopupMenuButton<String>(
//          itemBuilder: (BuildContext context) =>
//          <PopupMenuItem<String>>[
//            this.SelectView(Icons.add_to_photos, '发起群聊', 'A'),
//            this.SelectView(Icons.group_add, '添加服务', 'B'),
//            this.SelectView(Icons.cast_connected, '扫一扫码', 'C'),
//          ],
//          onSelected: (String action) {
//            switch (action) {
//              case 'A':
//                break;
//              case 'B':
//                break;
//              case 'C':
//                break;
//            }
//          },
//        )
//      ],
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      drawer: new Drawer(),
//      appBar: generateAppBar(),
////      body: generateBody02(),
//    );
//  }
//
////  Widget generateBody01() {
////    return new NestedScrollView(
////        controller: _scrollController,
////        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
////          return <Widget>[
////            new SliverToBoxAdapter(
////                child: new UserTaskPageFlexible()
////            ),
////            new SliverOverlapAbsorber(
////                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
////                child: new SliverAppBar(
//                    backgroundColor: Colors.grey[100],
//                    forceElevated: false,
//                    pinned: true,
//                    expandedHeight: 0,
//                    titleSpacing: 0,
//                    automaticallyImplyLeading: false,
////                    title: new TabBarNoRipple(
////                      controller: _controller,
////                      isScrollable: true,
////                      indicatorWeight: 2,
////                      indicatorPadding: EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 0),
////                      indicatorColor: Colors.yellow[700],
////                      labelColor: Colors.yellow[700],
////                      unselectedLabelColor: Colors.grey,
////                      labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
////                      tabs: <Widget>[
////                        new Tab(
////                          text: "推荐",
////                        ),
////                        new Tab(
////                          text: "热门",
////                        ),
////                        new Tab(
////                          text: "快赚",
////                        ),
////                        new Tab(
////                          text: "分类",
////                        ),
////                        new Tab(
////                          text: "推荐",
////                        ),
////                        new Tab(
////                          text: "热门",
////                        ),
////                        new Tab(
////                          text: "快赚",
////                        ),
////                        new Tab(
////                          text: "分类",
////                        ),
////                        new Tab(
////                          text: "推荐",
////                        ),
////                        new Tab(
////                          text: "热门",
////                        ),
////                        new Tab(
////                          text: "快赚",
////                        ),
////                        new Tab(
////                          text: "分类",
////                        ),
////                        new Tab(
////                          text: "推荐",
////                        ),
////                        new Tab(
////                          text: "热门",
////                        ),
////                        new Tab(
////                          text: "快赚",
////                        ),
////                        new Tab(
////                          text: "分类",
////                        ),
////                        new Tab(
////                          text: "推荐",
////                        ),
////                        new Tab(
////                          text: "热门",
////                        ),
////                        new Tab(
////                          text: "快赚",
////                        ),
////                        new Tab(
////                          text: "分类",
////                        )
////                      ],
////                    )
////                )
////            )
////          ];
////        },
////        body: new TabBarView(
////          controller: _controller,
////          children: <Widget>[
////            new RecommendationTask(),
////            new HotTask(),
////            new EasyMoneyTask(),
////            new CategoryTask(),
////            new RecommendationTask(),
////            new HotTask(),
////            new EasyMoneyTask(),
////            new CategoryTask(),
////            new RecommendationTask(),
////            new HotTask(),
////            new EasyMoneyTask(),
////            new CategoryTask(),
////            new RecommendationTask(),
////            new HotTask(),
////            new EasyMoneyTask(),
////            new CategoryTask(),
////            new RecommendationTask(),
////            new HotTask(),
////            new EasyMoneyTask(),
////            new CategoryTask(),
////            new RecommendationTask(),
////            new HotTask(),
////            new EasyMoneyTask(),
////            new CategoryTask()
////          ],
////        )
////    );
////  }
////
////  Widget generateBody02() {
////    return new NestedScrollView(
////        controller: _scrollController,
////        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
////          return <Widget>[
////            new SliverToBoxAdapter(
////                child: new UserTaskPageFlexible()
////            ),
////            new SliverOverlapAbsorber(
////                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
////                child: new SliverAppBar(
////                    backgroundColor: Colors.grey[100],
////                    forceElevated: false,
////                    pinned: true,
////                    expandedHeight: 0,
////                    titleSpacing: 0,
////                    automaticallyImplyLeading: false,
////                    title: new TabBarNoRipple(
////                      controller: _controller,
////                      isScrollable: true,
////                      indicatorWeight: 2,
////                      indicatorPadding: EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 0),
////                      indicatorColor: Colors.yellow[700],
////                      labelColor: Colors.yellow[700],
////                      unselectedLabelColor: Colors.grey,
////                      labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
////                      tabs: <Widget>[
////                        new Tab(
////                          text: "推荐",
////                        ),
////                        new Tab(
////                          text: "热门",
////                        ),
////                        new Tab(
////                          text: "快赚",
////                        ),
////                        new Tab(
////                          text: "分类",
////                        ),
////                        new Tab(
////                          text: "推荐",
////                        ),
////                        new Tab(
////                          text: "热门",
////                        ),
////                        new Tab(
////                          text: "快赚",
////                        ),
////                        new Tab(
////                          text: "分类",
////                        ),
////                        new Tab(
////                          text: "推荐",
////                        ),
////                        new Tab(
////                          text: "热门",
////                        ),
////                        new Tab(
////                          text: "快赚",
////                        ),
////                        new Tab(
////                          text: "分类",
////                        ),
////                        new Tab(
////                          text: "推荐",
////                        ),
////                        new Tab(
////                          text: "热门",
////                        ),
////                        new Tab(
////                          text: "快赚",
////                        ),
////                        new Tab(
////                          text: "分类",
////                        ),
////                        new Tab(
////                          text: "推荐",
////                        ),
////                        new Tab(
////                          text: "热门",
////                        ),
////                        new Tab(
////                          text: "快赚",
////                        ),
////                        new Tab(
////                          text: "分类",
////                        )
////                      ],
////                    )
////                )
////            )
////          ];
////        },
////        body: new TabBarView(
////          controller: _controller,
////          children: <Widget>[
////            new RecommendationTask(),
////            new HotTask(),
////            new EasyMoneyTask(),
////            new CategoryTask(),
////            new RecommendationTask(),
////            new HotTask(),
////            new EasyMoneyTask(),
////            new CategoryTask(),
////            new RecommendationTask(),
////            new HotTask(),
////            new EasyMoneyTask(),
////            new CategoryTask(),
////            new RecommendationTask(),
////            new HotTask(),
////            new EasyMoneyTask(),
////            new CategoryTask(),
////            new RecommendationTask(),
////            new HotTask(),
////            new EasyMoneyTask(),
////            new CategoryTask(),
////            new RecommendationTask(),
////            new HotTask(),
////            new EasyMoneyTask(),
////            new CategoryTask()
////          ],
////        )
////    );
////  }
////
////  RefreshController _refreshController = RefreshController(initialRefresh: false);
////  void _onRefresh() async{
////    // monitor network fetch
////    await Future.delayed(Duration(milliseconds: 1000));
////    setState(() {});
////    _refreshController.refreshCompleted();
////  }
////  void _onLoading() async{
////    // monitor network fetch
////    await Future.delayed(Duration(milliseconds: 1000));
////    setState(() {});
////    _refreshController.loadComplete();
////  }
////  Widget buildList(int num) {
////    return new ListView.builder(itemBuilder: buildCard, itemCount: num);
////  }
////  Widget buildCard(BuildContext context, int index) => Container();
////
////}
////
//class UserTaskPageFlexible extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return UserTaskPageFlexibleState();
//  }
//
//}
//
//class UserTaskPageFlexibleState extends State<UserTaskPageFlexible> {
//
//  int cupertinoTabBarValue = 3;
//  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;
//
//  @override
//  Widget build(BuildContext context) {
//    return new Stack(
//      children: <Widget>[
//        new Container(
//          height: 440,
//          decoration: BoxDecoration(
//              color: Colors.grey[100]
//          ),
//        ),
//        new Container(
//            height: 200,
//            decoration: new BoxDecoration(
//                color: Color(0xFF2D3447),
//                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))
//            )
//        ),
//        new Column(
//          children: <Widget>[
//            new Container(
//                width: 500,
//                padding: EdgeInsets.only(top: 30, left: 15, right: 15),
//                child: GenerateCupertinoTab()
//            ),
//            SizedBox(height: 20),
//            new Container(
//              width: 500,
//              padding: EdgeInsets.only(top: 150),
//              margin: EdgeInsets.only(left: 30, right: 30),
//              decoration: BoxDecoration(
//                  boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0.0, 0.5), blurRadius: 1.5, spreadRadius: 0.5)],
//                  color: Colors.white,
//                  borderRadius: BorderRadius.circular(20)
//              ),
//            ),
//            SizedBox(height: 20),
//            new Container(
//              width: 500,
//              padding: EdgeInsets.only(top: 150),
//              margin: EdgeInsets.only(left: 30, right: 30),
//              decoration: BoxDecoration(
//                  boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0.0, 0.5), blurRadius: 1.5, spreadRadius: 0.5)],
//                  color: Colors.white,
//                  borderRadius: BorderRadius.circular(20)
//              ),
//            ),
//          ],
//        )
//      ],
//    );
//  }
//
//  Widget GenerateCupertinoTab() {
//    return new CupertinoTabBar.CupertinoTabBar(
//      const Color(0xFFd4d7dd),
//      const Color(0xFFf7f7f7),
//      [
//        const Text(
//          "推荐",
//          style: const TextStyle(
//            color: Colors.black,
//            fontSize: 18.75,
//            fontWeight: FontWeight.w600,
//            fontFamily: "SFProRounded",
//          ),
//          textAlign: TextAlign.center,
//        ),
//        const Text(
//          "热门",
//          style: const TextStyle(
//            color: Colors.black,
//            fontSize: 18.75,
//            fontWeight: FontWeight.w600,
//            fontFamily: "SFProRounded",
//          ),
//          textAlign: TextAlign.center,
//        ),
//        const Text(
//          "快赚",
//          style: const TextStyle(
//            color: Colors.black,
//            fontSize: 18.75,
//            fontWeight: FontWeight.w600,
//            fontFamily: "SFProRounded",
//          ),
//          textAlign: TextAlign.center,
//        ),
//        const Text(
//          "分类",
//          style: const TextStyle(
//            color: Colors.black,
//            fontSize: 18.75,
//            fontWeight: FontWeight.w600,
//            fontFamily: "SFProRounded",
//          ),
//          textAlign: TextAlign.center,
//        ),
//      ],
//      cupertinoTabBarValueGetter,
//          (int index) {
//        setState(() {
//          cupertinoTabBarValue = index;
//        });
//      },
//      horizontalPadding: 8,
//    );
//  }
//
//}
