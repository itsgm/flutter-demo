import 'package:flutter/material.dart';

class MyBottomBar extends StatefulWidget{

  final int index;
  final ValueChanged<int> onChanged;

  const MyBottomBar({Key key, this.index = 0, this.onChanged}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new MyBottomBarState();
  }

}

class MyBottomBarState extends State<MyBottomBar> with AutomaticKeepAliveClientMixin<MyBottomBar>{

  int _tabIndex = 0;
  var tabImages = [
    [Image.asset('images/icon_main_home.png'), Image.asset('images/icon_main_home_selected.png')],
    [Image.asset('images/icon_main_finder.png'), Image.asset('images/icon_main_finder_selected.png')],
    [Image.asset('images/icon_main_center.png'), Image.asset('images/icon_main_center_selected.png')]
  ];
  var appBarTitles = ['首页', '发现', '我的'];

  @override
  Widget build(BuildContext context) {
    return new BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            icon: getTabIcon(0), title: getTabTitle(0)),
        new BottomNavigationBarItem(
            icon: getTabIcon(1), title: getTabTitle(1)),
        new BottomNavigationBarItem(
            icon: getTabIcon(2), title: getTabTitle(2)),
      ],
      type: BottomNavigationBarType.fixed,
      //默认选中首页
      currentIndex: _tabIndex,
      iconSize: 24.0,
      //点击事件
      onTap: _onTapHandler,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  /*
   * 根据选择获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: Colors.blue));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff515151)));
    }
  }

  void _onTapHandler(int index) {
    setState(() {
      _tabIndex = index;
    });
    widget.onChanged(index);
  }
}