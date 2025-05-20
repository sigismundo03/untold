import 'package:json_annotation/json_annotation.dart';

part 'subtitle_response_model.g.dart';

@JsonSerializable()
class SubtitleResponseModel {
  final List<SubtitleDataModel> data;
  final MetaModel meta;

  SubtitleResponseModel({required this.data, required this.meta});

  factory SubtitleResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SubtitleResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubtitleResponseModelToJson(this);
}

@JsonSerializable()
class SubtitleDataModel {
  final int id;
  final SubtitleAttributesModel attributes;

  SubtitleDataModel({required this.id, required this.attributes});

  factory SubtitleDataModel.fromJson(Map<String, dynamic> json) =>
      _$SubtitleDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubtitleDataModelToJson(this);
}

@JsonSerializable()
class SubtitleAttributesModel {
  final String language;
  @JsonKey(name: 'default')
  final bool? isDefault;
  final String? urlLink;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final SubtitleFileModel file;

  SubtitleAttributesModel({
    required this.language,
    this.isDefault,
    this.urlLink,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.file,
  });

  factory SubtitleAttributesModel.fromJson(Map<String, dynamic> json) =>
      _$SubtitleAttributesModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubtitleAttributesModelToJson(this);
}

@JsonSerializable()
class SubtitleFileModel {
  final SubtitleFileDataModel data;

  SubtitleFileModel({required this.data});

  factory SubtitleFileModel.fromJson(Map<String, dynamic> json) =>
      _$SubtitleFileModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubtitleFileModelToJson(this);
}

@JsonSerializable()
class SubtitleFileDataModel {
  final int id;
  final SubtitleFileAttributesModel attributes;

  SubtitleFileDataModel({required this.id, required this.attributes});

  factory SubtitleFileDataModel.fromJson(Map<String, dynamic> json) =>
      _$SubtitleFileDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubtitleFileDataModelToJson(this);
}

@JsonSerializable()
class SubtitleFileAttributesModel {
  final String name;
  final String? ext;
  final String? mime;
  final double? size;
  final String url;
  final String? hash;

  SubtitleFileAttributesModel({
    required this.name,
    this.ext,
    this.mime,
    this.size,
    required this.url,
    this.hash,
  });

  factory SubtitleFileAttributesModel.fromJson(Map<String, dynamic> json) =>
      _$SubtitleFileAttributesModelFromJson(json);
  Map<String, dynamic> toJson() => _$SubtitleFileAttributesModelToJson(this);
}

@JsonSerializable()
class MetaModel {
  final PaginationModel pagination;

  MetaModel({required this.pagination});

  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      _$MetaModelFromJson(json);
  Map<String, dynamic> toJson() => _$MetaModelToJson(this);
}

@JsonSerializable()
class PaginationModel {
  final int page;
  final int pageSize;
  final int pageCount;
  final int total;

  PaginationModel({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationModelToJson(this);
}
