import 'package:apps/controllers/currency_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CurrencyListScreen extends StatelessWidget {
  const CurrencyListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency Exchange"),
      ),
      body: GetBuilder(
        init: CurrencyListController(),
        builder: (controller) {
          return RefreshIndicator(
              child: Obx(
                () => controller.isLoader.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: controller.currencyList.length,
                        itemBuilder: ((context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                elevation: 4,
                                child: InkWell(
                                  onTap: () => controller.currencyTap(index),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.currency_exchange,
                                                    color: Colors.black,
                                                  ),
                                                  const SizedBox(width: 12),
                                                  Text(controller
                                                      .currencyList[index]
                                                      .symbol
                                                      .toString()),
                                                ],
                                              ),
                                              const SizedBox(height: 8),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons
                                                        .arrow_drop_down_circle,
                                                    color: Colors.red,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(controller
                                                      .currencyList[index]
                                                      .lowPrice
                                                      .toString()),
                                                  const SizedBox(width: 12),
                                                  const RotatedBox(
                                                    quarterTurns: -2,
                                                    child: Icon(
                                                      Icons
                                                          .arrow_drop_down_circle,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(controller
                                                      .currencyList[index]
                                                      .highPrice
                                                      .toString())
                                                ],
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                  "Last price - ${controller.currencyList[index].lastPrice}"),
                                            ],
                                          ),
                                        ),
                                        const Icon(
                                            Icons.arrow_forward_ios_sharp)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ),
              ),
              onRefresh: () => controller.getCurrenctListApi(isLoder: false));
        },
      ),
    );
  }
}
