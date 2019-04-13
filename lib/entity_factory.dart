import 'package:flutter_youlu/model/article_list_entity.dart';
import 'package:flutter_youlu/model/article_title_entity.dart';
import 'package:flutter_youlu/model/banner_model_entity.dart';
import 'package:flutter_youlu/model/home_list_entity.dart';
import 'package:flutter_youlu/model/native_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "ArticleListEntity") {
      return ArticleListEntity.fromJson(json) as T;
    } else if (T.toString() == "ArticleTitleEntity") {
      return ArticleTitleEntity.fromJson(json) as T;
    } else if (T.toString() == "BannerModelEntity") {
      return BannerModelEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeListEntity") {
      return HomeListEntity.fromJson(json) as T;
    } else if (T.toString() == "NativeEntity") {
      return NativeEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}