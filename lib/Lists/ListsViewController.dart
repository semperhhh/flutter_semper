import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_semper/Tools/ColorUtil.dart';
import 'package:flutter_semper/Tools/PHNetwork.dart';
import 'Models/ListsModel.dart';
import 'Views/ListsView.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListsViewController extends StatefulWidget {
  @override
  _ListsViewControllerState createState() => _ListsViewControllerState();
}

class _ListsViewControllerState extends State<ListsViewController> {
  List dataList = <ListsModel>[];

  @override
  void initState() {
    super.initState();
    _requestData();
  }

  void _requestData() async {
    List items = await PHNetwork.get("http://www.semperhhh.cn/lists/query");
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
        padding: EdgeInsets.only(left: 50.w, right: 50.w),
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
