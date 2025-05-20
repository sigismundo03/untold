import '../../data/model/subtitle_response_model.dart';

class SubtitleModel {
  final String language;
  final bool isDefault;

  SubtitleModel({required this.language, required this.isDefault});

  factory SubtitleModel.fromJson(SubtitleAttributesModel json) {
    return SubtitleModel(
      language: json.language,
      isDefault: json.isDefault ?? false,
    );
  }
}
