class User {

  String id;
  String nickname;
  String imgProfile;

  User({
    String id,
    String nickname,
    String imgProfile,
  }) {
    this.id = id;
    this.nickname = nickname;
    this.imgProfile = imgProfile;
  }

  static User fromJson(json) {
    User user;
    if(json != null) {
      user = new User(
        id: json['_id'],
        nickname: json['nickname'],
        imgProfile: json['imgProfile']
      );
    }
    return user;
  }

  static List<User> fromJsonList(Iterable data) {
    List<User> list = [];
    for (var e in data) list.add(fromJson(e));
    return list;
  }

}