import 'package:flui/flui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/admin.dart';
import 'package:flutterapp/join.dart';

import 'model/browser.dart';
class ExplorerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: FLAppBarTitle(
            title: '发现',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.account_circle,color: Theme.of(context).primaryColor,),
            title: Text("管理员登录"),
            trailing: Icon(Icons.chevron_right,),
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>LoginPage()));
            },
          ),
          Divider(height: 0,),
          ListTile(
            leading: Icon(Icons.group,color: Theme.of(context).primaryColor),
            title: Text("加入我们"),
            trailing: Icon(Icons.chevron_right),
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>JoinPage()));
            },
          ),
          Divider(height: 0,),
          ListTile(
            leading: Icon(Icons.group,color: Theme.of(context).primaryColor),
            title: Text("阿腾木的小世界"),
            trailing: Icon(Icons.chevron_right),
            onTap: (){
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (_) {
                return new Browser(
                  url: "https://ccatom.com/",
                  title: "Flutter 中文社区",
                );
              }));
            },
          ),
          Divider(height: 0,),
        ],
      ),
    );
  }
}
Widget _tile(String url, String title, String subtitle) {
  return ListTile(
    leading: CircleAvatar(
      backgroundImage: NetworkImage(url),
    ),
    title: Text(title),
    subtitle: Text(subtitle),
  );
}