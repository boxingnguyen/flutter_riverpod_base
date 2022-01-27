class UserDetail {
  String? email;
  String? photoUrl;
  String? displayName;
  UserDetail({
    this.email,
    this.photoUrl,
    this.displayName,
  });

  UserDetail.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    photoUrl = json['photoUrl'];
    email = json['email'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['displayName'] = displayName;
    data['email'] = email;
    data['photoUrl'] = photoUrl;

    return data;
  }
}