import 'dart:ui';
import 'package:e_commerce_app/features/product/domain/entity/product_entity.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/product_action.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/product_details.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/product_image.dart';
import 'package:e_commerce_app/features/product/presentation/widgets/product_review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../core/common/colors.dart';
import '../../../homepage/domain/entity/category_entity.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    print('ProductPage arguments: $args');
    print('ProductPage arguments runtimeType: ${args.runtimeType}');
    ProductEntity product;
    if (args == null || args is! ProductEntity) {
      // Fallback demo product for debugging
      product = ProductEntity(
        id: 0,
        title: 'Demo Product',
        slug: 'demo-product',
        price: 999,
        description: 'This is a fallback demo product. If you see this, navigation did not pass a real product.',
        images: ['https://i.imgur.com/ItHcq7o.jpeg'],
        category: CategoryEntity(
          id: 0,
          name: 'Demo Category',
          slug: 'demo-category',
          image: 'https://i.imgur.com/QkIa5tT.jpeg',
        ),
      );
    } else {
      product = args as ProductEntity;
      print('ProductPage received product: id=${product.id}, title=${product.title}, price=${product.price}, images=${product.images}, category=${product.category}');
    }
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: AppColors.greyColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            IconsaxPlusBroken.arrow_left_2,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(IconsaxPlusBroken.heart, color: AppColors.textColor),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImagesWidget(images: product.images),
            const SizedBox(height: 16,),
            ProductDetailsWidget(product: product),
            const SizedBox(height: 16),
            ProductReviewsWidget(),
            const SizedBox(height: 16),
            ProductActionsWidget(price: product.price),
          ],
        ),
      ),
    );
  }
}
