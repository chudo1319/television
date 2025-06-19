import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:television/common/func/get_status_color.dart';
import 'package:television/common/styles/app_sizes.dart';
import 'package:television/common/utils/extensions/context_extensions.dart';
import 'package:television/generated/assets.dart';
import 'package:television/models/charging_station.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.station,
    required this.minFontSize,
    required this.scale,
    required this.itemCount,
    required this.isCenter,
  });

  final ChargingStation station;
  final double minFontSize;
  final double scale;
  final int itemCount;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: itemCount <= 5 ? (isCenter ? 300 : 400) * scale : null,
      child: Column(
        mainAxisAlignment: isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
        crossAxisAlignment: isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.end,
        children: [
          if (isCenter) ...[
            Text(
              '${station.powerConsumed.toStringAsFixed(1)} кВт•ч',
              style: context.text.regular16.copyWith(
                color: context.color.onBackground,
                fontSize: (20 * scale).clamp(minFontSize, 80.0),
              ),
              textAlign: TextAlign.center,
            ),
            Gap(AppSizes.double5),
            Row(
              mainAxisAlignment: isCenter ? MainAxisAlignment.start : MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: AppSizes.double4),
                  child: SvgPicture.asset(
                    Assets.iconsCharge,
                    width: 45 * scale,
                    height: 45 * scale,
                  ),
                ),
                Text(
                  '${station.startPercentage}% ⇒ ${station.currentPercentage}%',
                  style: context.text.semiBold24.copyWith(
                    color: context.color.onBackground,
                    fontSize: (45 * scale).clamp(minFontSize, 70.0),
                  ),
                ),
              ],
            ),
          ] else ...[
            Text(
              station.status.toString(),
              style: context.text.semiBold24.copyWith(
                color: getStatusColor(station.status, context),
                fontSize: (25 * scale).clamp(minFontSize, 50.0),
              ),
            ),
            Gap(AppSizes.double5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
        ],
      ),
    );
  }
} 