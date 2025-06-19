enum ChargingStationStatus {
  charging,
  completed,
  waiting;

  @override
  String toString() {
    switch (this) {
      case ChargingStationStatus.charging:
        return 'Заряжается';
      case ChargingStationStatus.completed:
        return 'Зарядилось';
      case ChargingStationStatus.waiting:
        return 'Ожидает';
    }
  }
}

class ChargingStation {
  final String id;
  final String name;
  final ChargingStationStatus status;
  final DateTime startTime;
  final int durationMinutes;
  final double powerConsumed;
  final int startPercentage;
  final int currentPercentage;
  final double powerOutput;

  ChargingStation({
    required this.id,
    required this.name,
    required this.status,
    required this.startTime,
    required this.durationMinutes,
    required this.powerConsumed,
    required this.startPercentage,
    required this.currentPercentage,
    required this.powerOutput,
  });

  ChargingStation copyWith({
    String? id,
    String? name,
    ChargingStationStatus? status,
    DateTime? startTime,
    int? durationMinutes,
    double? powerConsumed,
    int? startPercentage,
    int? currentPercentage,
    double? powerOutput,
  }) {
    return ChargingStation(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,  
      startTime: startTime ?? this.startTime,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      powerConsumed: powerConsumed ?? this.powerConsumed,
      startPercentage: startPercentage ?? this.startPercentage,
      currentPercentage: currentPercentage ?? this.currentPercentage,
      powerOutput: powerOutput ?? this.powerOutput,
    );
  }
}
