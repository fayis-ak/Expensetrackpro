class NotificationModel {
  String uid;
  String msg;

  NotificationModel({
    required this.uid,
    required this.msg,
  });

  Map<String, dynamic> tojasone() => {
        'uid': uid,
        'msg': msg,
      };

  factory NotificationModel.fromjsone(Map<String, dynamic> jsone) {
    return NotificationModel(
      uid: jsone['uid'],
      msg: jsone['msg'],
    );
  }
}
