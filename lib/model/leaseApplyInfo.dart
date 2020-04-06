class LeaseApplyResult {
  int code;
  String msg;

  LeaseApplyResult({this.code, this.msg});

  LeaseApplyResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    return data;
  }
}