import 'package:apps/utils/routes.dart';
import 'package:get/get.dart';
import 'package:apps/screens/currency_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return GetMaterialApp(
      getPages: AppRoutes.routes,
      title: 'Currency Exchange',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CurrencyListScreen(),
    );
  }
}
