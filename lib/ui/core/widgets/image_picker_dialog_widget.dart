import 'package:flutter/material.dart';

class ImagePickerDialogWidget extends StatelessWidget {
  const ImagePickerDialogWidget({
    super.key,
    required this.onCameraTap,
    required this.onGalleryTap,
  });

  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromRGBO(170, 115, 240, 1),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'CHOOSE IMAGE',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _OptionButton(
                icon: Icons.camera_alt_outlined,
                label: 'Take a photo',
                borderColor: Color.fromRGBO(170, 115, 240, 1),
                iconColor: Color.fromRGBO(170, 115, 240, 1),
                backgroundColor: Color.fromRGBO(188, 76, 241, 0.2),
                onTap: () {
                  onCameraTap();
                },
              ),
              const SizedBox(width: 20),
              _OptionButton(
                icon: Icons.image_outlined,
                label: 'Choose from gallery',
                borderColor: Color.fromRGBO(215, 215, 215, 0.6),
                backgroundColor: Color.fromRGBO(187, 187, 187, 0.1),
                iconColor: Color.fromRGBO(222, 222, 222, 1),
                onTap: () {
                  onGalleryTap();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color borderColor;
  final Color backgroundColor;
  final VoidCallback onTap;
  final Color iconColor;

  const _OptionButton({
    required this.icon,
    required this.label,
    required this.borderColor,
    required this.backgroundColor,
    required this.onTap,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 135,
        height: 140,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.45),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
