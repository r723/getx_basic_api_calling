import 'package:apps/models/currency_list_resposne.dart';
import 'package:apps/services/currency_services.dart';
import 'package:apps/utils/export_utils.dart';
import 'package:apps/widgets/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrencyListController extends GetxController {
  final Rx<bool> isLoader = false.obs;
  List<CurrencyListResposne> currencyList = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getCurrenctListApi(isLoder: true);
    });
  }

  // EVENTS
  Future<void> currencyTap(index) async {
    Get.toNamed(AppRoutes.currencyInfo,
        arguments: {'currency': currencyList[index].symbol ?? ""});
  }

  // API CALLS
  Future<void> getCurrenctListApi({bool isLoder = true}) async {
    if (!await NetworkChecker.isNetwork()) {
      showToast(message: StringConst.sErrorNoInternet);
    }

    if (isLoder) isLoader.value = true;

    final fetchData = await CurrencyService().getCurrencyList();

    if (fetchData == null) {
      return showToast(message: StringConst.sSomethingWentWrong);
    }
    currencyList = fetchData;
    isLoader.value = false;
    update();
  }
}
