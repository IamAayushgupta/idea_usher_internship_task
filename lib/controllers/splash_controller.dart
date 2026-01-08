import 'package:boozin_fitness/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final showFirstLogo = true.obs;
  final moveFirstLogo = false.obs;

  final showSecondLogo = false.obs;
  final showFitnessText = false.obs;

  @override
  void onInit() {
    super.onInit();
    _startAnimation();
  }

  Future<void> _startAnimation() async {
    // Hold first logo
    await Future.delayed(const Duration(milliseconds: 800));

    // Slide first logo to right
    moveFirstLogo.value = true;

    await Future.delayed(const Duration(milliseconds: 600));
    showFirstLogo.value = false;

    // Show second logo
    showSecondLogo.value = true;

    await Future.delayed(const Duration(milliseconds: 600));
    showFitnessText.value = true;

    await Future.delayed(const Duration(milliseconds: 1200));
    Get.offAllNamed(Routes.HOME);
  }
}
