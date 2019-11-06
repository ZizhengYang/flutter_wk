import 'package:flutter/material.dart';

class UserTaskPage extends StatelessWidget {

  final SearchBoxContronller = TextEditingController();

  List<Widget> requestList() {

  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "waikuaiInfo",
      home: new Container(
        /*
           * Page main part
           * 页面主要内容
           */
        child: new Column(
          children: <Widget>[
            /*
               * Upper part:
               * 上部分页面:
               * Page name 页面名称
               * Search box 搜索框
               * Top bar 上选框
               */
            new Column(
              children: <Widget>[
                new Container(
                  color: Colors.black,
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 30, left: 5, right: 5, bottom: 5),
                  child: new Text(
                    "外快信息",
                    style: new TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.yellow[700],
                        decoration: TextDecoration.none
                    ),
                  ),
                ),
                new Container(
                  color: Colors.black,
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
                  child: new Card(
                    child: new Row(
                      children: <Widget>[
                        new SizedBox(width: 5.0),
                        new Icon(Icons.search, color: Colors.grey),
                        Expanded(
                          child: new TextField(
                            maxLines: 1,
                            controller: SearchBoxContronller,
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                            decoration: new InputDecoration(
                                hintText: "搜索外快",
                                contentPadding: EdgeInsets.all(6),
                                border: InputBorder.none
//                            new OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.lime[600])),
                            ),
                          ),
                        ),
                        new IconButton(icon: new Icon(Icons.cancel), onPressed: () {SearchBoxContronller.clear();}, color: Colors.grey)
                      ],
                    ),
                  ),
                ),
                new Container(
                  color: Colors.black,
                  child: new Row(
                    children: <Widget>[
                      new FlatButton(onPressed: () {}, child: new Text("推荐"), color: Colors.yellow[700]),
                      new FlatButton(onPressed: () {}, child: new Text("热门"), color: Colors.yellow[700]),
                      new FlatButton(onPressed: () {}, child: new Text("快赚"), color: Colors.yellow[700]),
                      new FlatButton(onPressed: () {}, child: new Text("分类"), color: Colors.yellow[700])
                    ],
                  ),
                ),
              ],
            ),
            /*
             * Middle part:
             * 中部分页面:
             * Select view 筛选外块
             * Sort button 外快排序
             * List view 外快表单
             */
            new Column(

            ),
            /*
             * Upper part:
             * 下部分页面:
             * Bottom bar 下选框
             */
            new Column(
              children: <Widget>[
                /*
                 *
                 */
                new Row(

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}