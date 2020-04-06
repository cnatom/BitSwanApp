import 'dart:convert';
import 'dart:io';

import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/global.dart';
import 'package:dio/dio.dart';
import 'package:flutterapp/model/peopleInfo.dart';

class JoinPage extends StatefulWidget {
  @override
  _JoinPageState createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  bool _loading = false;
  Dio dio = Dio();
  //方便跨widget访问
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  //提交表单数据
  _forSubmitted() async {
    var _form = _formKey.currentState;
    _form.save();
    await postInfo();
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(Global.peopleInfoResult.msg.toString()),
          );
        });
  }

  //post表单数据
  postInfo() async {
    Response response = await dio.post('http://batswan.design:9000/join',
        queryParameters: Global.leaseInfo);
    Map<String, dynamic> infomap = jsonDecode(response.toString());
    Global.peopleInfoResult = PeopleInfoResult.fromJson(infomap);
//    print(Global.information.toString());
//    print(Global.infoJson.msg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: FLAppBarTitle(title: "加入我们"),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
            padding: EdgeInsets.all(5),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    createTF("姓名", "请输入您的姓名", 'name'),
                    createTF("学院", "请输入您所在的学院", 'department'),
                    createTF("年级", "请输入您的年级", 'grade'),
                    createTF("QQ号码", "请输入您的QQ号码", 'qq'),
                    createTF("微信号", "请输入您的微信号", 'wechat'),
                    createTF(null, "介绍一下自己吧", 'description', maxline: 10),
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      width: 250,
                      child: FLLoadingButton(
                          child: Text('提交'),
                          color: Color(0xFF0F4C81),
                          disabledColor: Color(0xFF0F4C81),
                          indicatorColor: Colors.white,
                          textColor: Colors.white,
                          loading: _loading,
                          minWidth: 200,
                          indicatorOnly: true,
                          onPressed: () {
                            new Future((){setState(() {_loading = true;});})
                                .then((m)=>_forSubmitted())
                                .then((m){setState(() {_loading = false;});});
                          }
                      )
                    )
                  ],
                ),
              ),
            )));
  }
}

Widget createTF(String label, String hint, String aim, {int maxline = 1}) {
  return Container(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        onSaved: (val) {
          Global.peopleInfo[aim] = val;
        },
        maxLines: maxline,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15),
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ));
}
