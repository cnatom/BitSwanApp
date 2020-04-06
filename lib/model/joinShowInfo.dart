class JoinShowInfo {
  int code;
  List<Msg> msg;

  JoinShowInfo({this.code, this.msg});

  JoinShowInfo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['msg'] != null) {
      msg = new List<Msg>();
      json['msg'].forEach((v) {
        msg.add(new Msg.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.msg != null) {
      data['msg'] = this.msg.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Msg {
  String name;
  String qq;
  String department;
  String grade;
  String description;

  Msg({this.name, this.qq, this.department, this.grade, this.description});

  Msg.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    qq = json['qq'];
    department = json['department'];
    grade = json['grade'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['qq'] = this.qq;
    data['department'] = this.department;
    data['grade'] = this.grade;
    data['description'] = this.description;
    return data;
  }
}