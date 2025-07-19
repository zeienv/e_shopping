import 'package:e_commerce_app/core/route/rout_names.dart';
import 'package:e_commerce_app/features/homepage/presentation/screens/products_categories.dart';
import 'package:e_commerce_app/features/product/presentation/screens/productPage.dart';
import 'package:e_commerce_app/features/product/presentation/screens/product_grid_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/sign_in/send_email.dart';
import '../../features/auth/presentation/screens/sign_in/sign_in_email.dart';
import '../../features/auth/presentation/screens/sign_in/sign_in_password.dart';
import '../../features/auth/presentation/screens/sign_up/sign_up.dart';
import '../../features/auth/presentation/screens/splash_page.dart';
import '../../features/homepage/presentation/screens/home_page.dart';

class AppRoute {
  BuildContext context;

  AppRoute({required this.context});

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case RouteNames.signInEmail:
      // return MaterialPageRoute(builder: (_) => const SignInEmail());
      case RouteNames.splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RouteNames.signInEmail:
        return MaterialPageRoute(builder: (_) => const SignInEmail());
      //   case RouteNames.signInPassword:
      //     return MaterialPageRoute(builder: (_) => const SignInPassword());
      case RouteNames.createAccount:
        return MaterialPageRoute(builder: (_) => const CreateAccount());
        return MaterialPageRoute(builder: (_) => const SendEmail());
      case RouteNames.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RouteNames.productPage:
        return MaterialPageRoute(builder: (_) => const ProductPage());
      // case RouteNames.infoPage:
      //   return MaterialPageRoute(builder: (_) => const InfoPage());
      // case RouteNames.bottomNavBar:
      //   return MaterialPageRoute(builder: (_) => const BottomNavBar());
      //   case RouteNames.logInAbout:
      //     return MaterialPageRoute(builder: (_) => const LogInAbout());
      case RouteNames.productsCategories:
        return MaterialPageRoute(builder: (_) => CategoryList());
      case RouteNames.productList:
        return MaterialPageRoute(builder: (_) => const ProductGridPage());
      //   case RouteNames.orderDetails:
      //     return MaterialPageRoute(builder: (_) => const CheckingPage());
      //   case RouteNames.searchingPage:
      //     return MaterialPageRoute(builder: (_) => const SearchingPage());
      //   case RouteNames.filteringPage:
      //     return MaterialPageRoute(builder: (_) => const FilteringPage());
      //   case RouteNames.checkoutPage:
      //     return MaterialPageRoute(builder: (_) => const CheckoutPage());
      //   case RouteNames.messagePage:
      //     return MaterialPageRoute(builder: (_) => const MessagePage());
      //   case RouteNames.addAddress:
      //     return MaterialPageRoute(builder: (_) => const AddAddress());
      //   case RouteNames.addressEdit:
      //     return MaterialPageRoute(builder: (_) => const AddressEdit());
      //   case RouteNames.payment:
      //     return MaterialPageRoute(builder: (_) => const PaymentPage());
      //   case RouteNames.addCard:
      //     return MaterialPageRoute(builder: (_) => const AddCardPage());
      //   case RouteNames.wishlist:
      //     return MaterialPageRoute(builder: (_) => const Wishlist());
      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      ),
    );
  }
}
