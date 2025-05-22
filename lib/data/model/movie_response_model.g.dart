// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponseModel _$MovieResponseModelFromJson(Map<String, dynamic> json) =>
    MovieResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MovieDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieResponseModelToJson(MovieResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };

MovieDataModel _$MovieDataModelFromJson(Map<String, dynamic> json) =>
    MovieDataModel(
      id: (json['id'] as num?)?.toInt(),
      attributes: json['attributes'] == null
          ? null
          : MovieAttributesModel.fromJson(
              json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieDataModelToJson(MovieDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

MovieAttributesModel _$MovieAttributesModelFromJson(
        Map<String, dynamic> json) =>
    MovieAttributesModel(
      name: json['name'] as String?,
      synopsis: json['synopsis'] as String?,
      currentlyPlaying: json['currently_playing'] as bool?,
      streamLink: json['stream_link'] as String?,
      genre: json['genre'] as String?,
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      poster: json['poster'] == null
          ? null
          : PosterModel.fromJson(json['poster'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieAttributesModelToJson(
        MovieAttributesModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'synopsis': instance.synopsis,
      'currently_playing': instance.currentlyPlaying,
      'stream_link': instance.streamLink,
      'genre': instance.genre,
      'end_date': instance.endDate?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'poster': instance.poster,
    };

PosterModel _$PosterModelFromJson(Map<String, dynamic> json) => PosterModel(
      data: PosterDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PosterModelToJson(PosterModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

PosterDataModel _$PosterDataModelFromJson(Map<String, dynamic> json) =>
    PosterDataModel(
      id: (json['id'] as num).toInt(),
      attributes: PosterAttributesModel.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PosterDataModelToJson(PosterDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

PosterAttributesModel _$PosterAttributesModelFromJson(
        Map<String, dynamic> json) =>
    PosterAttributesModel(
      name: json['name'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      formats: json['formats'] == null
          ? null
          : PosterFormatsModel.fromJson(
              json['formats'] as Map<String, dynamic>),
      hash: json['hash'] as String?,
      ext: json['ext'] as String?,
      mime: json['mime'] as String?,
      size: (json['size'] as num?)?.toDouble(),
      url: json['url'] as String?,
      previewUrl: json['previewUrl'] as String?,
      provider: json['provider'] as String?,
      providerMetadata: json['providerMetadata'],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$PosterAttributesModelToJson(
        PosterAttributesModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'width': instance.width,
      'height': instance.height,
      'formats': instance.formats,
      'hash': instance.hash,
      'ext': instance.ext,
      'mime': instance.mime,
      'size': instance.size,
      'url': instance.url,
      'previewUrl': instance.previewUrl,
      'provider': instance.provider,
      'providerMetadata': instance.providerMetadata,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

PosterFormatsModel _$PosterFormatsModelFromJson(Map<String, dynamic> json) =>
    PosterFormatsModel(
      large: json['large'] == null
          ? null
          : PosterFormatModel.fromJson(json['large'] as Map<String, dynamic>),
      small: json['small'] == null
          ? null
          : PosterFormatModel.fromJson(json['small'] as Map<String, dynamic>),
      medium: json['medium'] == null
          ? null
          : PosterFormatModel.fromJson(json['medium'] as Map<String, dynamic>),
      thumbnail: json['thumbnail'] == null
          ? null
          : PosterFormatModel.fromJson(
              json['thumbnail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PosterFormatsModelToJson(PosterFormatsModel instance) =>
    <String, dynamic>{
      'large': instance.large,
      'small': instance.small,
      'medium': instance.medium,
      'thumbnail': instance.thumbnail,
    };

PosterFormatModel _$PosterFormatModelFromJson(Map<String, dynamic> json) =>
    PosterFormatModel(
      ext: json['ext'] as String?,
      url: json['url'] as String?,
      hash: json['hash'] as String?,
      mime: json['mime'] as String?,
      name: json['name'] as String?,
      path: json['path'] as String?,
      size: (json['size'] as num?)?.toDouble(),
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PosterFormatModelToJson(PosterFormatModel instance) =>
    <String, dynamic>{
      'ext': instance.ext,
      'url': instance.url,
      'hash': instance.hash,
      'mime': instance.mime,
      'name': instance.name,
      'path': instance.path,
      'size': instance.size,
      'width': instance.width,
      'height': instance.height,
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
      page: (json['page'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      pageCount: (json['pageCount'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationModelToJson(PaginationModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'pageCount': instance.pageCount,
      'total': instance.total,
    };
