import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tab_bar_no_ripple/flutter_tab_bar_no_ripple.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_wai_kuai/Pages/UserSide/Task/CategoryTask.dart';
import 'package:test_wai_kuai/Util/Clipper/AppBarClipper.dart';

import 'Task/EasyMoneyTask.dart';
import 'Task/HotTask.dart';
import 'Task/RecommendationTask.dart';

class UserTaskPage extends StatefulWidget {
  @override
  UserTaskPageState createState() => UserTaskPageState();
}

class UserTaskPageState extends State<UserTaskPage>
    with SingleTickerProviderStateMixin {
  /// constants:
  ///
  static const _searchReminder = "搜索 职业/教程/朋友";
  final Key linkKey = GlobalKey();

  /// Data using in the project:
  /// TODO: 求文案求文案求文案，我实在不行了......
  ///
  /// [_category_list_recommend]
  ///
  /// [_category_list_hot]
  ///
  /// [_category_list_easy]
  ///
  /// [_category_list_category] is a list original categories for [CategoryTask]
  /// TODO: support user personalized categories list
  ///
  List<String> _category_list_recommend = ["关注", "猜你", "推荐"];
  List<String> _category_list_hot = ["本地火爆", "大势所趋", "异军突起", "热潮未退", "路在何方"];
  List<String> _category_list_easy = ["调查问卷", "机器学习", "抢先试用", "征短文"];
  List<String> _category_list_category = [
    "互联网",
    "设计",
    "软件",
    "咨询",
    "金融",
    "健身",
    "文案",
    "工程",
    "媒体",
    "建模",
    "语言",
    "建筑",
    "管理",
    "调研"
  ];

  /// tab controllers:
  ///
  /// [_controller]
  TabController _controller;

  /// scroll controllers:
  ///
  /// [_scrollController]
  ScrollController _scrollController;

  RefreshController _refreshController;

  /// int variables:
  ///
  /// [_currentViewIndex] indicate the current view, total 4
  /// 1. Recommendation view
  /// 2. Hot task view
  /// 3. Easy money view
  /// 4. Category view
  ///
  int _currentViewIndex;

  /// [_swipeORlist] determine wether user is in [swipe view] or in [list view]
  ///
  /// [_secondTabBarReachTop] determine whether the second tab bar reach the top
  /// If {true}, tab bar reach the top, change color into {Color(0xFF2D3447)}
  /// If {false}, tab bar haven't reach top, obtain {grey[100]}
  ///
  bool _swipeORlist;
  bool _secondTabBarReachTop;

  /// text controllers:
  ///
  /// [_containText] searching key words
  /// TODO: Support seperation of key words(like tags)
  ///
  /// [_paymentCondition] the payment user want to have
  ///
  /// [_jobType] the type of job the user want to get
  ///
  /// [_durationBegin] the start time user expected
  ///
  /// [_durationEnd] the end time user expected
  ///
  TextEditingController _containText;
  TextEditingController _paymentCondition;
  TextEditingController _jobType;
  TextEditingController _durationBegin;
  TextEditingController _durationEnd;

  @override
  void initState() {
    _controller = TabController(
        vsync: this, length: this._category_list_recommend.length);
    _scrollController = ScrollController();
    _refreshController = RefreshController(initialRefresh: false);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: this.generateDrawer(),
      appBar: this.generateAppBar(),
      body: this.generateScrollView(),
    );
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
        ));
  }

  List<Widget> generateCategoryWidgetCategory() {
    List<Widget> ret = new List<Widget>();
    _category_list_category.forEach((value) {
      ret.add(new Tab(text: value));
    });
    return ret;
  }

  List<Widget> generateCategoryWidgetHot() {
    List<Widget> ret = new List<Widget>();
    _category_list_hot.forEach((value) {
      ret.add(new Tab(text: value));
    });
    return ret;
  }

  List<Widget> generateCategoryWidgetEasy() {
    List<Widget> ret = new List<Widget>();
    _category_list_easy.forEach((value) {
      ret.add(new Tab(text: value));
    });
    return ret;
  }

  List<Widget> generateCategoryWidgetRecommend() {
    List<Widget> ret = new List<Widget>();
    _category_list_recommend.forEach((value) {
      ret.add(new Tab(text: value, icon: null));
    });
    return ret;
  }

  List<Widget> generateTabView() {
    return <Widget>[
      new RecommendationTask(this.linkKey),
      new HotTask(),
      new EasyMoneyTask(),
//      new CategoryTask(),
    ];
  }

  Widget generateDrawer() {
    return new Drawer(
//        child: new Column(
//      children: <Widget>[
//        new Container(
//          width: 300,
//          height: 80,
//          color: Colors.green,
//        ),
//        new Container(
//          width: 300,
//          height: 80,
//          color: Colors.blue,
//        ),
//        new Container(
//          width: 300,
//          height: 80,
//          color: Colors.black,
//        ),
//        new Container(
//          width: 300,
//          height: 80,
//          color: Colors.red,
//        ),
//        new Container(
//          width: 300,
//          height: 80,
//          color: Colors.yellow,
//        ),
//        new Container(
//          width: 300,
//          height: 80,
//          color: Colors.pink,
//        ),
//        new Container(
//          width: 300,
//          height: 80,
//          color: Colors.purple,
//        )
//      ],
//    )
    );
  }

  Widget generateRefresher() {
    return this.generateScrollView();
//    return new SmartRefresher(
//      enablePullDown: true,
//      enablePullUp: false,
//      header: WaterDropMaterialHeader(
//          backgroundColor: Color(0xFF2D3447),
//          color: Color.fromARGB(255, 248, 130, 0),
//          distance: 40),
//      controller: _refreshController,
//      scrollController: _scrollController,
//      onRefresh: _onRefresh,
//      onLoading: _onLoading,
//      child: buildList(0),
//    );
  }

  Widget generateAppBar() {
    return new AppBar(
      elevation: 0,
      backgroundColor: Color(0xFF2D3447),
      title: generateSearchBox(),
//      title: new SimpleLinkBar(key: linkKey),
      actions: <Widget>[
        new PopupMenuButton<String>(
          itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
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
//      bottom: new PreferredSize(child: new SimpleLinkBar(key: linkKey), preferredSize: Size(MediaQuery.of(context).size.width,0)),
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
        child: Row(children: <Widget>[
          SizedBox(width: 5),
          Icon(
            Icons.search,
            size: 24,
            color: Colors.grey[400],
          ),
          SizedBox(width: 10),
          Text(_searchReminder,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300))
        ]));
  }

//  void _onRefresh() async {
//    await Future.delayed(Duration(milliseconds: 1000));
//    setState(() {});
//    _refreshController.refreshCompleted();
//  }

//  void _onLoading() async {
//    await Future.delayed(Duration(milliseconds: 1000));
//    setState(() {});
//    _refreshController.loadComplete();
//  }

//  Widget buildList(int num) => buildCard(context, num);

//  Widget buildCard(BuildContext context, int index) => generateScrollView();

//  Widget buildCard(BuildContext context, int index) => new generateScrollView();//width: 300,height: 80,color: Colors.yellow,child: generateBody());//child: generateBody()

  Widget generateBody() {
    return new Column(
      children: <Widget>[
//        new SimpleLinkBar(key: linkKey),
        this.generateScrollView(),
      ],
    );
//    return new SimpleLinkBar(key: linkKey);
//    return this.generateRefresher();
  }

  Widget generateScrollView() {
    return new NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          new SliverToBoxAdapter(
            child: new UserTaskPageFlexible(),
          ),
          new SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: new Container(
                child: new SliverAppBar(
                  backgroundColor: innerBoxIsScrolled ? Color(0xFF2D3447) : Colors.grey[100],
//                  shape: RoundedRectangleBorder(
//                      borderRadius: new BorderRadius.circular(18.0),
//                      side: BorderSide(color: Colors.red)),
                  forceElevated: false,
                  pinned: true,
                  expandedHeight: 0,
                  titleSpacing: 0,
                  automaticallyImplyLeading: false,
                  title: new Container(
                    alignment: Alignment.center,
                    child: new TabBarNoRipple(
                        controller: _controller,
                        isScrollable: true,
                        indicatorWeight: 2,
                        indicatorPadding:
                        EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 0),
                        indicatorColor: Colors.yellow[700],
                        labelColor: Colors.yellow[700],
                        unselectedLabelColor: Colors.grey,
                        labelStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        tabs: this.generateCategoryWidgetRecommend()),
                  ),
                )
              )
              )
        ];
      },
      body: new TabBarView(
        controller: _controller,
          children: this.generateTabView()
      ),
    );
  }
}

