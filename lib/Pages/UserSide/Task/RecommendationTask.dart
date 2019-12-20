import 'dart:async';

import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/hidden_drawer_controller.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_wai_kuai/Model/Model.dart';
import 'package:test_wai_kuai/Model/Test.dart';
import 'package:intl/intl.dart';

class RecommendationTask extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return RecommendationTaskState();
  }

}

class RecommendationTaskState extends State<RecommendationTask> with TickerProviderStateMixin {

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

  @override
  void initState() => super.initState();

  List<Task> lt = TaskTest().get(20);
  int length = 20;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(top: 55),
      child: new SmartRefresher(
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
      )
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

//class RecommendationTaskStateq extends State<RecommendationTask> with TickerProviderStateMixin {
//
//  HiddenDrawerController controller;
//
//  @override
//  void initState() {
//    this.controller = HiddenDrawerController(vsync: this);
//  }
//
//  List<Task> lt = TaskTest().get(21);
//
//  @override
//  Widget build(BuildContext context) {
//    return buildList();
//  }
//
//  Widget buildList() {
//    return ListView.builder(itemBuilder: buildCard, itemCount: 20);
//  }
//
//  Widget buildCard(BuildContext context, int index) {
//    Task data = lt.removeAt(index);
//    lt.insert(index, data);
//    String s = data.payment.lowerBound.toString() + "~" + data.payment.upperBound.toString();
//    return Container(
//        width: 400,
//        height: 100,
//        margin: EdgeInsets.only(top: 3, left: 10, right: 10, bottom: 3),
//        decoration: BoxDecoration(
//            color: Colors.white,
//            boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0.0, 0.5), blurRadius: 0.5, spreadRadius: 0.1)],
//            borderRadius: BorderRadius.circular(10.0)
//        ),
//        child: Row(
//          children: <Widget>[
//            new Container(
//              child: Image.asset(data.logo),
//              padding: EdgeInsets.all(16),
//            ),
//            new Container(
//                child: new Column(
//                  children: <Widget>[
//                    new Container(
//                        padding: EdgeInsets.all(10),
//                        child: new Text(
//                            data.name,
//                            style: TextStyle(wordSpacing: 4, fontSize: 16, fontWeight: FontWeight.w600)
//                        )),
//                    new Container(
//                        padding: EdgeInsets.all(10),
//                        child: new Text(
//                            s + "  人民币/每周",
//                            style: TextStyle(wordSpacing: 4, fontSize: 16, color: Color.fromARGB(255, 248, 130, 0))
//                        )),
//                  ],
//                )
//            )
//          ],
//        )
//    );
//  }
//}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();

  final ChatUser user = ChatUser(
    name: "Fayeed",
    uid: "123456789",
    avatar: "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
  );

  final ChatUser otherUser = ChatUser(
    name: "Mrfatty",
    uid: "25649654",
  );

  List<ChatMessage> messages = List<ChatMessage>();
  var m = List<ChatMessage>();

  var i = 0;

  @override
  void initState() {
    super.initState();
  }

  void systemMessage() {
    Timer(Duration(milliseconds: 300), () {
      if (i < 6) {
        setState(() {
          messages = [...messages, m[i]];
        });
        i++;
      }
      Timer(Duration(milliseconds: 300), () {
        _chatViewKey.currentState.scrollController
          ..animateTo(
            _chatViewKey.currentState.scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
      });
    });
  }

  void onSend(ChatMessage message) {
    print(message.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App"),
      ),
      body: DashChat(
                key: _chatViewKey,
                inverted: false,
                onSend: onSend,
                user: user,
                inputDecoration:
                InputDecoration.collapsed(hintText: "Add message here..."),
                dateFormat: DateFormat('yyyy-MMM-dd'),
                timeFormat: DateFormat('HH:mm'),
                messages: messages,
                showUserAvatar: false,
                showAvatarForEveryMessage: false,
                scrollToBottom: false,
                onPressAvatar: (ChatUser user) {
                  print("OnPressAvatar: ${user.name}");
                },
                onLongPressAvatar: (ChatUser user) {
                  print("OnLongPressAvatar: ${user.name}");
                },
                inputMaxLines: 5,
                messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
                alwaysShowSend: true,
                inputTextStyle: TextStyle(fontSize: 16.0),
                inputContainerStyle: BoxDecoration(
                  border: Border.all(width: 0.0),
                  color: Colors.white,
                ),
                onLoadEarlier: () {
                  print("laoding...");
                },
                shouldShowLoadEarlier: false,
                showTraillingBeforeSend: true,
              ));}}
