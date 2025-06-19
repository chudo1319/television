import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:television/common/styles/app_sizes.dart';
import 'package:television/common/utils/extensions/context_extensions.dart';
import 'package:television/models/charging_station.dart';
import 'package:television/screens/main/widgets/start_row.dart';

class EmptyInfoItem extends StatelessWidget {
  final double fontScale;

  const EmptyInfoItem({super.key, required this.fontScale});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand();
  }
}

class InfoItem extends StatefulWidget {
  final double fontScale;
  final ChargingStation station;
  final int itemsCount;

  const InfoItem({
    super.key,
    required this.fontScale,
    required this.station,
    required this.itemsCount,
  });

  @override
  State<InfoItem> createState() => _InfoItemState();
}

class _InfoItemState extends State<InfoItem> {
  @override
  Widget build(BuildContext context) {
    final scale = widget.fontScale;
    final minFontSize = 40.0;
    final station = widget.station;
    final itemsCount = widget.itemsCount;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.double24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:
                itemsCount <= 5
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.end,
            children: [
              if (itemsCount <= 5)
                StartRowLessFive(
                  station: station,
                  minFontSize: minFontSize,
                  scale: scale,
                ),
              if (itemsCount > 5)
                StartRowMoreFive(
                  station: station,
                  minFontSize: minFontSize,
                  scale: scale,
                ),
              CenterRow(
                station: station,
                minFontSize: minFontSize,
                scale: scale,
                itemCount: itemsCount,
              ),
              EndRow(
                station: station,
                minFontSize: minFontSize,
                scale: scale,
                itemCount: itemsCount,
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
            .map(
              (station) => InfoItem(
                fontScale: fontScale,
                station: station,
                itemsCount: itemsCount,
              ),
            )
            .toList();
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
      return LayoutBuilder(
        builder: (context, constraints) {
          final itemHeight = constraints.maxHeight / 3;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (int i = 0; i < items.length; i++) ...[
                SizedBox(height: itemHeight, child: items[i]),
                Divider(
                  color: context.color.onBackground,
                  thickness: 1,
                  height: 1,
                ),
              ],
              const Spacer(),
            ],
          );
        },
      );
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
    final bool needsEmptyCell = itemCount > 5 && itemCount % 2 != 0;

    final rightColumnItems = List<Widget>.from(
      items.sublist(leftColumnCount, itemCount),
    );
    if (needsEmptyCell) {
      rightColumnItems.add(EmptyInfoItem(fontScale: 1.0));
    }

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
              rightColumnItems.map((item) => Expanded(child: item)).toList(),
              context,
            ),
          ),
        ),
      ],
    );
  }
}
