import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkChecker {
  // CHECK DEVICE'S INTERNET CONNECTION
  static Future<bool> isNetwork() async {
    bool isInternet = await InternetConnectionChecker().hasConnection;
    return isInternet;
  }
}
