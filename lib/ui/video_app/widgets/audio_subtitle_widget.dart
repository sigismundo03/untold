import 'package:flutter/material.dart';

class AudioSubtitleWidget extends StatelessWidget {
  const AudioSubtitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> audios = ['English', 'Spanish', 'Portuguese'];
    final List<String> subtitles = [
      'Off',
      'English (CC)',
      'Spanish',
      'Portuguese'
    ];
    String selectedAudio = 'English';
    String selectedSubtitle = 'Off';

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Audio Column
                _buildOptionColumn("Audio", audios, selectedAudio, (value) {}),

                // Subtitle Column
                _buildOptionColumn("Subtitle", subtitles, selectedSubtitle,
                    (value) {
                  selectedSubtitle = value;
                }),
              ],
            ),

            // Close button
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
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
