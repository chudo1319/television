import 'package:get/get.dart';
import 'package:television/models/charging_station.dart';

class ChargingController extends GetxController {
  final RxList<ChargingStation> stations = <ChargingStation>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadMockData();
  }

  final List<ChargingStation> _mockData = [
    ChargingStation(
        id: '1',
        name: 'CCS2',
        status: ChargingStationStatus.charging,
        startTime: DateTime.now().subtract(const Duration(minutes: 8)),
        durationMinutes: 8,
        powerConsumed: 2.7,
        startPercentage: 2,
        currentPercentage: 13,
        powerOutput: 20.7,
      ),
      ChargingStation(
        id: '2',
        name: 'CCS1',
        status: ChargingStationStatus.waiting,
        startTime: DateTime.now(),
        durationMinutes: 0,
        powerConsumed: 0.0,
        startPercentage: 0,
        currentPercentage: 0,
        powerOutput: 0.0,
      ),
      ChargingStation(
        id: '3',
        name: 'CCS3',
        status: ChargingStationStatus.completed,
        startTime: DateTime.now().subtract(const Duration(hours: 2)),
        durationMinutes: 45,
        powerConsumed: 100,
        startPercentage: 10,
        currentPercentage: 100,
        powerOutput: 240.0,
      ),
      ChargingStation(
        id: '4',
        name: 'CCS4',
        status: ChargingStationStatus.charging,
        startTime: DateTime.now().subtract(const Duration(minutes: 15)),
        durationMinutes: 15,
        powerConsumed: 5.1,
        startPercentage: 15,
        currentPercentage: 35,
        powerOutput: 18.3,
      ),
      ChargingStation(
        id: '5',
        name: 'CCS4',
        status: ChargingStationStatus.charging,
        startTime: DateTime.now().subtract(const Duration(minutes: 15)),
        durationMinutes: 15,
        powerConsumed: 5.1,
        startPercentage: 15,
        currentPercentage: 35,
        powerOutput: 18.3,
      ),
      ChargingStation(
        id: '6',
        name: 'CCS6',
        status: ChargingStationStatus.charging,
        startTime: DateTime.now().subtract(const Duration(minutes: 15)),
        durationMinutes: 15,
        powerConsumed: 5.1,
        startPercentage: 15,
        currentPercentage: 35,
        powerOutput: 18.3,
      ),
      ChargingStation(
        id: '7',
        name: 'CCS7',
        status: ChargingStationStatus.waiting,
        startTime: DateTime.now().subtract(const Duration(minutes: 15)),
        durationMinutes: 15,
        powerConsumed: 5.1,
        startPercentage: 15,
        currentPercentage: 35,
        powerOutput: 18.3,
      ),
      ChargingStation(
        id: '8',
        name: 'CCS8',
        status: ChargingStationStatus.charging,
        startTime: DateTime.now().subtract(const Duration(minutes: 15)),
        durationMinutes: 15,
        powerConsumed: 5.1,
        startPercentage: 15,
        currentPercentage: 35,
        powerOutput: 18.3,
      ),
      ChargingStation(
        id: '9',
        name: 'CCS9',
        status: ChargingStationStatus.charging,
        startTime: DateTime.now().subtract(const Duration(minutes: 15)),
        durationMinutes: 15,
        powerConsumed: 5.1,
        startPercentage: 15,
        currentPercentage: 35,
        powerOutput: 18.3,
      ),
      ChargingStation(
        id: '10',
        name: 'CCS10',
        status: ChargingStationStatus.waiting,
        startTime: DateTime.now().subtract(const Duration(minutes: 15)),
        durationMinutes: 15,
        powerConsumed: 5.1,
        startPercentage: 15,
        currentPercentage: 35,
        powerOutput: 18.3,
      ),
  ];

  void _loadMockData() {
    stations.value = List.generate(3, (index) => _mockData[index]);
  }
}
