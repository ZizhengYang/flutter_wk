import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_wai_kuai/Model/Model.dart';
import 'package:test_wai_kuai/Model/Test.dart';

import 'RecommendationTask.dart';

class HotTask extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HotTaskState();
  }

}

class HotTaskState extends State<HotTask> with TickerProviderStateMixin {

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    if (mounted) setState(() {});
    setState(() {
      List<Task> temp = TaskTest().get(20);
      temp.addAll(lt);
      lt = temp;
      length+=20;
    });
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
//    if(mounted)
    setState(() {lt.addAll(TaskTest().get(20));length+=20;});
    _refreshController.loadComplete();
  }

//  @override
//  void initState() {
//    super.initState();
//  }

  List<Task> lt = TaskTest().get(20);
  int length = 20;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: false,
        enablePullUp: true,
        header: WaterDropMaterialHeader(backgroundColor: Color(0xFF2D3447), color: Color.fromARGB(255, 248, 130, 0), distance: 40),
        footer: CustomFooter(
          builder: (BuildContext context,LoadStatus mode){
            Widget body ;
            if(mode==LoadStatus.idle){
              body =  Text("pull up load");
            }
            else if(mode==LoadStatus.loading){
              body =  CupertinoActivityIndicator();
            }
            else if(mode == LoadStatus.failed){
              body = Text("Load Failed!Click retry!");
            }
            else if(mode == LoadStatus.canLoading){
              body = Text("release to load more");
            }
            else{
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child:body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: buildList(length)
    );
  }

  Widget buildList(int num) {
    return new ListView.builder(itemBuilder: buildCard, itemCount: num);
  }

  Widget buildCard(BuildContext context, int index) {
    Task data = lt.removeAt(index);
    lt.insert(index, data);
    String s = data.payment.lowerBound.toString() + "~" + data.payment.upperBound.toString();
    return Container(
        width: 400,
        height: 100,
        margin: EdgeInsets.only(top: 3, left: 10, right: 10, bottom: 3),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0.0, 0.5), blurRadius: 0.5, spreadRadius: 0.1)],
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: Row(
          children: <Widget>[
            new Container(
              child: Image.asset(data.logo),
              padding: EdgeInsets.all(16),
            ),
            new Container(
                child: new Column(
                  children: <Widget>[
                    new Container(
                        padding: EdgeInsets.all(10),
                        child: new Text(
                            data.name,
                            style: TextStyle(wordSpacing: 4, fontSize: 16, fontWeight: FontWeight.w600)
                        )),
                    new Container(
                      padding: EdgeInsets.all(5),
                      child: new RaisedButton(onPressed: () {Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new MyHomePage()));}, child: new Text(
                          s + "  人民币/每周",
                          style: TextStyle(wordSpacing: 4, fontSize: 16, color: Color.fromARGB(255, 248, 130, 0))
                      )),)
                  ],
                )
            )
          ],
        )
    );
  }
}