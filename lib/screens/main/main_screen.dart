import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:television/common/styles/app_sizes.dart';
import 'package:television/controllers/charging_controller.dart';
import 'package:television/screens/main/widgets/info_items.dart';
import 'package:television/screens/main/widgets/main_title.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChargingController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: AppSizes.double14),
          child: Column(
            children: [
              MainTitle(),
              Obx(
                () => Expanded(
                  child: InfoItemsGrid(
                    itemsCount: controller.stations.length,
                    stations: controller.stations,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
