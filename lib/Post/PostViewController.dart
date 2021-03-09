import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_semper/Tools/PHNetwork.dart';

class PostViewController extends StatelessWidget {
  String title;
  @override
  Widget build(BuildContext context) {
    this.title = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("内容"),
      ),
      body: Container(
        child: FutureBuilder(
          future: requestData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Markdown(
                data: snapshot.data,
                selectable: true,
              );
            } else {
              return Center(child: Text("加载中..."));
            }
          },
        ),
      ),
    );
  }

  Future<String> requestData() async {
    String s = await PHNetwork.get(
        "http://127.0.0.1:8585/posts/query?title=${this.title}");
    return s;
  }
}
