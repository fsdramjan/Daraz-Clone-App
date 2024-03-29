class ProfileModel {
  bool? result;
  int? id;
  String? name;
  String? email;
  String? avatar;
  String? avatarOriginal;
  String? phone;

  ProfileModel(
      {this.result,
      this.id,
      this.name,
      this.email, 
      this.avatar,
      this.avatarOriginal,
      this.phone});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    avatarOriginal = json['avatar_original'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['avatar_original'] = this.avatarOriginal;
    data['phone'] = this.phone;
    return data;
  }
}