class MainPagePanel extends StatelessWidget {
  /// [height] and [width] described the size of panel
  ///
  double height;
  double width;

  /// [type] represents the how's the panel's format
  /// Defined by the following rules:
  ///
  /// The odd digits represents how many parts are in the same row
  /// The even digits represents the specific functionality of the part
  ///
  /// Be more detail
  /// we assume:
  /// 0 ~~~~ icon + name
  /// 1 ~~~~ icon + name + short desc
  /// 2 ~~~~ image + name
  /// 3 ~~~~ image + name + short desc
  /// 4 ~~~~ image + name + short desc + tag(with color)
  /// 5 ~~~~ image + desc
  /// 6 ~~~~ desc + number
  ///
  int type;

  /// [info] contains information of panels
  ///
  List<_MainPagePanelInfo> info = List<_MainPagePanelInfo>();

  MainPagePanel({this.height, this.width, this.type});

  /// The build function will deal with serial typical situations.
  /// The others will be left for general algorithm.
  /// TODO: main page panel generation algorithm
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: this.width,
      height: this.height,
      decoration: new BoxDecoration(
          borderRadius:
              BorderRadius.circular(0.1 * (this.width + this.height))),
    );
  }
}

class _MainPagePanelInfo {
  String name;
  String desc;
  String tag;
  String numDesc;

