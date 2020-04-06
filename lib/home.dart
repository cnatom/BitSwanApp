//主页
//上面是轮播图
//下面显示设备信息
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutterapp/global.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterapp/lease.dart';
import 'package:flui/flui.dart';

import 'model/carpic.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  //获取轮播图json数据
  getCarpic() async {
    Response res;
    Dio dio = Dio();
    //配置dio信息
    res = await dio.get(
      "http://batswan.design:9000/get_pics",
    );
    //Json解码为Map
    List responseJson = jsonDecode(res.toString());
    Global.photos = responseJson.map((m) => new CarPic.fromJson(m)).toList();
    setState(() {});
  }

  void initState() {
    getCarpic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: FLAppBarTitle(
              title: '欢迎来到烛光文化工作室',
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.67,
              child: Swiper(
                itemBuilder: _swiperBuilder,
                itemCount: 4,
                pagination: new SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.black54,
                      activeColor: Colors.white,
                    )),
                scrollDirection: Axis.horizontal,
                autoplay: true,
              ),
            ),
            _expandTile('images/1.png','便携式充电蓝牙音响',"120/天（次）","一到两个话筒",'快闪，野外活动，公教小活动','无'),
            _expandTile('images/2.png','卡包音响',"280/天（次）","一对音响",'适用大中小型教室活动','无'),
            _expandTile('images/3.png','大型音响',"580/天（次）","一对音响，两只麦克风，调音台，功放，线圈",'室外运动会、室内晚会等','配麦架'),
            _expandTile('images/4.png','电容麦克',"60/天（次）","无线麦克风（两只起）",'大型活动，讲话，文艺活动','无'),
            _expandTile('images/5.png','有线麦克',"30/天（次）","有线麦克风（5米）",'演讲、主持、歌唱等','无'),
            _expandTile('images/6.png','头戴式耳麦',"60/天（次）","无线耳麦",'相声话剧类活动','无'),
          ]),
        ));
  }
  //开展闭合组件
  Widget _expandTile(String image,String name,String money,String content,String scope,String remark){
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child:  ExpansionTile(
          backgroundColor: Colors.white,
          title: Text(name),
          initiallyExpanded: false,
          children: <Widget>[
            ListTile(
              title: Text("外观"),
              trailing: Image.asset(image),
            ),
            _listInExpandTile("价格",money),
            _listInExpandTile("内容", content),
            _listInExpandTile("适用", scope),
            _listInExpandTile("备注", remark),
            Container(
              width: 250,
              height: 40,
              child: FLFlatButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 1
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                expanded: true,
                color: Colors.transparent,
                textColor: Theme.of(context).primaryColor,
                child: Text('租借', textAlign: TextAlign.center),
                onPressed: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (context)=>LeasePage(device: name,)));
                }
              ),
            ),
            Container(height: 20,)
          ],
        ),
    );
  }
  Widget _listInExpandTile(String text,String content){
    return ListTile(
      title: Text(text),
      trailing: Text(content),
    );
  }
  //轮播图Builder
  Widget _swiperBuilder(BuildContext context, int index) {
    getCarpic();
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned.fill(
          child: Image.network(
            Global.photos[index].picUrl,
          ),
        ),
        Positioned(
            bottom: 0,
            child: Opacity(
              opacity: 0.3,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.15,
                color: Colors.black87,
              ),
            )),
        Positioned(
          bottom: MediaQuery.of(context).size.width * 0.08,
          left: 5,
          child: Text(
            Global.photos[index].content,
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ],
    );
  }
}
