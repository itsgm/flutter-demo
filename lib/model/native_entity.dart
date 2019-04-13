class NativeEntity {
	List<NativeData> data;
	int errorcode;
	String errormsg;

	NativeEntity({this.data, this.errorcode, this.errormsg});

	NativeEntity.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = new List<NativeData>();
			(json['data'] as List).forEach((v) { data.add(new NativeData.fromJson(v)); });
		}
		errorcode = json['errorCode'];
		errormsg = json['errorMsg'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
		data['errorCode'] = this.errorcode;
		data['errorMsg'] = this.errormsg;
		return data;
	}
}

class NativeData {
	String name;
	List<NativeDataArticle> articles;
	int cid;

	NativeData({this.name, this.articles, this.cid});

	NativeData.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		if (json['articles'] != null) {
			articles = new List<NativeDataArticle>();
			(json['articles'] as List).forEach((v) { articles.add(new NativeDataArticle.fromJson(v)); });
		}
		cid = json['cid'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		if (this.articles != null) {
      data['articles'] = this.articles.map((v) => v.toJson()).toList();
    }
		data['cid'] = this.cid;
		return data;
	}
}

class NativeDataArticle {
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
	List<Null> tags;
	String apklink;
	String envelopepic;
	int chapterid;
	int superchapterid;
	int id;
	bool fresh;
	bool collect;
	int courseid;
	String desc;

	NativeDataArticle({this.superchaptername, this.publishtime, this.visible, this.nicedate, this.projectlink, this.author, this.prefix, this.zan, this.origin, this.chaptername, this.link, this.title, this.type, this.userid, this.tags, this.apklink, this.envelopepic, this.chapterid, this.superchapterid, this.id, this.fresh, this.collect, this.courseid, this.desc});

	NativeDataArticle.fromJson(Map<String, dynamic> json) {
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
			tags = new List<Null>();
//			(json['tags'] as List).forEach((v) { tags.add(new Null.fromJson(v)); });
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
//      data['tags'] = this.tags.map((v) => v.toJson()).toList();
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
