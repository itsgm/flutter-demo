import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_youlu/http/Api.dart';
import 'package:flutter_youlu/http/HttpUtil.dart';
import 'package:flutter_youlu/model/article_list_entity.dart';
import 'package:flutter_youlu/model/article_title_entity.dart';
import 'package:flutter_youlu/util/RefreshUtils.dart';

class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Page();
  }
}
//用于使用到了一点点的动画效果，因此加入了SingleTickerProviderStateMixin
class Page extends State<FindPage> with TickerProviderStateMixin {

  TabController _controller;
  List<ArticleTitleData> datas = new List();

  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    //动画效果的异步处理，默认格式，背下来即可
    _controller = new TabController(vsync: this, length: datas!=null ? datas.length : 0);
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.4,
        title: new TabBar(
          controller: _controller,
          tabs: datas.map((ArticleTitleData item){
            return Tab(text: item.name,);
          }).toList(),
          isScrollable: true,   //水平滚动的开关，开启后Tab标签可自适应宽度并可横向拉动，关闭后每个Tab自动压缩为总长符合屏幕宽度的等宽，默认关闭
        ),
      ),
      body:new TabBarView(
        controller: _controller,
        children: datas.map((item) {
          return NewsList(id: item.id,);
        }).toList(),
      ),
    );
  }

  //当整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadTitle();
  }

  void loadTitle() async{
    Response<String> response =
        await HttpUtil().get(Api.WXARTICLE);
    Map userMap = json.decode(response.data);
    ArticleTitleEntity bannerEntity = new ArticleTitleEntity.fromJson(userMap);
    setState(() {
//      _easyRefreshKey.currentState.callRefreshFinish();
      datas = bannerEntity.data;
    });
  }
}

class NewsList extends StatefulWidget{
  final int id;
  @override
  NewsList({Key key, this.id} ):super(key:key);

  _NewsListState createState() => new _NewsListState();
}

class _NewsListState extends State<NewsList>{
  List<ArticleListDataData> _datas  = new List();
  int _page = 1; //加载的页数
  GlobalKey<EasyRefreshState> _easyRefreshKey =
  new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey = new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();


  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<Null> _getData() async{
    int _id = widget.id;
    Response<String> response =
    await HttpUtil().get(Api.BaseUrl + "/wxarticle/list/" +  "$_id/$_page/json");
    Map userMap = json.decode(response.data);
    ArticleListEntity bannerEntity = new ArticleListEntity.fromJson(userMap);
    setState(() {
//      _easyRefreshKey.currentState.callRefreshFinish();
      if(_page == 1) {
        _datas = bannerEntity.data.datas;
        print(_datas!=null ? _datas.length : 0);
      }else{
        _datas.addAll(bannerEntity.data.datas);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new EasyRefresh(
        key: _easyRefreshKey,
        behavior: ScrollOverBehavior(),
//        autoControl: false,
        refreshHeader: RefreshUtils.buildClassicsHeader(context, _headerKey),
        refreshFooter: RefreshUtils.buildClassicsFooter(context,_footerKey),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: _renderRow,
          itemCount: _datas!=null ? _datas.length : 0,
//          controller: _scrollController,
        ),
        onRefresh: () async {
          _page = 1;
          _getData();
        },
        loadMore: () async {
          _page++;
          _getData();
        },
      ),
    );
  }

  Widget _renderRow(BuildContext context, int index) {
      return _newsRow(_datas[index]);
  }

  Widget _newsRow(ArticleListDataData item){
    return InkWell(
      onTap: (){
//        RouteUtil.toWebView(context, item.title, item.link);
      },
      child: new Card(
        child: new Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(16,8,16,8),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(item.title,
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        )
                    )
                  ],
                )
            ),

            new Container(
                padding: EdgeInsets.fromLTRB(16,0,16,8),
                child:new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Expanded(
                      child: new Text(item.publishtime.toString(),
                        style: TextStyle(fontSize: 12,color: Colors.grey),
                      ),
                    ),
                  ],
                )),

          ],
        ),
      ),
    );
  }
}
