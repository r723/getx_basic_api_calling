import 'package:apps/controllers/export_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CurrencyInfoScreen extends StatelessWidget {
  const CurrencyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Currency Info")),
      body: GetBuilder(
          init: CurrencyInfoController(),
          builder: (controller) {
            return controller.isLoader.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.currency_exchange,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 12),
                            Text(controller.currencyInfo?.symbol ?? ""),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.arrow_drop_down_circle,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 8),
                            Text(controller.currencyInfo?.lowPrice ?? ""),
                            const SizedBox(width: 12),
                            const RotatedBox(
                              quarterTurns: -2,
                              child: Icon(
                                Icons.arrow_drop_down_circle,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(controller.currencyInfo?.highPrice ?? "")
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                            "Last price - ${controller.currencyInfo?.lastPrice ?? ""}"),
                        const SizedBox(height: 8),
                        Text(
                            "Open price - ${controller.currencyInfo?.openPrice ?? ""}"),
                        const SizedBox(height: 8),
                        Text(
                            "BidPrice price - ${controller.currencyInfo?.bidPrice ?? ""}"),
                      ],
                    ),
                  );
          }),
    );
  }
}
