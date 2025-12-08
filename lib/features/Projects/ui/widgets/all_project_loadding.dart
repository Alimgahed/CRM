import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AllProjectShimmer extends StatelessWidget {
  const AllProjectShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 190,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 10),
      
            // TITLE
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 20,
                width: double.infinity,
                color: Colors.grey.shade300,
              ),
            ),
            const SizedBox(height: 10),
      
            // DESCRIPTION/LOCATION
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 15,
                width: 150,
                color: Colors.grey.shade300,
              ),
            ),
            const SizedBox(height: 10),
      
            // PRICE + AREA + COMPANY CHIPS
            Row(
              children: List.generate(
                3,
                (_) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: 25,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
      
           
          ],
        ),
      ),
    );
  }
}
