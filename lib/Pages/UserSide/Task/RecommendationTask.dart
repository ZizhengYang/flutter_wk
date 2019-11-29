import 'package:flutter/material.dart';
import 'package:test_wai_kuai/Model/Model.dart';
import 'package:test_wai_kuai/Model/Test.dart';

class RecommendationTask extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return RecommendationTaskState();
  }

}

class RecommendationTaskState extends State<RecommendationTask> {

  List<Task> lt = TaskTest().get(21);

  @override
  Widget build(BuildContext context) {
    return buildList();
  }

  Widget buildList() {
    return ListView.builder(itemBuilder: buildCard, itemCount: 20);
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
                    padding: EdgeInsets.all(10),
                    child: new Text(
                        s + "  人民币/每周",
                        style: TextStyle(wordSpacing: 4, fontSize: 16, color: Color.fromARGB(255, 248, 130, 0))
                )),
              ],
            )
          )
        ],
      )
    );
  }


}