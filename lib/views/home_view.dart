import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode?Colors.black:Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hi!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              Obx(() {
                 if (controller.isLoading.value) {
                   return const Center(child: CircularProgressIndicator());
                 }
                 return Column(
                  children: [
                    _buildMetricCard(
                      context,
                      title: 'Steps',
                      value: controller.steps.value.toString(),
                      goal: 'Goal: 15,000',
                      imagePath: !Get.isDarkMode?'assets/images/ion_footsteps-sharp.png':'assets/images/ion_footsteps-sharp (1).png',
                      progress: (controller.steps.value / 15000).clamp(0.0, 1.0),
                    ),
                    const SizedBox(height: 16),
                    _buildMetricCard(
                      context,
                      title: 'Calories Burned',
                      value: controller.calories.value.toString(),
                      goal: 'Goal: 1,000',
                      imagePath: !Get.isDarkMode?'assets/images/kcal 1.png':'assets/images/kcal 1 (1).png',
                      progress: (controller.calories.value / 1000).clamp(0.0, 1.0),
                      isCalories: true,
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMetricCard(
    BuildContext context, {
    required String title,
    required String value,
    required String goal,
    IconData? icon,
    String? imagePath,
    required double progress,
    bool isCalories = false,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    final cardColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.grey[200];
    final progressBackgroundColor = isDarkMode ? Colors.grey[800] : Colors.grey[400];
    final progressColor = isDarkMode ? Colors.white : Colors.black;
    final iconColor = isDarkMode ? Colors.white : Colors.black;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title: $value',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                LinearPercentIndicator(
                  lineHeight: 12.0,
                  percent: progress,
                  backgroundColor: progressBackgroundColor,
                  progressColor: progressColor,
                  barRadius: const Radius.circular(10),
                  padding: EdgeInsets.zero,
                ),
                 const SizedBox(height: 8),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     const Text('0', style: TextStyle(fontSize: 12, color: Colors.grey)),
                     Text(goal, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                   ],
                 )
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            children: [
              if (imagePath != null)
                Image.asset(imagePath, width: 40, height: 40)
              else if (icon != null)
                Icon(icon, size: 40, color: iconColor),
            ],
          ),
        ],
      ),
    );
  }
}
