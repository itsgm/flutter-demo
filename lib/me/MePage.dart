import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_youlu/http/Api.dart';
import 'package:flutter_youlu/http/HttpUtil.dart';
import 'package:flutter_youlu/model/native_entity.dart';
import 'package:flutter_youlu/util/HomeWebview.dart';
import 'package:flutter_youlu/util/RefreshUtils.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Page();
  }
}

class Page extends State<MinePage> {

  List<NativeData> _datas = new List();
  GlobalKey<EasyRefreshState> _easyRefreshKey =
  new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey = new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();

  @override
  void initState() {
    // TODO: implement initState
    _getData();
  }
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: buildAppBar(context),
      body: new EasyRefresh(
        key: _easyRefreshKey,
        behavior: ScrollOverBehavior(),
//        autoControl: false,
        refreshHeader: RefreshUtils.buildClassicsHeader(context, _headerKey),
        refreshFooter: RefreshUtils.buildClassicsFooter(context,_footerKey),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: _renderContent,
          itemCount: _datas!=null ? _datas.length : 0,
//          controller: _scrollController,
        ),
        onRefresh: () async {
          _getData();
        },
//        loadMore: () async {
//          _page++;
//          _getData();
//        },
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(title: const Text('导航'));
  }

  void _getData() async{
    Response<String> response = await HttpUtil().get(Api.NAVI_LIST);

    Map userMap = json.decode(response.data);
    NativeEntity bannerEntity = new NativeEntity.fromJson(userMap);
    setState(() {
      _datas = bannerEntity.data;
    });
  }


  Widget _renderContent(BuildContext context, int index) {
    return Container(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  _datas[index].name,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: buildChildren(_datas[index].articles)),
            ],
          ),
        ));
  }


  Widget buildChildren(List<NativeDataArticle> children) {
    List<Widget> tiles = []; //先建一个数组用于存放循环生成的widget
    Widget content; //单独一个widget组件，用于返回需要生成的内容widget
    for (var item in children) {
      tiles.add(new InkWell(
        child: new Chip(
          label: new Text(item.title),
        ),
        onTap: () async {
          await Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
            return new HomeWebview(
              message: item.link,
              title: item.title,
            );
          }));
        },
      ));
    }

    content = Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        alignment: WrapAlignment.start,
        children: tiles);

    return content;
  }
}