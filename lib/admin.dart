import 'dart:async';
import 'dart:convert';
import 'package:flui/flui.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/admin_page.dart';
import 'package:flutterapp/model/login.dart';

import 'global.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _loading = false;
  Dio dio = new Dio();
  TextEditingController _userNameController = new TextEditingController();
  //表单状态
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _password;//口令
  //验证口令
  String validateUserName(value){
    if (value.isEmpty) {
      return '口令不能为空!';
    }else if (value != '2020CUMT' || value != '2020BatSwanStudio') {
      return '请输入正确的口令';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    // logo区域
    Widget logoImageArea = new Container(
      alignment: Alignment.topCenter,
      child: Container(
        child: Image.asset(
          "images/logo.png",
          fit: BoxFit.cover,
        ),
      ),
    );
    //get登录信息
    getLoginInfo(String uri) async {
      Response response = await dio.get(uri, queryParameters: {'password':_password});
      Map<String, dynamic> infomap = jsonDecode(response.toString());
      Global.loginResult = LoginResult.fromJson(infomap);
    }
    //点击登录后的行为
    _subUsername()async{
      var _form = _formKey.currentState;
      _form.save();
      await getLoginInfo('http://batswan.design:9000/login');
      if(Global.loginResult.code==-1){
        showDialog(
          context: context,
          builder:(BuildContext context) {
            return AlertDialog(
              content: Text(Global.loginResult.msg),
            );
          }
        );
      }else{
        showDialog(
            context: context,
            builder:(BuildContext context) {
              return AlertDialog(
                content: Text(Global.loginResult.msg),
              );
            }
        );
        Future.delayed(Duration(milliseconds: 500),(){
          Navigator.pop(context);
          Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context)=>AdminPage()));
        });

//        Navigator.pop(context);
      }
    }
    //输入文本框区域
    Widget inputTextArea = new Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white
      ),
      child: new Form(
        key: _formKey,
        child: new Column(
          children: <Widget>[
            new TextFormField(
              controller: _userNameController,
              decoration: InputDecoration(
                labelText: "口令",
                hintText: "请输入管理员口令",
                prefixIcon: Icon(Icons.person),
              ),
              validator: validateUserName,
              onSaved: (String value){
                _password = value;
              },
            ),
          ],
        ),
      ),
    );

    // 登录按钮区域
    Widget loginButtonArea = new Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      height: 45.0,
      child: FLLoadingButton(
          child: Text('登录'),
          color: Color(0xFF0F4C81),
          disabledColor: Color(0xFF0F4C81),
          indicatorColor: Colors.white,
          textColor: Colors.white,
          loading: _loading,
          minWidth: 200,
          indicatorOnly: true,
          onPressed: () {
            new Future((){setState(() {_loading = true;});})
                .then((m)=>_subUsername())
                .then((m){setState(() {_loading = false;});});
          }
      )
//      new RaisedButton(
//        color: Theme.of(context).accentColor,
//        child: Text(
//          "登录",
//          style: Theme.of(context).primaryTextTheme.headline,
//        ),
//        onPressed: (){
//          _subUsername();
//        },
//      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: FLAppBarTitle(title: "管理员登录"),
      ),

      backgroundColor: Colors.white,
      body:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            logoImageArea,
            inputTextArea,
            loginButtonArea,
          ],
        ),
      );
  }
}
