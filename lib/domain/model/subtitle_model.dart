import '../../data/model/subtitle_response_model.dart';

class SubtitleModel {
  final String? language;
  final bool? isDefault;

  SubtitleModel({this.language, this.isDefault});

  factory SubtitleModel.fromJson(SubtitleAttributesModel? json) {
    return SubtitleModel(
      language: json?.language ?? '',
      isDefault: json?.isDefault ?? false,
    );
  }
}
