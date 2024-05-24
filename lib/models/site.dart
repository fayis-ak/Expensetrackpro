class Site {
  String Sitename;
  String? id;
  String userid;

  Site({required this.Sitename, this.id, required this.userid});

  Map<String, dynamic> toJson(uid) => {
        'SiteName': Sitename,
        'id': uid,
        'userid': userid,
      };

  factory Site.fromJsone(Map<String, dynamic> json) {
    return Site(
      Sitename: json['SiteName'],
      id: json['id'],
      userid: json['userid'],
    );
  }
}
