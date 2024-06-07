class Addsalerymodel {
  String userid;
  String salery;
  String saleryadddate;
  String incetive;
  String note;
  String? id;

  Addsalerymodel({
    required this.userid,
    required this.salery,
    required this.saleryadddate,
    required this.incetive,
    required this.note,
    this.id,
  });

  Map<String, dynamic> tojsone(idd) => {
        'userid': userid,
        'salery': salery,
        'saleryadddate': saleryadddate,
        'incentive': incetive,
        'note': note,
        'id': idd,
      };
  factory Addsalerymodel.fromjsone(Map<String, dynamic> jsone) {
    return Addsalerymodel(
      userid: jsone['userid'],
      salery: jsone['salery'],
      saleryadddate: jsone['saleryadddate'],
      incetive: jsone['incentive'],
      note: jsone['note'],
      id: jsone['id'],
    );
  }
}
