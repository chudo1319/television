import 'package:flutter/material.dart';
import 'package:television/common/utils/extensions/context_extensions.dart';

import '../../models/charging_station.dart';

Color getStatusColor(ChargingStationStatus status, BuildContext context) {
  switch (status) {
    case ChargingStationStatus.charging:
      return context.color.chargingStatus;
    case ChargingStationStatus.completed:
      return context.color.errorStatus;
    case ChargingStationStatus.waiting:
      return context.color.connectedStatus;
  }
}