import 'package:json_annotation/json_annotation.dart';

part 'movie_response_model.g.dart';

@JsonSerializable()
class MovieResponseModel {
  final List<MovieDataModel>? data;
  final MetaModel? meta;

  MovieResponseModel({required this.data, required this.meta});

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieResponseModelToJson(this);
}

@JsonSerializable()
class MovieDataModel {
  final int? id;
  final MovieAttributesModel? attributes;

  MovieDataModel({required this.id, required this.attributes});

  factory MovieDataModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDataModelToJson(this);
}

@JsonSerializable()
class MovieAttributesModel {
  final String? name;
  final String? synopsis;

  @JsonKey(name: 'currently_playing')
  final bool? currentlyPlaying;

  @JsonKey(name: 'stream_link')
  final String? streamLink;

  final String? genre;

  @JsonKey(name: 'end_date')
  final DateTime? endDate;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;

  final PosterModel? poster;

  MovieAttributesModel({
    required this.name,
    required this.synopsis,
    required this.currentlyPlaying,
    required this.streamLink,
    required this.genre,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.poster,
  });

  factory MovieAttributesModel.fromJson(Map<String, dynamic> json) =>
      _$MovieAttributesModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieAttributesModelToJson(this);
}

@JsonSerializable()
class PosterModel {
  final PosterDataModel data;

  PosterModel({required this.data});

  factory PosterModel.fromJson(Map<String, dynamic> json) =>
      _$PosterModelFromJson(json);
  Map<String, dynamic> toJson() => _$PosterModelToJson(this);
}

@JsonSerializable()
class PosterDataModel {
  final int id;
  final PosterAttributesModel attributes;

  PosterDataModel({required this.id, required this.attributes});

  factory PosterDataModel.fromJson(Map<String, dynamic> json) =>
      _$PosterDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$PosterDataModelToJson(this);
}

@JsonSerializable()
class PosterAttributesModel {
  final String? name;
  final int? width;
  final int? height;
  final PosterFormatsModel? formats;
  final String? hash;
  final String? ext;
  final String? mime;
  final double? size;
  final String? url;
  final String? previewUrl;
  final String? provider;
  final dynamic providerMetadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PosterAttributesModel({
    required this.name,
    required this.width,
    required this.height,
    required this.formats,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    this.previewUrl,
    required this.provider,
    this.providerMetadata,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PosterAttributesModel.fromJson(Map<String, dynamic> json) =>
      _$PosterAttributesModelFromJson(json);
  Map<String, dynamic> toJson() => _$PosterAttributesModelToJson(this);
}

@JsonSerializable()
class PosterFormatsModel {
  final PosterFormatModel? large;
  final PosterFormatModel? small;
  final PosterFormatModel? medium;
  final PosterFormatModel? thumbnail;

  PosterFormatsModel({
    this.large,
    this.small,
    this.medium,
    this.thumbnail,
  });

  factory PosterFormatsModel.fromJson(Map<String, dynamic> json) =>
      _$PosterFormatsModelFromJson(json);
  Map<String, dynamic> toJson() => _$PosterFormatsModelToJson(this);
}

@JsonSerializable()
class PosterFormatModel {
  final String? ext;
  final String? url;
  final String? hash;
  final String? mime;
  final String? name;
  final String? path;
  final double? size;
  final int? width;
  final int? height;

  PosterFormatModel({
    required this.ext,
    required this.url,
    required this.hash,
    required this.mime,
    required this.name,
    this.path,
    required this.size,
    required this.width,
    required this.height,
  });

  factory PosterFormatModel.fromJson(Map<String, dynamic> json) =>
      _$PosterFormatModelFromJson(json);
  Map<String, dynamic> toJson() => _$PosterFormatModelToJson(this);
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
  final int? page;
  final int? pageSize;
  final int? pageCount;
  final int? total;

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
