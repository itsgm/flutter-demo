class HomeListEntity {
	HomeListData data;
	int errorcode;
	String errormsg;

	HomeListEntity({this.data, this.errorcode, this.errormsg});

	HomeListEntity.fromJson(Map<String, dynamic> json) {
		data = json['data'] != null ? new HomeListData.fromJson(json['data']) : null;
		errorcode = json['errorCode'];
		errormsg = json['errorMsg'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['errorCode'] = this.errorcode;
		data['errorMsg'] = this.errormsg;
		return data;
	}
}

class HomeListData {
	bool over;
	int pagecount;
	int total;
	int curpage;
	int offset;
	int size;
	List<HomeListDataData> datas;

	HomeListData({this.over, this.pagecount, this.total, this.curpage, this.offset, this.size, this.datas});

	HomeListData.fromJson(Map<String, dynamic> json) {
		over = json['over'];
		pagecount = json['pageCount'];
		total = json['total'];
		curpage = json['curPage'];
		offset = json['offset'];
		size = json['size'];
		if (json['datas'] != null) {
			datas = new List<HomeListDataData>();
			(json['datas'] as List).forEach((v) { datas.add(new HomeListDataData.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['over'] = this.over;
		data['pageCount'] = this.pagecount;
		data['total'] = this.total;
		data['curPage'] = this.curpage;
		data['offset'] = this.offset;
		data['size'] = this.size;
		if (this.datas != null) {
      data['datas'] = this.datas.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class HomeListDataData {
	String superchaptername;
	int publishtime;
	int visible;
	String nicedate;
	String projectlink;
	String author;
	String prefix;
	int zan;
	String origin;
	String chaptername;
	String link;
	String title;
	int type;
	int userid;
	List<HomeListDataDatasTag> tags;
	String apklink;
	String envelopepic;
	int chapterid;
	int superchapterid;
	int id;
	bool fresh;
	bool collect;
	int courseid;
	String desc;

	HomeListDataData({this.superchaptername, this.publishtime, this.visible, this.nicedate, this.projectlink, this.author, this.prefix, this.zan, this.origin, this.chaptername, this.link, this.title, this.type, this.userid, this.tags, this.apklink, this.envelopepic, this.chapterid, this.superchapterid, this.id, this.fresh, this.collect, this.courseid, this.desc});

	HomeListDataData.fromJson(Map<String, dynamic> json) {
		superchaptername = json['superChapterName'];
		publishtime = json['publishTime'];
		visible = json['visible'];
		nicedate = json['niceDate'];
		projectlink = json['projectLink'];
		author = json['author'];
		prefix = json['prefix'];
		zan = json['zan'];
		origin = json['origin'];
		chaptername = json['chapterName'];
		link = json['link'];
		title = json['title'];
		type = json['type'];
		userid = json['userId'];
		if (json['tags'] != null) {
			tags = new List<HomeListDataDatasTag>();
			(json['tags'] as List).forEach((v) { tags.add(new HomeListDataDatasTag.fromJson(v)); });
		}
		apklink = json['apkLink'];
		envelopepic = json['envelopePic'];
		chapterid = json['chapterId'];
		superchapterid = json['superChapterId'];
		id = json['id'];
		fresh = json['fresh'];
		collect = json['collect'];
		courseid = json['courseId'];
		desc = json['desc'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['superChapterName'] = this.superchaptername;
		data['publishTime'] = this.publishtime;
		data['visible'] = this.visible;
		data['niceDate'] = this.nicedate;
		data['projectLink'] = this.projectlink;
		data['author'] = this.author;
		data['prefix'] = this.prefix;
		data['zan'] = this.zan;
		data['origin'] = this.origin;
		data['chapterName'] = this.chaptername;
		data['link'] = this.link;
		data['title'] = this.title;
		data['type'] = this.type;
		data['userId'] = this.userid;
		if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
		data['apkLink'] = this.apklink;
		data['envelopePic'] = this.envelopepic;
		data['chapterId'] = this.chapterid;
		data['superChapterId'] = this.superchapterid;
		data['id'] = this.id;
		data['fresh'] = this.fresh;
		data['collect'] = this.collect;
		data['courseId'] = this.courseid;
		data['desc'] = this.desc;
		return data;
	}
}

class HomeListDataDatasTag {
	String name;
	String url;

	HomeListDataDatasTag({this.name, this.url});

	HomeListDataDatasTag.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['url'] = this.url;
		return data;
	}
}
