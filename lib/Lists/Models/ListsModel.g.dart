// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListsModel _$ListsModelFromJson(Map<String, dynamic> json) {
  return ListsModel()
    ..title = json['POSTS_TITLE'] as String
    ..likeed = json['POSTS_LIKEED'] as int
    ..readed = json['POSTS_READED'] as int
    ..createTime = json['POSTS_CREATE_TIME'] as String
    ..tags = (json['POSTS_TAG'] as List)?.map((e) => e as String)?.toList()
    ..category = json['POSTS_CATEGORY'] as String;
}

Map<String, dynamic> _$ListsModelToJson(ListsModel instance) =>
    <String, dynamic>{
      'POSTS_TITLE': instance.title,
      'POSTS_LIKEED': instance.likeed,
      'POSTS_READED': instance.readed,
      'POSTS_CREATE_TIME': instance.createTime,
      'POSTS_TAG': instance.tags,
      'POSTS_CATEGORY': instance.category,
    };
