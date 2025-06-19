import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:television/common/styles/app_sizes.dart';
import 'package:television/common/utils/extensions/context_extensions.dart';
import 'package:television/generated/assets.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key});

  @override
  Widget build(BuildContext context) {
    const minFontSize = 60.0;

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: AppSizes.double16, right: AppSizes.double20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(Assets.imagesLogo, width: 100, height: 100),
                  Text(
                    DateFormat('dd.MM.yyyy  HH:mm').format(DateTime.now()),
                    style: context.text.medium24.copyWith(
                      color: context.color.onBackground,
                      fontSize: context.text.medium24.fontSize?.clamp(
                        minFontSize,
                        100.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                'Электрозарядка',
                style: context.text.semiBold31.copyWith(
                  color: context.color.onBackground,
                  fontSize: context.text.semiBold31.fontSize?.clamp(
                    minFontSize,
                    100.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(color: context.color.onBackground, thickness: 3),
      ],
    );
  }
}
