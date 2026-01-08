import 'package:boozin_fitness/controllers/splash_controller.dart';
import 'package:boozin_fitness/services/health_service.dart';
import 'package:get/get.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(HealthService());
  }
}
