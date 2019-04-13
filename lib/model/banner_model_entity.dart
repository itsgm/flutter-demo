class BannerModelEntity {
	List<BannerModelData> data;
	int errorcode;
	String errormsg;

	BannerModelEntity({this.data, this.errorcode, this.errormsg});

	BannerModelEntity.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = new List<BannerModelData>();
			(json['data'] as List).forEach((v) { data.add(new BannerModelData.fromJson(v)); });
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

class BannerModelData {
	String imagepath;
	int id;
	int isvisible;
	String title;
	int type;
	String url;
	String desc;
	int order;

	BannerModelData({this.imagepath, this.id, this.isvisible, this.title, this.type, this.url, this.desc, this.order});

	BannerModelData.fromJson(Map<String, dynamic> json) {
		imagepath = json['imagePath'];
		id = json['id'];
		isvisible = json['isVisible'];
		title = json['title'];
		type = json['type'];
		url = json['url'];
		desc = json['desc'];
		order = json['order'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['imagePath'] = this.imagepath;
		data['id'] = this.id;
		data['isVisible'] = this.isvisible;
		data['title'] = this.title;
		data['type'] = this.type;
		data['url'] = this.url;
		data['desc'] = this.desc;
		data['order'] = this.order;
		return data;
	}
}
