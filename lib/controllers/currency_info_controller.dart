import 'package:apps/models/currency_list_resposne.dart';
import 'package:apps/services/currency_services.dart';
import 'package:apps/utils/export_utils.dart';
import 'package:apps/widgets/helper_widgets.dart';
import 'package:get/get.dart';

class CurrencyInfoController extends GetxController {
  String currency = "";
  final Rx<bool> isLoader = false.obs;
  CurrencyListResposne? currencyInfo;

  @override
  void onInit() async {
    super.onInit();
    currency = Get.arguments['currency'] ?? "";
    await getCurrencyInfoApi();
  }

  // API CALLS
  Future<void> getCurrencyInfoApi({bool isLoder = true}) async {
    if (!await NetworkChecker.isNetwork()) {
      showToast(message: StringConst.sErrorNoInternet);
    }

    if (isLoder) isLoader.value = true;

    final fetchData =
        await CurrencyService().getCurrencyInfo(currency: currency);

    if (fetchData == null) {
      return showToast(message: StringConst.sSomethingWentWrong);
    }
    currencyInfo = fetchData;
    isLoader.value = false;
    update();
  }
}
