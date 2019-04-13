import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_youlu/http/Api.dart';
import 'package:flutter_youlu/http/HttpUtil.dart';
import 'package:flutter_youlu/model/banner_model_entity.dart';
import 'package:flutter_youlu/model/home_list_entity.dart';
import 'package:flutter_youlu/util/HomeWebview.dart';
import 'package:flutter_youlu/util/RefreshUtils.dart';

class HomePage extends StatefulWidget {
  String message;

  HomePage(String message) {
    this.message = message;
  }

  @override
  State<StatefulWidget> createState() {
    return HomeFragmentState(message);
  }
}

class HomeFragmentState extends State<HomePage> {
  String message;
  List<BannerModelData> bannerData;
  List<HomeListDataData> homeListData = new List();
  int page = 0;
  GlobalKey<EasyRefreshState> _easyRefreshKey = new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey = new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();
  HomeFragmentState(String message) {
    this.message = message;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:
            Text('首页', style: new TextStyle(color: Colors.black, fontSize: 20)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body:Container(child: new EasyRefresh(
        key: _easyRefreshKey,
        behavior: ScrollOverBehavior(),
        autoControl: false,
        refreshHeader: RefreshUtils.buildClassicsHeader(context, _headerKey),
        refreshFooter: RefreshUtils.buildClassicsFooter(context,_footerKey),
        child: initList(),
        onRefresh: () async {
          page = 1;
          loadList();
        },
        loadMore: () async {
          page++;
          loadList();
        },
      ),),
    );
  }

  @override
  void initState() {
    super.initState();
    loadBanner();
    loadList();
  }

  initTop() {
    return Container(
        color: Colors.white,
//        margin: EdgeInsets.only(top: 0),
        height: 200.0,
        child: Swiper(
          containerHeight: 200.0,
          itemHeight: 200.0,
          itemBuilder: (BuildContext context, int index) {
            return (Image.network(
              bannerData == null ? 0 : bannerData[index].imagepath,
              fit: BoxFit.fill,
            ));
          },
          itemCount: bannerData == null ? 0 : bannerData.length,
          pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                  color: Colors.grey,
                  activeColor: Colors.blue,
                  size: 7.0,
                  activeSize: 7.0)),
          scrollDirection: Axis.horizontal,
          autoplay: true,
          onTap: (index) {
            Navigator.of(context)
                .push(new MaterialPageRoute(builder: (context) {
              return new HomeWebview(
                message: bannerData[index].url,
                title: bannerData[index].title,
              );
            }));
          },
        ));
  }

  initList() {
    return ListView.separated(
        itemBuilder: _renderRow,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.black45,
            height: 0.5,
          );
        },
        itemCount: homeListData == null ? 0 : homeListData.length + 1);
  }

  Future loadBanner() async {
    Response<String> response =
        await HttpUtil().get(Api.BaseUrl + '/banner/json');
    Map userMap = json.decode(response.data);
    BannerModelEntity bannerEntity = new BannerModelEntity.fromJson(userMap);
    setState(() {
      _easyRefreshKey.currentState.callRefreshFinish();
      bannerData = bannerEntity.data;
    });
  }

  void loadList() async {
    Response<String> response = await HttpUtil()
        .get(Api.BaseUrl + "/article/list/" + page.toString() + "/json");
    Map userMap = json.decode(response.data);
    HomeListEntity homeListEntity = new HomeListEntity.fromJson(userMap);
    setState(() {
      if (page == 0) {
        homeListData.clear();
        homeListData.addAll(homeListEntity.data.datas);
        _easyRefreshKey.currentState.callRefreshFinish();
      } else {
        homeListData.addAll(homeListEntity.data.datas);
        _easyRefreshKey.currentState.callLoadMoreFinish();
      }
    });
  }

  Widget _renderRow(BuildContext context, int index) {
    if (index == 0) {
      return Container(
        child: initTop(),
      );
    }
    return new InkWell(
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
          return new HomeWebview(
            message: homeListData[index - 1].link,
            title: homeListData[index - 1].title,
          );
        }));
      },
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: <Widget>[
                  Text(
                    homeListData[index - 1].author,
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.left,
                  ),
                  Expanded(
                      child: Text(
//                        TimelineUtil.format(),
                    homeListData[index - 1].publishtime.toString(),
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 12),
                  )),
                ],
              )),
          Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    homeListData[index - 1].title,
                    maxLines: 2,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ))
                ],
              )),
          Container(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Row(
                children: <Widget>[
                  Text(
                    homeListData[index - 1].superchaptername,
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.left,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
