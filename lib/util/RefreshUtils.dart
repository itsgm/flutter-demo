import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_youlu/base/translations.dart';

class RefreshUtils {



  static ClassicsHeader buildClassicsHeader(BuildContext context,GlobalKey<RefreshHeaderState> _headerKey) {
    return ClassicsHeader(
      key: _headerKey,
      refreshText: Translations.of(context).text("pullToRefresh"),
      refreshReadyText: Translations.of(context).text("releaseToRefresh"),
      refreshingText: Translations.of(context).text("refreshing") + "...",
      refreshedText: Translations.of(context).text("refreshed"),
      moreInfo: Translations.of(context).text("updateAt"),
      bgColor: Colors.transparent,
      textColor: Colors.black87,
      moreInfoColor: Colors.black54,
      showMore: true,
    );
  }

  static ClassicsFooter buildClassicsFooter(BuildContext context,GlobalKey<RefreshFooterState> _footerKey) {
    return ClassicsFooter(
      key: _footerKey,
      loadText: Translations.of(context).text("pushToLoad"),
      loadReadyText: Translations.of(context).text("releaseToLoad"),
      loadingText: Translations.of(context).text("loading"),
      loadedText: Translations.of(context).text("loaded"),
      noMoreText: Translations.of(context).text("noMore"),
      moreInfo: Translations.of(context).text("updateAt"),
      bgColor: Colors.transparent,
      textColor: Colors.black87,
      moreInfoColor: Colors.black54,
      showMore: true,
    );
  }
}
