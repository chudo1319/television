import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:television/common/func/get_status_color.dart';
import 'package:television/common/styles/app_sizes.dart';
import 'package:television/common/utils/extensions/context_extensions.dart';
import 'package:television/generated/assets.dart';
import 'package:television/models/charging_station.dart';

class InfoItem extends StatefulWidget {
  final double fontScale;
  final ChargingStation station;

  const InfoItem({super.key, required this.fontScale, required this.station});

  @override
  State<InfoItem> createState() => _InfoItemState();
}

class _InfoItemState extends State<InfoItem> {
  @override
  Widget build(BuildContext context) {
    final scale = widget.fontScale;
    final minFontSize = 40.0;
    final station = widget.station;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.double24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    width: 90 * scale,
                    height: 90 * scale,
                    decoration: BoxDecoration(
                      color: context.color.onTertiary,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: getStatusColor(station.status, context),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        station.id,
                        style: context.text.semiBold24.copyWith(
                          color: getStatusColor(station.status, context),
                          fontSize: (70 * scale).clamp(minFontSize, 100.0),
                        ),
                      ),
                    ),
                  ),
                  Gap(AppSizes.double16),
                  // Text(
                  //   station.name,
                  //   style: context.text.regular20.copyWith(
                  //     color: context.color.inactive,
                  //     fontSize: (50 * scale).clamp(minFontSize, 100.0),
                  //   ),
                  // ),
                  Spacer(),
                  Text(
                    station.status.toString(),
                    style: context.text.semiBold24.copyWith(
                      color: getStatusColor(station.status, context),
                      fontSize: (25 * scale).clamp(minFontSize, 50.0),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Начало',
                            style: context.text.regular16.copyWith(
                              color: context.color.textFieldHelper,
                              fontSize: (25 * scale).clamp(minFontSize, 50.0),
                            ),
                          ),
                          Gap(AppSizes.double12),
                          Text(
                            '${station.startTime.hour.toString().padLeft(2, '0')}:${station.startTime.minute.toString().padLeft(2, '0')}',
                            style: context.text.regular16.copyWith(
                              color: context.color.onBackground,
                              fontSize: (25 * scale).clamp(minFontSize, 50.0),
                            ),
                          ),
                        ],
                      ),
                      Gap(AppSizes.double5),
                      Row(
                        children: [
                          Text(
                            'Длительность',
                            style: context.text.regular16.copyWith(
                              color: context.color.textFieldHelper,
                              fontSize: (25 * scale).clamp(minFontSize, 50.0),
                            ),
                          ),
                          Gap(AppSizes.double12),
                          Text(
                            '${station.durationMinutes} мин',
                            style: context.text.regular16.copyWith(
                              color: context.color.onBackground,
                              fontSize: (25 * scale).clamp(minFontSize, 50.0),
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
                            '${station.powerConsumed.toStringAsFixed(1)} кВт•ч',
                            style: context.text.regular16.copyWith(
                              color: context.color.onBackground,
                              fontSize: (20 * scale).clamp(minFontSize, 80.0),
                            ),
                          ),
                          Gap(AppSizes.double5),
                          Text(
                            '${station.startPercentage}% ⇒ ${station.currentPercentage}%',
                            style: context.text.semiBold24.copyWith(
                              color: context.color.onBackground,
                              fontSize: (45 * scale).clamp(minFontSize, 70.0),
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
                        '${station.powerOutput.toStringAsFixed(1)} кВт',
                        style: context.text.semiBold31.copyWith(
                          color: context.color.onBackground,
                          fontSize: (45 * scale).clamp(minFontSize, 70.0),
                        ),
                      ),
                    ],
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
  final RxList<ChargingStation> stations;

  const InfoItemsGrid({
    super.key,
    required this.itemsCount,
    required this.stations,
  });

  @override
  Widget build(BuildContext context) {
    double fontScale = 1.0;

    if (itemsCount >= 11) {
      fontScale = 0.6;
    } else if (itemsCount >= 9) {
      fontScale = 0.65;
    } else if (itemsCount >= 5) {
      fontScale = 0.9;
    }

    final items =
        stations
            .map((station) => InfoItem(fontScale: fontScale, station: station))
            .toList();

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
