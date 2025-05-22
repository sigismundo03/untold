import 'package:flutter/material.dart';

import '../../../routing/app_routes.dart';

class SubscriptionWidget extends StatelessWidget {
  const SubscriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.subscription);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(51, 51, 63, 0.9),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundColor: Color.fromRGBO(170, 115, 240, 1),
              child: Icon(Icons.sync, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("STREAM Premium",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  Text("Jan 22, 2023",
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.45),
                          fontSize: 12)),
                ],
              ),
            ),
            const Text("Coming soon", style: TextStyle(color: Color(0xFF9A6AFF))),
          ],
        ),
      ),
    );
  }
}
