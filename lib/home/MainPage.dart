import 'package:flutter/material.dart';
import 'package:flutter_youlu/find/FindPage.dart';
import 'package:flutter_youlu/home/HomePage.dart';
import 'package:flutter_youlu/home/MyBottomBar.dart';
import 'package:flutter_youlu/me/MePage.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MainPageWidget();
  }
}

class MainPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPageWidget> {
  int _tabIndex = 0;

  /*
   * 存放三个页面，跟fragmentList一样
   */
  var _pageList = [
    new HomePage('123'),
    new FindPage(),
    new MinePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        child: Scaffold(
//        body: _pageList[_tabIndex],
          body: IndexedStack(
            index: _tabIndex,
            children: _pageList,
          ),
          bottomNavigationBar: new MyBottomBar(
            index: _tabIndex,
            onChanged: (index) {
              setState(() {
                _tabIndex = index;
              });
            },
          ),
        ),
        onWillPop: _onWillPop);
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('提示'),
        content: new Text('确定退出应用吗？'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('再看一会'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('退出'),
          ),
        ],
      ),
    ) ?? false;
  }
}
