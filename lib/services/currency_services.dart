import 'package:apps/models/currency_list_resposne.dart';
import 'package:apps/utils/export_utils.dart';
import 'package:dio/dio.dart';

class CurrencyService {
  final dio = Dio();
  BaseOptions getBaseOptions() => dio.options = BaseOptions(
        followRedirects: false,
        validateStatus: (status) {
          return (status ?? 0) <= 500;
        },
        connectTimeout: 60000, // 1 minute
      );

  Future<List<CurrencyListResposne>?> getCurrencyList() async {
    try {
      const sURL = NetworkConst.sCurrencyLsit;

      final Response response = await dio.get(sURL);
      final fetchResult = response.data as List<dynamic>;
      List<CurrencyListResposne> currencyList = [];

      for (var element in fetchResult) {
        currencyList.add(CurrencyListResposne.fromJson(element));
      }

      return currencyList;
    } catch (ex) {
      "API getCurrencyList error: $ex".printLog();
    }
    return null;
  }

  Future<CurrencyListResposne?> getCurrencyInfo({required currency}) async {
    try {
      final sURL = "${NetworkConst.sCurrencyInfo}?symbol=$currency";
      final Response response = await dio.get(sURL);
      sURL.printLog();
      response.statusCode.toString().printLog();
      response.data.toString().printLog();
      final Map<String, dynamic> fetchResult = response.data;
      CurrencyListResposne currencyInfo;

      currencyInfo = CurrencyListResposne.fromJson(fetchResult);

      return currencyInfo;
    } catch (ex) {
      "API getCurrencyInfo error: $ex".printLog();
    }
    return null;
  }
}
