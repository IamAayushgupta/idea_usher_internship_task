import 'package:get/get.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class HealthService extends GetxService {
  final Health health = Health();

  final List<HealthDataType> types = [
    HealthDataType.STEPS,
    HealthDataType.ACTIVE_ENERGY_BURNED,
  ];

  final List<HealthDataAccess> permissions = [
    HealthDataAccess.READ,
    HealthDataAccess.READ,
  ];

  Future<void> authorize() async {
    await Permission.activityRecognition.request();
    await Permission.location.request();

    await health.requestAuthorization(
      types,
      permissions: permissions,
    );
  }

  Future<int?> getSteps() async {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));

    return await health.getTotalStepsInInterval(
      yesterday,
      now,
    );
  }

  Future<int?> getCalories() async {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));

    final healthData = await health.getHealthDataFromTypes(
      types: [HealthDataType.ACTIVE_ENERGY_BURNED],
      startTime: yesterday,
      endTime: now,
    );

    double totalCalories = 0;

    for (final point in healthData) {
      final value = point.value;

      if (value is NumericHealthValue) {
        totalCalories += value.numericValue;
      }
    }

    return totalCalories.round();
  }

}
