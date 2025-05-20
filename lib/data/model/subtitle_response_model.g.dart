// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtitle_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubtitleResponseModel _$SubtitleResponseModelFromJson(
        Map<String, dynamic> json) =>
    SubtitleResponseModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => SubtitleDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubtitleResponseModelToJson(
        SubtitleResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

SubtitleDataModel _$SubtitleDataModelFromJson(Map<String, dynamic> json) =>
    SubtitleDataModel(
      id: (json['id'] as num).toInt(),
      attributes: SubtitleAttributesModel.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubtitleDataModelToJson(SubtitleDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

SubtitleAttributesModel _$SubtitleAttributesModelFromJson(
        Map<String, dynamic> json) =>
    SubtitleAttributesModel(
      language: json['language'] as String,
      isDefault: json['default'] as bool?,
      urlLink: json['urlLink'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      file: SubtitleFileModel.fromJson(json['file'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubtitleAttributesModelToJson(
        SubtitleAttributesModel instance) =>
    <String, dynamic>{
      'language': instance.language,
      'default': instance.isDefault,
      'urlLink': instance.urlLink,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'publishedAt': instance.publishedAt.toIso8601String(),
      'file': instance.file,
    };

SubtitleFileModel _$SubtitleFileModelFromJson(Map<String, dynamic> json) =>
    SubtitleFileModel(
      data:
          SubtitleFileDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubtitleFileModelToJson(SubtitleFileModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

SubtitleFileDataModel _$SubtitleFileDataModelFromJson(
        Map<String, dynamic> json) =>
    SubtitleFileDataModel(
      id: (json['id'] as num).toInt(),
      attributes: SubtitleFileAttributesModel.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubtitleFileDataModelToJson(
        SubtitleFileDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

SubtitleFileAttributesModel _$SubtitleFileAttributesModelFromJson(
        Map<String, dynamic> json) =>
    SubtitleFileAttributesModel(
      name: json['name'] as String,
      ext: json['ext'] as String?,
      mime: json['mime'] as String?,
      size: (json['size'] as num?)?.toDouble(),
      url: json['url'] as String,
      hash: json['hash'] as String?,
    );

Map<String, dynamic> _$SubtitleFileAttributesModelToJson(
        SubtitleFileAttributesModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'ext': instance.ext,
      'mime': instance.mime,
      'size': instance.size,
      'url': instance.url,
      'hash': instance.hash,
    };

MetaModel _$MetaModelFromJson(Map<String, dynamic> json) => MetaModel(
      pagination:
          PaginationModel.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetaModelToJson(MetaModel instance) => <String, dynamic>{
      'pagination': instance.pagination,
    };

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) =>
    PaginationModel(
      page: (json['page'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      pageCount: (json['pageCount'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationModelToJson(PaginationModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'pageCount': instance.pageCount,
      'total': instance.total,
    };
