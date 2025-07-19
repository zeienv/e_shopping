import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../core/common/colors.dart';



class ProductQuantitySelector extends StatefulWidget {
  const ProductQuantitySelector({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductQuantitySelectorState createState() =>
      _ProductQuantitySelectorState();
}

class _ProductQuantitySelectorState extends State<ProductQuantitySelector> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Quantity",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_quantity > 1) _quantity--;
                  });
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.splashColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(IconsaxPlusBroken.minus, color: Colors.white),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "$_quantity",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _quantity++;
                  });
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.splashColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(IconsaxPlusBroken.add, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
