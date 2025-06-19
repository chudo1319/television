import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:television/common/func/get_status_color.dart';
import 'package:television/common/styles/app_sizes.dart';
import 'package:television/common/utils/extensions/context_extensions.dart';
import 'package:television/generated/assets.dart';
import 'package:television/models/charging_station.dart';

class StartRowLessFive extends StatelessWidget {
  const StartRowLessFive({
    super.key,
    required this.station,
    required this.minFontSize,
    required this.scale,
  });
  final ChargingStation station;
  final double minFontSize;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CirlceNumber(station: station, minFontSize: minFontSize, scale: scale),
        Gap(AppSizes.double20),
        DurationColumn(
          station: station,
          minFontSize: minFontSize,
          scale: scale,
        ),
      ],
    );
  }
}

class StartRowMoreFive extends StatelessWidget {
  const StartRowMoreFive({
    super.key,
    required this.station,
    required this.minFontSize,
    required this.scale,
  });
  final ChargingStation station;
  final double minFontSize;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CirlceNumber(station: station, minFontSize: minFontSize, scale: scale),
        DurationColumn(
          station: station,
          minFontSize: minFontSize,
          scale: scale,
        ),
      ],
    );
  }
}

class DurationColumn extends StatelessWidget {
  const DurationColumn({
    super.key,
    required this.station,
    required this.minFontSize,
    required this.scale,
  });
  final ChargingStation station;
  final double minFontSize;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              'Сессия',
              style: context.text.regular16.copyWith(
                color: context.color.textFieldHelper,
                fontSize: (25 * scale).clamp(minFontSize, 50.0),
              ),
            ),
          ],
        ),
        Gap(AppSizes.double5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${station.startTime.hour.toString().padLeft(2, '0')}:${station.startTime.minute.toString().padLeft(2, '0')}',
              style: context.text.regular16.copyWith(
                color: context.color.onBackground,
                fontSize: (25 * scale).clamp(minFontSize, 50.0),
              ),
            ),
            Gap(AppSizes.double12),
            Text(
              // '${station.durationMinutes} мин',
              '11ч 45м',
              style: context.text.regular16.copyWith(
                color: context.color.onBackground,
                fontSize: (25 * scale).clamp(minFontSize, 50.0),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CirlceNumber extends StatelessWidget {
  const CirlceNumber({
    super.key,
    required this.station,
    required this.minFontSize,
    required this.scale,
  });
  final ChargingStation station;
  final double minFontSize;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
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
      child: Text(
        station.id,
        style: context.text.semiBold24.copyWith(
          color: getStatusColor(station.status, context),
          fontSize: (60 * scale).clamp(minFontSize, 100.0),
        ),
      ),
    );
  }
}

class CenterRow extends StatelessWidget {
  const CenterRow({
    super.key,
    required this.station,
    required this.minFontSize,
    required this.scale,
    required this.itemCount,
  });
  final ChargingStation station;
  final double minFontSize;
  final double scale;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: itemCount <= 5 ? 300 * scale : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
        ],
      ),
    );
  }
}

class EndRow extends StatelessWidget {
  const EndRow({
    super.key,
    required this.station,
    required this.minFontSize,
    required this.scale,
    required this.itemCount,
  });
  final ChargingStation station;
  final double minFontSize;
  final double scale;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: itemCount <= 5 ? 400 * scale : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
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
      ),
    );
  }
}
