import 'dart:ui';

import 'package:cupertino_tabbar/cupertino_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:test_wai_kuai/Examples/Basic_Animation_Demo.dart';
import 'package:test_wai_kuai/Examples/ExampleCustomMenu.dart';
import 'package:test_wai_kuai/Examples/Test.dart';
import 'package:test_wai_kuai/Examples/TwoLevel_Refresh.dart';
import 'package:test_wai_kuai/Examples/cupertino_tabbar.dart';
import 'package:test_wai_kuai/Examples/example_hidden_drawer.dart';
import 'package:test_wai_kuai/Pages/CompanySide/LoginRegister/Login.dart';
import 'package:test_wai_kuai/Pages/CompanySide/LoginRegister/Register.dart';
import 'package:test_wai_kuai/Pages/UserSide/LoginType/PhoneLogin.dart';
import 'package:test_wai_kuai/Pages/UserSide/LoginType/WechatLogin.dart';
import 'package:test_wai_kuai/Widght/Button/PopIconButton.dart';
import 'package:test_wai_kuai/Widght/Text/AppTitle.dart';

class HomeContent extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HomeContentState();
  }

}

class HomeContentState extends State<HomeContent> with SingleTickerProviderStateMixin {

  Widget _currentSelection;
  Widget _returnButton = new Container();
  List<Widget> _previousSelection = new List<Widget>();
  AnimationController _animationController1;
  Animation _animation1;
  AnimationController _animationController2;
  Animation _animation2;

  /// Constructor
  /// (Temp)
  HomeContentState();

  @override
  void initState() {
    super.initState();
    _currentSelection = buildHomeContentChoices();
    _animationController1 = new AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation1 = Tween(begin: 1.0, end: 0.0).animate(_animationController1);
    _animationController1.addListener(() {setState(() {});});
//    _animationController2 = new AnimationController(vsync: this, duration: Duration(milliseconds: 500));
//    _animation2 = Tween(begin: 0.0, end: -1.0).animate(_animationController2);
//    _animationController2.addListener(() {setState(() {});});
    _animationController1.forward();
  }

  int getSize() {
    return _previousSelection.length;
  }

  void setReturnButton() {
    setState(() {
      this._returnButton = getSize()<=0 ? new Container() : new PopIconButton_RoundedSquare_function_return(image: 'assets/images/flatUI/back.png', size: 40, top: 260, text: "", target: HomeContentChoices_from, margin: 310);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return new Scaffold(
        body: Container(
            child: new Column(children: <Widget>[
              new Center(
                  child: new Container(
                    margin: EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 0),
                    child: new AppTitle(),
                  )),
              new Transform(
                transform: Matrix4.translationValues(0.0, _animation1.value * width, 0.0),
                child: new Stack(
                  children: <Widget>[
                    new Material(
                      type: MaterialType.transparency,
                      child: new Container(
                        height: 150,//15*_animation1.value,
                        width: 600,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0.0, 0.5), blurRadius: 2, spreadRadius: 0.5)],
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.43, left: 20, right: 20, bottom: 0),//280
                        padding: EdgeInsets.only(top: 20, left: 0, right: 0, bottom: 20),
                        child: _currentSelection,
//                      child: new Material(
//                        type: MaterialType.transparency,
//                        child: this._currentSelection
//                      )
                      ),
                    ),
                    this._returnButton
                  ],
                )
              )
            ])));;
  }

  void onSelectionAdded(Widget currentSelection) {
    setState(() {
      _push(this._currentSelection);
      this._currentSelection = currentSelection;
    });
  }

  void onSelectionRemoved(Widget currentSelection) {
    setState(() {
      this._currentSelection = _pop();
    });
  }

  void _push(Widget selection) {
    _previousSelection.add(selection);
  }

  Widget _pop() {
    return _previousSelection.removeAt(_previousSelection.length - 1);
  }

  void HomeContentChoices_to_ChooseLoginTypeChoices() {
//    _animationController2.reset();
//    _animationController2.forward();
    _animationController1.reset();
    _animationController1.forward();
    onSelectionAdded(buildChooseLoginTypeChoices());
    setReturnButton();
  }

  void HomeContentChoices_to_ChooseLoginRegistionChoices() {
//    _animationController2.reset();
//    _animationController2.forward();
    _animationController1.reset();
    _animationController1.forward();
    onSelectionAdded(buildChooseLoginRegistionChoices());
    setReturnButton();
  }

//  void HomeContentChoices_from_ChooseLoginTypeChoices() {
//    onSelectionRemoved(buildChooseLoginRegistionChoices());
//    setReturnButton();
//  }
//
//  void HomeContentChoices_from_ChooseLoginRegistionChoices() {
//    onSelectionRemoved(buildChooseLoginRegistionChoices());
//    setReturnButton();
//  }

  void HomeContentChoices_from() {
//    _animationController2.reset();
//    _animationController2.forward();
    _animationController1.reset();
    _animationController1.forward();
    onSelectionRemoved(buildChooseLoginRegistionChoices());
    setReturnButton();
  }

  Widget buildHomeContentChoices() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new PopIconButton_RoundedSquare_function(image: 'assets/images/business/101-meeting.png', size: 80, top: 300, text: " 我 要 赚 外 快", target: HomeContentChoices_to_ChooseLoginTypeChoices, margin: 10, tag: "zhuanwaikuai"),
        new PopIconButton_RoundedSquare_function(image: 'assets/images/business/101-orders.png', size: 80, top: 300, text: " 我 要 发 兼 职 ", target: HomeContentChoices_to_ChooseLoginRegistionChoices, margin: 10, tag: "fajianzhi")
      ],
    );
  }

  Widget buildChooseLoginTypeChoices() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // WechatLogin()
        new PopIconButton_RoundedSquare(image: 'assets/images/messager/035-wechat.png', size: 80, top: 300, text: " 微 信 登 录 ", target: UserTaskPage2(), margin: 20, tag: "wechat"),
        new PopIconButton_RoundedSquare(image: 'assets/images/flatUI/telephone.png', size: 80, top: 300, text: " 电 话 登 录 ", target: PhoneLogin(), margin: 20, tag: "phone"),
//        new PopIconButton_RoundedSquare_function_return(image: 'assets/images/flatUI/back.png', size: 80, top: 300, text: " 返 回 前 页 ", target: HomeContentChoices_from_ChooseLoginTypeChoices, margin: 0)
      ],
    );
  }

  Widget buildChooseLoginRegistionChoices() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new PopIconButton_RoundedSquare(image: 'assets/images/flatUI/profile.png', size: 80, top: 300, text: " 创 建 帐 号 ", target: Register(), margin: 20, tag: "registor"),
        new PopIconButton_RoundedSquare(image: 'assets/images/flatUI/password-1.png', size: 80, top: 300, text: " 登 录 帐 号 ", target: Login(), margin: 20, tag: "login"),
//        new PopIconButton_RoundedSquare_function_return(image: 'assets/images/flatUI/back.png', size: 80, top: 300, text: " 返 回 前 页 ", target: HomeContentChoices_from_ChooseLoginRegistionChoices, margin: 0)
      ],
    );
  }


}