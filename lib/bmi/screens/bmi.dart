import 'package:flutter/material.dart';
import 'package:flutter_s2/bmi/app_colors.dart';
import 'package:flutter_s2/bmi/widgets/custom_app_bar.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Column(
        children: [
          CustomAppBar()
        ],
      ),
    );
  }
}