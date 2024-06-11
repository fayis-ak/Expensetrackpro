class AdminNotification {
  String NotiTitile;
  String NotiSubtitle;
  String? id;

  AdminNotification({
    required this.NotiTitile,
    required this.NotiSubtitle,
    this.id,
  });

  Map<String, dynamic> tojsone(idd) => {
        'NotiTitle': NotiTitile,
        "NotiSubTitle": NotiSubtitle,
        'id': idd,
      };

  factory AdminNotification.fromjsone(Map<String, dynamic> jsone) {
    return AdminNotification(
      NotiTitile: jsone['NotiTitle'],
      NotiSubtitle: jsone['NotiSubTitle'],
      id: jsone['idd'],
    );
  }
}
