class CategoryMd {
  String category;
  String? id;
  String userid;

  CategoryMd({required this.category, this.id, required this.userid});

  Map<String, dynamic> toJson(uid) => {
        'Category': category,
        'id': uid,
        'userid': userid,
      };

  factory CategoryMd.fromJsone(Map<String, dynamic> json) {
    return CategoryMd(
      category: json['Category'],
      id: json['id'],
      userid: json['userid'],
    );
  }
}
