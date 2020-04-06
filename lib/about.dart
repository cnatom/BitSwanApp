import 'package:flui/flui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: FLAppBarTitle(
          title: "关于我们",
        ),
      ),
      body:SingleChildScrollView(
        child: Container(
//        color: Colors.lightBlue,
          padding: EdgeInsets.all(10.0),
          child:
          Column(
//          mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(height: 20,),
              Center(child: Image.asset('images/logo.png'),),
              Container(height: 20,),
              createcard('简介', "徐州烛光文化传媒有限公司起始于2009年，中国矿业大学百年校庆之际。是一家专门服务于校园大型文化活动、企业招聘、演讲报告，提供音响设备租赁，活动方案策划执行的校园文化传媒公司。"),
              Container(height: 10,),
              createcard('公司宗旨', "公司长期以来，以“青春奉献、自强不息”为公司精神，肩负一种责任、一种使命，传递一种文化，创高校文化服务品牌，誓为我国高校校园文化产业发展做出杰出贡献，做中国文化产业领军企业。"),
              Container(height: 10,),
              createcard('主营业务', "文化传媒活动组织策划：为各类型文化演出活动提供组织策划、具体实施、舞台搭建、灯光、音响设备租赁等全套服务，打造集策划、宣传、组织一体化服务体系。"),
              Container(height: 10,),
              createcard('联系方式', '朱国梁(总经理)\n手机：15105207036\nQQ：2401949967（烛光文化传媒）\n微信公众号：烛光文化\n地址：江苏省 徐州市 中国矿业大学',h: 2)
            ],
          ),
        ),
      )

    );
  }
}
Widget createcard(String title,String text,{double h=1.5}){
  return Card(
      elevation: 1.5,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
            Divider(),
            Text(text,strutStyle: StrutStyle(height: h),),
          ],
        ),
      )
  );
}