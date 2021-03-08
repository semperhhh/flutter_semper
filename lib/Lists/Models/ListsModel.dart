import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'ListsModel.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class ListsModel {
  ListsModel();
  @JsonKey(name: 'POSTS_TITLE')
  String title = "";
  @JsonKey(name: 'POSTS_LIKEED')
  int likeed = 0;
  @JsonKey(name: 'POSTS_READED')
  int readed = 0;
  @JsonKey(name: 'POSTS_CREATE_TIME')
  String createTime = "";
  @JsonKey(name: 'POSTS_TAG')
  List<String> tags = [];
  @JsonKey(name: 'POSTS_CATEGORY')
  String category = "";

  //不同的类使用不同的mixin即可
  factory ListsModel.fromJson(Map<String, dynamic> json) =>
      _$ListsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ListsModelToJson(this);
}
