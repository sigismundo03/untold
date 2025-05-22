import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerLoadingWidget extends StatelessWidget {
  const CustomShimmerLoadingWidget({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF2D1046),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade800,
          highlightColor: Colors.grey.shade600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header lines
              _roundedRect(width: 60, height: 10),
              const SizedBox(height: 10),
              _roundedRect(width: 120, height: 16),
              const SizedBox(height: 20),

              // Paragraph lines
              ...List.generate(
                  4,
                  (_) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: _roundedRect(width: double.infinity, height: 12),
                      )),
              const SizedBox(height: 20),

              // Icon + line
              Row(
                children: [
                  _circle(size: 12),
                  const SizedBox(width: 10),
                  _roundedRect(width: 80, height: 10),
                ],
              ),
              const SizedBox(height: 30),

              // Ticket/button shape
              Center(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Colors.purple.shade300, width: 1.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(child: _roundedRect(width: 200, height: 14)),
                ),
              ),
              const Spacer(),

              // Footer
              Row(
                children: [
                  _circle(size: 16),
                  const SizedBox(width: 10),
                  _roundedRect(width: 60, height: 10),
                  const Spacer(),
                  _roundedRect(width: 100, height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _roundedRect({double width = 100, double height = 10}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _circle({double size = 16}) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}
