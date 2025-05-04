import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DashboardShimmer extends StatelessWidget {
  const DashboardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row (Good Morning, profile icon, etc.)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                shimmerBox(height: 20, width: 150),
                Row(
                  children: [
                    shimmerCircle(40),
                    const SizedBox(width: 10),
                    shimmerCircle(40),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),

            // Steps card
            shimmerBox(height: 120, width: double.infinity, borderRadius: 16),
            const SizedBox(height: 20),

            // Categories
            Row(
              children: [
                shimmerBox(height: 80, width: 80),
                const SizedBox(width: 10),
                shimmerBox(height: 80, width: 80),
                const SizedBox(width: 10),
                shimmerBox(height: 80, width: 80),
              ],
            ),
            const SizedBox(height: 20),

            // Recent lookups
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: shimmerBox(
                    height: 80, width: double.infinity, borderRadius: 12),
              ),
            ),

            const SizedBox(height: 20),

            // Blogs
            Row(
              children: [
                shimmerBox(height: 120, width: 160, borderRadius: 16),
                const SizedBox(width: 10),
                shimmerBox(height: 120, width: 160, borderRadius: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget shimmerBox(
      {required double height,
      required double width,
      double borderRadius = 8}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  Widget shimmerCircle(double size) {
    return shimmerBox(height: size, width: size, borderRadius: size / 2);
  }
}
