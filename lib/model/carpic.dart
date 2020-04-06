class CarPic {
  String picUrl;
  String content;

  CarPic({this.picUrl, this.content});

  CarPic.fromJson(Map<String, dynamic> json) {
    picUrl = json['pic_url'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pic_url'] = this.picUrl;
    data['content'] = this.content;
    return data;
  }
}