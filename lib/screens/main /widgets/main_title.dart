import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:television/common/utils/extensions/context_extensions.dart';
import 'package:television/generated/assets.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(Assets.imagesLogo, width: 100, height: 100),
                Text(
                  DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()),
                  style: context.text.medium24.copyWith(
                    color: context.color.onBackground,
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                'Электрозарядка',
                style: context.text.semiBold31.copyWith(
                  color: context.color.onBackground,
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
