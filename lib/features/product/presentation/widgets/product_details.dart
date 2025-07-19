
import 'package:flutter/material.dart';
import '../../../../core/common/colors.dart';
import '../../domain/entity/product_entity.dart';
import 'product_quantity.dart';
import 'product_selection.dart';

class ProductDetailsWidget extends StatefulWidget {
  final ProductEntity product;
  const ProductDetailsWidget({super.key, required this.product});

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  String _selectedSize = "M";
  String _selectedColor = "Blue";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.product.title,
          style: const TextStyle(
            color: AppColors.textColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "\$${widget.product.price}",
          style: const TextStyle(
            color: AppColors.splashColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ProductSelectionWidget(
          label: "Size",
          initialValue: _selectedSize,
          options: const ["S", "M", "L", "XL"],
          onSelected: (value) {
            setState(() {
              _selectedSize = value;
            });
          },
        ),
        const SizedBox(height: 16),
        ProductSelectionWidget(
          label: "Color",
          initialValue: _selectedColor,
          options: const ["Green", "Blue", "Black"],
          onSelected: (value) {
            setState(() {
              _selectedColor = value;
            });
          },
        ),
        const SizedBox(height: 16),
        const ProductQuantitySelector(),
        const SizedBox(height: 25),
        Text(
          widget.product.description,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          "Shipping & Returns",
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Free standard shipping and free 60-day returns.",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
