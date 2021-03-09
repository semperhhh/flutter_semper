import 'package:flutter/material.dart';
import 'package:flutter_semper/Lists/Models/ListsModel.dart';
import 'package:flutter_semper/Post/PostViewController.dart';
import 'package:flutter_semper/Tools/ColorUtil.dart';

class ListsView extends StatelessWidget {
  ListsView({@required this.model});

  ListsModel model;

  @override
  Widget build(BuildContext context) {
    List<Widget> _tagsWidgt() {
      // tag
      List<String> list = this.model.tags ?? [];
      List l = <Widget>[];
      for (var i = 0; i < list.length; i++) {
        Widget t = Container(
          height: 20,
          padding: EdgeInsets.only(left: 4, right: 4),
          decoration: BoxDecoration(
            color: ColorUtil.fromHex("#28a745"),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Wrap(
            runAlignment: WrapAlignment.center,
            children: [
              Text(
                "${list[i]}",
                style: TextStyle(
                    // backgroundColor: ColorUtil.fromHex("#28a745"),
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 13),
              )
            ],
          ),
        );
        l.add(t);
      }

      // category
      l.add(
        Container(
          padding: EdgeInsets.only(left: 4, right: 4),
          decoration: BoxDecoration(
            color: ColorUtil.fromHex("#17a2b8"),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Wrap(
            runAlignment: WrapAlignment.center,
            children: [
              Text(
                this.model.category,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 13),
              )
            ],
          ),
        ),
      );

      // time
      Widget createTime = Text(
        "创建于: ${model.createTime}",
        style: TextStyle(
            color: ColorUtil.fromHex("#A0A0A0"),
            fontSize: 14,
            fontWeight: FontWeight.w500),
      );
      l.add(createTime);

      return l;
    }

    Widget _title() => Text(
          model.title,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
        );

    List<Widget> _likeWidget() {
      TextStyle s = TextStyle(
          color: ColorUtil.fromHex("#9F9F9F"),
          fontSize: 16,
          fontWeight: FontWeight.w600);
      Widget likeed = Text("${this.model.likeed ?? 0} 喜欢", style: s);
      Widget readed = Text("${this.model.readed ?? 0} 阅读", style: s);
      return [readed, SizedBox(width: 20), likeed];
    }

    Widget _gesture = GestureDetector(
      onTap: () {
        itemDidSelect(context);
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 120),
        child: Container(
          padding: EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: _tagsWidgt(),
                spacing: 14,
                runSpacing: 8,
              ),
              SizedBox(height: 20),
              _title(),
              SizedBox(height: 20),
              Row(children: _likeWidget())
            ],
          ),
          decoration: BoxDecoration(
            color: ColorUtil.black,
          ),
        ),
      ),
    );

    return Container(
      color: ColorUtil.grey,
      child: _gesture,
    );
  }

  void itemDidSelect(BuildContext context) {
    Navigator.of(context).pushNamed("post", arguments: this.model.title);
  }
}
