import 'package:apps/screens/currency_info_screen.dart';
import 'package:apps/screens/currency_list_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();

  static String inital = '/';
  static String currencyInfo = "/currencyInfo";

  static final List<GetPage<dynamic>> routes = [
    GetPage(name: inital, page: () => const CurrencyListScreen()),
    GetPage(name: currencyInfo, page: () => const CurrencyInfoScreen()),
  ];
}
