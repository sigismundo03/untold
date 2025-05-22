import 'package:flutter/material.dart';
import 'package:untold/ui/core/widgets/primary_button_widget.dart';

import 'secondary_button_widget.dart';

class WarningShowModalBottomSheet extends StatelessWidget {
  const WarningShowModalBottomSheet({
    super.key,
    required this.title,
    required this.subtitle,
    required this.primaryButtonText,
    required this.secondaryButtonText,
    required this.onPrimaryButtonTap,
    required this.onSecondaryButtonTap,
  });
  final String title;
  final String subtitle;
  final String primaryButtonText;
  final String secondaryButtonText;
  final VoidCallback onPrimaryButtonTap;
  final VoidCallback onSecondaryButtonTap;

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
                    'Warning',
                    style: TextStyle(
                      fontSize: 16,
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
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(255, 255, 255, 1),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(255, 255, 255, 1),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: SecondaryButtonWidget(
                  text: secondaryButtonText,
                  onPressed: onSecondaryButtonTap,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: PrimaryButtonWidget(
                  text: primaryButtonText,
                  onPressed: onPrimaryButtonTap,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
