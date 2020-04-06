import 'package:dio/dio.dart';
import 'package:flui/flui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'lease.dart';
class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  Dio dio = new Dio();
  Widget _expandTile(String name,String qq,String department,String grade,String description){
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child:  ExpansionTile(
        backgroundColor: Colors.white,
        title: Text(name),
        initiallyExpanded: false,
        children: <Widget>[
          _listInExpandTile("QQ",qq),
          _listInExpandTile("学院", department),
          _listInExpandTile("年级", grade),
          _listInExpandTile("介绍", description),
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

  bool _showContent = false;
  _getJoinShowInfo()async{

  }
  @override
  Widget build(BuildContext context) {
    final Widget loadingEmpty = FLEmptyContainer(
      showLoading: true,
      title: '加载中……',
    );
    final Widget content = Container(
      child: Center(
        child: Text('This is content'),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Loading'),
      ),
      body: Container(
        child: _showContent ? content : loadingEmpty,
      ),
    );
  }
}
