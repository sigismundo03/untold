import 'package:flutter/material.dart';

class AudioSubtitleWidget extends StatelessWidget {
  const AudioSubtitleWidget({
    super.key,
    required this.audios,
    required this.subtitles,
    required this.selectedAudio,
    required this.selectedSubtitle,
    required this.onSelectAudio,
    required this.onSelectSubtitle,
    this.onPressedClose,
  });
  final List<String> audios;
  final List<String> subtitles;
  final String selectedAudio;
  final String selectedSubtitle;
  final Function(String) onSelectAudio;
  final Function(String) onSelectSubtitle;
  final Function()? onPressedClose;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Audio Column
                _buildOptionColumn(
                    "Audio", audios, selectedAudio, onSelectAudio),

                // Subtitle Column
                _buildOptionColumn(
                    "Subtitle", subtitles, selectedSubtitle, onSelectSubtitle),
              ],
            ),

            // Close button
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: onPressedClose,
                child: const Text(
                  "Close",
                  style: TextStyle(
                      color: Colors.purpleAccent, fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOptionColumn(String title, List<String> options, String selected,
      Function(String) onSelect) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        for (final option in options)
          GestureDetector(
            onTap: () => onSelect(option),
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: selected == option ? Colors.purple : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                option,
                style: TextStyle(
                  color: selected == option ? Colors.white : Colors.grey[400],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
