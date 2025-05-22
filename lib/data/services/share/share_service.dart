import 'package:share_plus/share_plus.dart';

class ShareService {
  static Future<void> sharePosterUrl(
      {required String posterUrl,
      required String title,
      required String description}) async {
    await SharePlus.instance.share(
      ShareParams(
        title: 'Movie Poster  $title url $posterUrl',
        text: description,
      ),
    );
  }
}
