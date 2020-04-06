import 'dart:async';
import 'dart:convert';

import 'package:flui/flui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/global.dart';
import 'package:dio/dio.dart';
import 'package:flutterapp/model/leaseApplyInfo.dart';
import 'package:flutterapp/model/leaseCheck.dart';

class LeasePage extends StatefulWidget {
  final String device; //接收传入的设备信息
  LeasePage({Key key, this.device}) : super(key: key);
  @override
  _LeasePageState createState() => _LeasePageState();
}

class _LeasePageState extends State<LeasePage> {
  bool _loading = false;//加载判定
  GlobalKey<FormState> leaseKey = new GlobalKey<FormState>(); //跨widget访问
  Dio dio = Dio(); //dio网络访问
  bool _unshowMoreForm; //是否显示更多表单
  //初始化时存储当前设备名称
  @override
  void initState() {
    _unshowMoreForm = true;
    Global.leaseInfo['equipment'] = widget.device;
    super.initState();
  }

  //单个表格
  Widget createTF(String label, String hint, String aim, {int maxline = 1}) {
    return Container(
        padding: EdgeInsets.all(15),
        child: TextFormField(
          onSaved: (val) {
            Global.leaseInfo[aim] = val;
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

  //租赁时间选择器
  _showTime(String aim) async {
    var date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970, 1, 1),
        lastDate: DateTime(2050, 1, 1));
    setState(() {
      Global.leaseInfo[aim] = date.toString().split(" ")[0];
    });
  }

  //get租赁余量信息
  getInfo(String uri) async {
    Response response = await dio.get(uri, queryParameters: Global.leaseInfo);
    Map<String, dynamic> infomap = jsonDecode(response.toString());
    Global.leaseInfoCheckResult = LeaseInfoCheckResult.fromJson(infomap);
  }
  //post租赁信息
  postInfo(String uri)async{
    Response response = await dio.post(uri, queryParameters: Global.leaseInfo);
    Map<String, dynamic> infomap = jsonDecode(response.toString());
    Global.leaseApplyResult = LeaseApplyResult.fromJson(infomap);
  }
//查询余量后的行为
  _subCheck(String uri) async {
    var _form = leaseKey.currentState;
    _form.save();
    await getInfo(uri);
    if (Global.leaseInfoCheckResult.data > 0) {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("查询结果"),
              content: Text(
                  '${Global.leaseInfoCheckResult.msg}\n租金: ${Global.leaseInfoCheckResult.data}'),
              actions: <Widget>[
                RaisedButton(
                  child: Text("确定"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      _unshowMoreForm = false;
                    });
                  },
                  color: Colors.white,
                  elevation: 0,
                  textColor: Theme.of(context).primaryColor,
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('没有库存了！'),
            );
          });
    }
  }
  //提交租赁信息后的行为
  _subApply(String uri) async{
    var _form = leaseKey.currentState;
    _form.save();
    await postInfo(uri);
    // ignore: deprecated_member_use
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(Global.leaseApplyResult.msg),
          );
        });
  }
  //带说明的分割线
  Widget _diyDivider(String content){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          color: Colors.black12,
          height: 1,
          width: MediaQuery.of(context).size.width * 0.25,
        ),
        Text(content),
        Container(
          color: Colors.black12,
          height: 1,
          width: MediaQuery.of(context).size.width * 0.25,
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: FLAppBarTitle(
              title: '${widget.device}',
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
              child: Form(
            key: leaseKey,
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      onSaved: (val) {
                        Global.leaseInfo['amount'] = val;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        labelText: '租赁数量',
                        hintText: '例如:200',
                      ),
                    )),
                ListTile(
                  title: Text("租赁起始日期"),
                  trailing: Text(Global.leaseInfo['start'].toString()),
                  onTap: () {
                    _showTime('start');
                  },
                ),
                ListTile(
                  title: Text("租赁结束日期"),
                  trailing: Text(Global.leaseInfo['end'].toString()),
                  onTap: () {
                    _showTime('end');
                  },
                ),
                Container(
                  width: 250,
                  padding: EdgeInsets.only(top: 30,bottom: 10),
                  //时间选择器
                  child: FLFlatButton(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1
                          ),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      expanded: true,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      textColor: Theme.of(context).primaryColor,
                      child: Text('查询余量', textAlign: TextAlign.center),
                      onPressed: (){
                        _subCheck('http://batswan.design:9000/check');
                      }
                  ),
                ),
                Offstage(
                  offstage: _unshowMoreForm,
                  child: Column(
                    children: <Widget>[
                      Container(height: 50,),
                      _diyDivider("请进一步确定信息"),
                      Container(height: 20,),
                      createTF('姓名', '请输入您的姓名', 'name'),
                      createTF('学院', '请输入您所在的学院', 'department'),
                      createTF('学号', '例如:08192988', 'id'),
                      createTF('电话', '请输入您的电话', 'phone'),
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
                                  .then((m)=>_subApply('http://batswan.design:9000/apply'))
                                  .then((m){setState(() {_loading = false;});});
                            }
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
        ));
  }
}
