
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youlu/http/Api.dart';
import 'package:cipher2/cipher2.dart';


class HttpUtil{

  static HttpUtil instance;
  Dio dio;
  Options options;

  static HttpUtil getInstance(){
    if(HttpUtil == null){
      instance = new HttpUtil();
    }
    return instance;
  }

  HttpUtil(){
    // 通过传递一个 `options`来创建dio实例
    dio = new Dio(new BaseOptions(
      // 请求基地址,可以包含子路径，如: "https://www.google.com/api/".
      baseUrl: "http://gank.io",
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,

      ///  响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过[receiveTimeout]，
      ///  [Dio] 将会抛出一个[DioErrorType.RECEIVE_TIMEOUT]的异常.
      ///  注意: 这并不是接收数据的总时限.
      receiveTimeout: 3000,
      responseType: ResponseType.json,
      headers: {"ClientType": "0", "APPType": "1"},
    ));
  }

  Future<Response<String>> post(url, {data,cancelToken}) async {
    Response<String> response;
    try {
      response = await dio.post(
        url,
        data: data,
        cancelToken: cancelToken,
      );
      print(response.data);
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('post请求取消! ' + e.message);
      }
      print('post请求发生错误：$e');
    }
    return response;
  }

  Future<Response<String>> get(url) async {
    Response<String> response;
    try {
      response = await dio.get(
        url
      );
      print('get请求成功!response.data：${response.data}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      }
      print('get请求发生错误：$e');
    }
    return response;
  }

}