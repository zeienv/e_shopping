import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/colors.dart';
import '../../../../core/route/rout_names.dart';
import '../../../auth/presentation/widgets/circle_avatar.dart';
import '../../../product/presentation/screens/custom_clip_rect.dart';
import '../../../product/presentation/bloc/product_bloc.dart';
import '../../../product/presentation/bloc/product_event.dart';
import '../bloc/category_bloc.dart';
import '../bloc/category_event.dart';
import 'category_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(LoadCategories(limit: 10));
    context.read<ProductBloc>().add(GetProductsEvent(limit: 10, offset: 0));
  }

  String selectedGender = 'Men';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: GestureDetector(
          onTap: () {},
          child: Image.asset("assets/images/circle.png"),
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: AppColors.greyColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: DropdownButton(
            value: selectedGender,
            dropdownColor: AppColors.greyColor,
            underline: const SizedBox(),
            onChanged: (String? newValue) {
              setState(() {
                selectedGender = newValue!;
              });
            },
            items: const [
              DropdownMenuItem(
                value: "Men",
                child: Text("Men", style: TextStyle(color: Colors.white)),
              ),
              DropdownMenuItem(
                value: "Women",
                child: Text("Women", style: TextStyle(color: Colors.white)),
              ),
            ],
            icon: Image.asset(
              "assets/images/arrowdown2.png",
              height: 20,
              width: 20,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/images/shop.png", height: 24, width: 24),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.circular(45),
                ),

                child: GestureDetector(
                  onTap: () {
                    //Navigator.pushNamed(context, RouteNames.searchingPage);
                  },
                  child: AbsorbPointer(
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent,
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 20.0,
                        ),
                      ),
                      style: TextStyle(color: AppColors.textColor),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Categories",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.productsCategories);
                  },
                  child: const Text(
                    "See All",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [const CategoryListWidget()]),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Top Selling",
                  style: TextStyle(color: AppColors.textColor, fontSize: 20),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.productList,
                      arguments: "Top selling",
                    );
                  },
                  child: const Text(
                    "See All",
                    style: TextStyle(color: AppColors.textColor, fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(height: 350, child: ProductListWidget()),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "New in",
                  style: TextStyle(
                    color: AppColors.splashColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.productList,
                      arguments: "Top selling",
                    );
                  },
                  child: const Text(
                    "See All",
                    style: TextStyle(color: AppColors.textColor, fontSize: 20),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 350,
              child: SizedBox(height: 350, child: ProductListWidget()),
            ),
          ],
        ),
      ),
    );
  }
}
