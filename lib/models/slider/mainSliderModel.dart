class MainSliderModel {
  List<Data>? data;
  bool? success;
  int? status;

  MainSliderModel({this.data, this.success, this.status});

  MainSliderModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? photo;
  dynamic url;

  Data({this.photo, this.url});

  Data.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.photo;
    data['url'] = this.url;
    return data;
  }
}
