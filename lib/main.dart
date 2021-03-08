import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_semper/Lists/Models/ListsModel.dart';
import 'package:flutter_semper/Lists/Views/listsView.dart';
import 'package:flutter_semper/Tools/ColorUtil.dart';
import 'package:flutter_semper/Tools/PHNetwork.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: ColorUtil.black,
      ),
      home: HomeViewController(),
    );
  }
}

class HomeViewController extends StatefulWidget {
  @override
  _HomeViewControllerState createState() => _HomeViewControllerState();
}

class _HomeViewControllerState extends State<HomeViewController> {
  List dataList = <ListsModel>[];

  @override
  void initState() {
    super.initState();
    _requestData();
  }

  void _requestData() async {
    String data = await PHNetwork.get("http://www.semperhhh.cn/lists/query");
    List items = json.decode(data);
    dataList = items.map((e) {
      return ListsModel.fromJson(e);
    }).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("列表")),
      body: Container(
        color: ColorUtil.fromHex("#212529"),
        padding: EdgeInsets.only(left: 50, right: 50),
        child: ListView.separated(
          itemBuilder: _itemBuilder,
          itemCount: dataList.length,
          separatorBuilder: (context, index) {
            return Divider(
              color: ColorUtil.fromHex("#212529"),
              height: 1,
            );
          },
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    ListsModel model = dataList[index];
    return ListsView(model: model);
  }
}
