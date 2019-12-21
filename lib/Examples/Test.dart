import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_wai_kuai/Model/Model.dart';
import 'package:test_wai_kuai/Model/Test.dart';
import 'package:test_wai_kuai/Pages/UserSide/Task/RecommendationTask.dart';

class UserTaskPage2 extends StatefulWidget {

  @override
  UserTaskPageState2 createState() => UserTaskPageState2();
}

class UserTaskPageState2 extends State<UserTaskPage2> with SingleTickerProviderStateMixin {

  TabController _controller;
  ScrollController _scrollController;

  @override
  void initState() {
    _controller = TabController(vsync: this, length: 24);
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  PopupMenuItem<String> SelectView(IconData icon, String text, String id) {
    return new PopupMenuItem<String>(
        value: id,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Icon(icon, color: Color(0xFF2D3447)),
            new Text(text),
          ],
        )
    );
  }

  Widget generateSearchBox() {
    return new Container(
        height: 40,
        padding: EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
            children: <Widget>[
              SizedBox(width: 5),

              Icon(
                Icons.search,
                size: 24,
                color: Colors.grey[400],
              ),

              SizedBox(width: 10),

              Text(
                  "搜索 职业/教程/朋友",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300
                  )
              )
            ])
    );
  }

  Widget generateAppBar() {
    return new AppBar(
      elevation: 0,
      backgroundColor: Color(0xFF2D3447),
      title: generateSearchBox(),
      actions: <Widget>[
        new PopupMenuButton<String>(
          itemBuilder: (BuildContext context) =>
          <PopupMenuItem<String>>[
            this.SelectView(Icons.add_to_photos, '发起群聊', 'A'),
            this.SelectView(Icons.group_add, '添加服务', 'B'),
            this.SelectView(Icons.cast_connected, '扫一扫码', 'C'),
          ],
          onSelected: (String action) {
            switch (action) {
              case 'A':
                break;
              case 'B':
                break;
              case 'C':
                break;
            }
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(),
      appBar: generateAppBar(),
      body: new SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: WaterDropMaterialHeader(backgroundColor: Color(0xFF2D3447), color: Color.fromARGB(255, 248, 130, 0), distance: 40),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: buildList(1),
      ),
    );
  }

  RefreshController _refreshController = RefreshController(initialRefresh: false);
  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {});
    _refreshController.refreshCompleted();
  }
  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {});
    _refreshController.loadComplete();
  }
  Widget buildList(int num) {
    return new ListView.builder(itemBuilder: buildCard, itemCount: num);
  }
  Widget buildCard(BuildContext context, int index) => new Stack(
    children: <Widget>[
      new Container(
        width: 400,
        height: 300,
        color: Colors.green,
      ),
      new Container(
        width: 400,
        height: 300,
        color: Colors.blue,
      ),
      new Container(
        width: 400,
        height: 300,
        color: Colors.black,
      ),
      new Container(
        width: 400,
        height: 300,
        color: Colors.red,
      ),
      new Container(
        width: 400,
        height: 300,
        color: Colors.yellow,
      ),
      new Container(
        width: 400,
        height: 300,
        color: Colors.white,
      ),
      new Container(
        width: 400,
        height: 300,
        color: Colors.purple,
      ),
    ],
  );

}