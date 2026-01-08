import 'package:boozin_fitness/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode?Colors.black:Colors.white,
      body: Center(
        child: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// 🔶 FIRST IMAGE (slides right & disappears)
            if (controller.showFirstLogo.value)
              AnimatedSlide(
                offset: controller.moveFirstLogo.value
                    ? const Offset(0.3, -0.15) // move right
                    : Offset.zero,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                child: AnimatedOpacity(
                  opacity: controller.moveFirstLogo.value ? 0 : 1,
                  duration: const Duration(milliseconds: 3000),
                  child: Image.asset(
                    'assets/images/Boozin Logo (2).png',

                  ),
                ),
              ),

            /// 🔶 SECOND IMAGE
            if (controller.showSecondLogo.value) ...[

              Image.asset(
                Get.isDarkMode
                    ? 'assets/images/Boozin Logo (3).png'
                    : 'assets/images/Boozin Logo (1).png',
                //height: 110,
              ),
              const SizedBox(height: 12),

              /// 🔶 FITNESS TEXT
              AnimatedOpacity(
                opacity: controller.showFitnessText.value ? 1 : 0,
                duration: const Duration(milliseconds: 600),
                child: Text(
                  'Fitness',
                  style: TextStyle(
                    color: !Get.isDarkMode?Colors.black:Colors.white,
                    fontSize: 14,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ],
        )),
      ),
    );
  }
}
