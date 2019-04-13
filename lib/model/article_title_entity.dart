class ArticleTitleEntity {
	List<ArticleTitleData> data;
	int errorcode;
	String errormsg;

	ArticleTitleEntity({this.data, this.errorcode, this.errormsg});

	ArticleTitleEntity.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = new List<ArticleTitleData>();
			(json['data'] as List).forEach((v) { data.add(new ArticleTitleData.fromJson(v)); });
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

class ArticleTitleData {
	int visible;
	List<Null> children;
	String name;
	bool usercontrolsettop;
	int id;
	int courseid;
	int parentchapterid;
	int order;

	ArticleTitleData({this.visible, this.children, this.name, this.usercontrolsettop, this.id, this.courseid, this.parentchapterid, this.order});

	ArticleTitleData.fromJson(Map<String, dynamic> json) {
		visible = json['visible'];
		if (json['children'] != null) {
			children = new List<Null>();
//			(json['children'] as List).forEach((v) { children.add(new Null.fromJson(v)); });
		}
		name = json['name'];
		usercontrolsettop = json['userControlSetTop'];
		id = json['id'];
		courseid = json['courseId'];
		parentchapterid = json['parentChapterId'];
		order = json['order'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['visible'] = this.visible;
		if (this.children != null) {
//      data['children'] = this.children.map((v) => v.toJson()).toList();
    }
		data['name'] = this.name;
		data['userControlSetTop'] = this.usercontrolsettop;
		data['id'] = this.id;
		data['courseId'] = this.courseid;
		data['parentChapterId'] = this.parentchapterid;
		data['order'] = this.order;
		return data;
	}
}
