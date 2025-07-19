import 'package:flutter/material.dart';
import 'app.dart';
import 'bloc_provider.dart';
import 'service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(
    MultiBlocProviderWrapper(
      child: const MyApp(),
    ),
  );
}
