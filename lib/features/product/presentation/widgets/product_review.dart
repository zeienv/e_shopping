import 'package:flutter/material.dart';

import '../../../../core/common/colors.dart';
class ProductReviewsWidget extends StatelessWidget {
  const ProductReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Reviews",
          style: TextStyle(
            height: 2,
            color: AppColors.textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),

        // Ratings Overview
        const Text(
          "4.5 Ratings",
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "213 Reviews",
          style: TextStyle(
            color: AppColors.greyColor,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),


        _buildReview(
          avatar: "assets/images/circle.png",
          name: "Alex Morgan",
          review:
          "Gucci transcribes its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive accessories.",
          date: "12 days ago",
          rating: 4,
        ),
        const SizedBox(height: 16),
        _buildReview(
          avatar: "assets/images/circle.png",
          name: "Alex Morgan",
          review:
          "Gucci transcribes its heritage, creativity, and innovation into a plenitude of collections. From staple items to distinctive accessories.",
          date: "12 days ago",
          rating: 4,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildReview({
    required String avatar,
    required String name,
    required String review,
    required String date,
    required int rating,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundImage: AssetImage(avatar),
            radius: 20,
          ),
          title: Text(
            name,
            style: const TextStyle(
              color: AppColors.textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              5,
                  (index) => Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: AppColors.splashColor,
                size: 18,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          review,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          date,
          style: const TextStyle(
            color: AppColors.textColor,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