  String icon;
  String image;

  Color tagColor;
  int num;

  _MainPagePanelInfo(this.name, this.desc, this.tag, this.numDesc, this.icon,
      this.image, this.tagColor, this.num);
}

class UserTaskPageFlexible extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserTaskPageFlexibleState();
  }
}

class UserTaskPageFlexibleState extends State<UserTaskPageFlexible> {
  int cupertinoTabBarValue = 3;

  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Container(
          height: 380,
          decoration: BoxDecoration(color: Colors.grey[100]),
        ),
        new Container(
            height: 120,
            decoration: new BoxDecoration(
                color: Color(0xFF2D3447),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)))),
        new Column(
          children: <Widget>[
            new Container(
              width: 500,
              padding: EdgeInsets.only(top: 30, left: 15, right: 15),
//                child: GenerateCupertinoTab()
            ),
            SizedBox(height: 20),
            new Container(
              width: 500,
              padding: EdgeInsets.only(top: 150),
              margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.5),
                    blurRadius: 1.5,
                    spreadRadius: 0.5)
              ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
            ),
            SizedBox(height: 20),
            new Container(
              width: 500,
//              height: 400,
              padding: EdgeInsets.only(top: 150),
              margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.2),
                    blurRadius: 1.5,
                    spreadRadius: 0.5)
              ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
            ),
          ],
        )
      ],
    );
  }

}

class SimpleLinkBar extends StatefulWidget {
  SimpleLinkBar({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SimpleLinkBarState();
}

class _SimpleLinkBarState extends State<SimpleLinkBar>
    with RefreshProcessor, SingleTickerProviderStateMixin {
  RefreshStatus _status = RefreshStatus.idle;
  AnimationController _animationController;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Future endRefresh() {
    _animationController.animateTo(0.0, duration: Duration(milliseconds: 300));
    return Future.value();
  }

  @override
  void onOffsetChange(double offset) {
    if (_status != RefreshStatus.refreshing)
      _animationController.value = offset / 80.0;
    super.onOffsetChange(offset);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      child: CupertinoActivityIndicator(),
      scale: _animationController,
    );
  }

  @override
  void onModeChange(RefreshStatus mode) {
    super.onModeChange(mode);
    _status = mode;
    setState(() {});
  }
}
