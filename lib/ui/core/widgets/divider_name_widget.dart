import 'package:flutter/material.dart';

class DividerNameWidget extends StatelessWidget {
  const DividerNameWidget({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Color.fromRGBO(244, 244, 244, 0.2),
            endIndent: 1,
            indent: 1,
            height: 1,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(85, 82, 82, 1),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Color.fromRGBO(244, 244, 244, 0.2),
            endIndent: 1,
            indent: 1,
            height: 1,
          ),
        ),
      ],
    );
  }
}
