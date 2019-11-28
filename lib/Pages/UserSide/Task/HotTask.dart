import 'package:flutter/material.dart';

class HotTask extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HotTaskState();
  }

}

class HotTaskState extends State<HotTask> {

  @override
  Widget build(BuildContext context) {
    return buildList();
  }

  Widget buildList() {
    return ListView.builder(itemBuilder: buildCard, itemCount: 20);
  }

  Widget buildCard(BuildContext context, int index) {
    return Container(
      width: 400,
      height: 100,
      margin: EdgeInsets.only(top: 3, left: 10, right: 10, bottom: 3),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0.0, 0.5), blurRadius: 0.5, spreadRadius: 0.1)],
          borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }


}