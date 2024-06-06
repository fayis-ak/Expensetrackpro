class FeedBackModel {
  String name;
  String email;
  int exeperinece;
  String suggest;
  String? id;
  String uid;

  FeedBackModel({
    required this.name,
    required this.email,
    required this.exeperinece,
    required this.suggest,
    required this.uid,
    this.id,
  });

  Map<String, dynamic> tojsone(idd) => {
        'Name': name,
        'Email': email,
        'Experience': exeperinece,
        'Suggest': suggest,
        'uid': uid,
        'id': idd
      };

  factory FeedBackModel.fromjsone(Map<String, dynamic> jsone) {
    return FeedBackModel(
      name: jsone['Name'],
      email: jsone['Email'],
      exeperinece: jsone['Experience'],
      suggest: jsone['Suggest'],
      uid: jsone['uid'],
      id: jsone['id'],
    );
  }
}
