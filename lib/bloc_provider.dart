import 'package:e_commerce_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:e_commerce_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/bloc/log_in/log_in_bloc.dart';
import 'features/homepage/presentation/bloc/category_bloc.dart';
import 'features/homepage/presentation/bloc/category_event.dart';
import 'features/product/presentation/bloc/product_bloc.dart';
import 'features/product/presentation/bloc/product_event.dart';

class MultiBlocProviderWrapper extends StatelessWidget {
  final Widget child;

  const MultiBlocProviderWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryBloc>(
          create: (_) => di<CategoryBloc>()..add(LoadCategories(limit: 5)),
        ),
        BlocProvider<ProductBloc>(
          create: (_) =>
          di<ProductBloc>()..add(GetProductsEvent(limit: 10, offset: 0)),
        ),
        BlocProvider<AuthBloc>(
          create: (_) => di<AuthBloc>(),
        ),
        BlocProvider<LoginBloc>(
          create: (_) => di<LoginBloc>(),
        ),

      ],
      child: child,
    );
  }
}
