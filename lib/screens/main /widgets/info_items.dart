import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:television/common/styles/app_sizes.dart';
import 'package:television/common/utils/extensions/context_extensions.dart';
import 'package:television/generated/assets.dart';

class InfoItem extends StatefulWidget {
  final double fontScale;
  const InfoItem({super.key, required this.fontScale});

  @override
  State<InfoItem> createState() => _InfoItemState();
}

class _InfoItemState extends State<InfoItem> {
  @override
  Widget build(BuildContext context) {
    final scale = widget.fontScale;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.double8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '#2 / ',
                        style: context.text.semiBold24.copyWith(
                          color: context.color.onBackground,
                          fontSize: 36 * scale,
                        ),
                      ),
                      Text(
                        'CCS2',
                        style: context.text.regular24.copyWith(
                          color: context.color.onBackground,
                          fontSize: 36 * scale,
                        ),
                      ),
                    ],
                  ),
                  Gap(AppSizes.double4),
                  Text(
                    'Заряжается',
                    style: context.text.semiBold24.copyWith(
                      color: context.color.onBackground,
                      fontSize: 24 * scale,
                    ),
                  ),
                  Gap(AppSizes.double4),
                  Row(
                    children: [
                      Text(
                        'Начало',
                        style: context.text.regular16.copyWith(
                          color: context.color.onBackground,
                          fontSize: 16 * scale,
                        ),
                      ),
                      Gap(AppSizes.double12),
                      Text(
                        '17:02',
                        style: context.text.regular16.copyWith(
                          color: context.color.onBackground,
                          fontSize: 16 * scale,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Длительность',
                        style: context.text.regular16.copyWith(
                          color: context.color.onBackground,
                          fontSize: 16 * scale,
                        ),
                      ),
                      Gap(AppSizes.double12),
                      Text(
                        '8 мин',
                        style: context.text.regular16.copyWith(
                          color: context.color.onBackground,
                          fontSize: 16 * scale,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    Assets.iconsCharge,
                    width: 45 * scale,
                    height: 45 * scale,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '2.7 кВт•ч',
                        style: context.text.semiBold24.copyWith(
                          color: context.color.onBackground,
                          fontSize: 36 * scale,
                        ),
                      ),
                      Gap(AppSizes.double4),
                      Text(
                        '2% ⇒ 13%',
                        style: context.text.regular16.copyWith(
                          color: context.color.onBackground,
                          fontSize: 24 * scale,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    Assets.iconsFlash,
                    width: 45 * scale,
                    height: 45 * scale,
                  ),
                  Text(
                    '20.7 кВт',
                    style: context.text.semiBold31.copyWith(
                      color: context.color.onBackground,
                      fontSize: 31 * scale,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InfoItemsGrid extends StatelessWidget {
  final int itemsCount;

  const InfoItemsGrid({super.key, required this.itemsCount});

  @override
  Widget build(BuildContext context) {
    double fontScale = 1.0;
    if (itemsCount >= 9) {
      fontScale = 0.7;
    } else if (itemsCount >= 5) {
      fontScale = 0.8;
    }
    final items = List.generate(
      itemsCount,
      (index) => InfoItem(fontScale: fontScale),
    );
    
    if (itemsCount <= 2) {
      return Column(children: [_buildGrid(items, context), const Spacer()]);
    }
    return SizedBox.expand(child: _buildGrid(items, context));
  }

  List<Widget> _withDividers(List<Widget> items, BuildContext context) {
    final List<Widget> result = [];
    for (int i = 0; i < items.length; i++) {
      result.add(items[i]);
      if (i != items.length - 1) {
        result.add(
          Divider(color: context.color.onBackground, thickness: 1, height: 1),
        );
      }
    }
    return result;
  }

  Widget _buildGrid(List<Widget> items, BuildContext context) {
    final int itemCount = items.length;

    if (itemCount <= 2) {
      return Column(children: _withDividers(items, context));
    }

    if (itemCount <= 5) {
      return Column(
        children: _withDividers(
          items.map((item) => Expanded(child: item)).toList(),
          context,
        ),
      );
    }

    final int leftColumnCount = (itemCount + 1) ~/ 2;

    return Row(
      children: [
        Expanded(
          child: Column(
            children: _withDividers(
              items
                  .sublist(0, leftColumnCount)
                  .map((item) => Expanded(child: item))
                  .toList(),
              context,
            ),
          ),
        ),
        Container(color: context.color.onBackground, width: 1),
        Expanded(
          child: Column(
            children: _withDividers(
              items
                  .sublist(leftColumnCount, itemCount)
                  .map((item) => Expanded(child: item))
                  .toList(),
              context,
            ),
          ),
        ),
      ],
    );
  }
}
