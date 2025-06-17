import 'package:flutter/material.dart';
import 'package:television/common/styles/app_sizes.dart';
import 'package:television/screens/main%20/widgets/info_items.dart';
import 'package:television/screens/main%20/widgets/main_title.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: AppSizes.double14),
          child: Column(
            children: [
              MainTitle(),
              Expanded(child: InfoItemsGrid(itemsCount: 9)),
            ],
          ),
        ),
      ),
    );
  }
}
