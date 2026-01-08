import 'package:get/get.dart';
import '../services/health_service.dart';

class HomeController extends GetxController {
  final HealthService _healthService = Get.find<HealthService>();

  var steps = 0.obs;
  var calories = 0.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchHealthData();
  }

  void fetchHealthData() async {
    try {
      isLoading(true);
      await _healthService.authorize();
      var stepsData = await _healthService.getSteps();
      var caloriesData = await _healthService.getCalories();

      if (stepsData != null) steps.value = stepsData;
      if (caloriesData != null) calories.value = caloriesData;
    } catch (e) {
      print('Error fetching health data: $e');
    } finally {
      isLoading(false);
    }
  }
}
