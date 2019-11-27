import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_wai_kuai/Pages/CompanySide/LoginRegister/Login.dart';
import 'package:test_wai_kuai/Pages/CompanySide/LoginRegister/Register.dart';
import 'package:test_wai_kuai/Pages/UserSide/LoginType/PhoneLogin.dart';
import 'package:test_wai_kuai/Pages/UserSide/LoginType/WechatLogin.dart';
import 'package:test_wai_kuai/Widght/Button/PopIconButton.dart';
import 'package:test_wai_kuai/Widght/Text/AppTitle.dart';

class HomeContent extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HomeContentState();
  }

}

class _HomeContentState extends State<HomeContent> with SingleTickerProviderStateMixin {

  Widget _currentSelection;
  Widget _returnButton = new Container();
  List<Widget> _previousSelection = new List<Widget>();
  AnimationController _animationController1;
  Animation _animation1;
  AnimationController _animationController2;
  Animation _animation2;

  /// Constructor
  /// (Temp)
  _HomeContentState();

  @override
  void initState() {
    super.initState();
    _currentSelection = buildHomeContentChoices();
    _animationController1 = new AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation1 = Tween(begin: 0.0,end: 10.0).animate(_animationController1);
    _animationController1.addListener(() {setState(() {});});
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
    return new Scaffold(
        body: Container(
            child: new Column(children: <Widget>[
              new Center(
                  child: new Container(
                    margin: EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 0),
                    child: new AppTitle(),
                  )),
              new Stack(
                children: <Widget>[
                  new Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0.0, 0.5), blurRadius: 2, spreadRadius: 0.5)],
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      margin: EdgeInsets.only(top: 330-5*_animation1.value, left: 20, right: 20, bottom: 0),//280
                      padding: EdgeInsets.only(top: 20, left: 0, right: 0, bottom: 20),
                      child: this._currentSelection
                  ),
                  this._returnButton
                ],
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
    _animationController1.reset();
    _animationController1.forward();
    onSelectionAdded(buildChooseLoginTypeChoices());
    setReturnButton();
  }

  void HomeContentChoices_to_ChooseLoginRegistionChoices() {
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
    _animationController1.reset();
    _animationController1.forward();
    onSelectionRemoved(buildChooseLoginRegistionChoices());
    setReturnButton();
  }

  Widget buildHomeContentChoices() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new PopIconButton_RoundedSquare_function(image: 'assets/images/business/101-meeting.png', size: 80, top: 300, text: " 我 要 赚 外 快", target: HomeContentChoices_to_ChooseLoginTypeChoices, margin: 10),
        new PopIconButton_RoundedSquare_function(image: 'assets/images/business/101-orders.png', size: 80, top: 300, text: " 我 要 发 兼 职 ", target: HomeContentChoices_to_ChooseLoginRegistionChoices, margin: 10)
      ],
    );
  }

  Widget buildChooseLoginTypeChoices() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new PopIconButton_RoundedSquare(image: 'assets/images/messager/035-wechat.png', size: 80, top: 300, text: " 微 信 登 录 ", target: WechatLogin(), margin: 20),
        new PopIconButton_RoundedSquare(image: 'assets/images/flatUI/telephone.png', size: 80, top: 300, text: " 电 话 登 录 ", target: PhoneLogin(), margin: 20),
//        new PopIconButton_RoundedSquare_function_return(image: 'assets/images/flatUI/back.png', size: 80, top: 300, text: " 返 回 前 页 ", target: HomeContentChoices_from_ChooseLoginTypeChoices, margin: 0)
      ],
    );
  }

  Widget buildChooseLoginRegistionChoices() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new PopIconButton_RoundedSquare(image: 'assets/images/flatUI/profile.png', size: 80, top: 300, text: " 创 建 帐 号 ", target: Register(), margin: 20),
        new PopIconButton_RoundedSquare(image: 'assets/images/flatUI/password-1.png', size: 80, top: 300, text: " 登 录 帐 号 ", target: Login(), margin: 20),
//        new PopIconButton_RoundedSquare_function_return(image: 'assets/images/flatUI/back.png', size: 80, top: 300, text: " 返 回 前 页 ", target: HomeContentChoices_from_ChooseLoginRegistionChoices, margin: 0)
      ],
    );
  }


}