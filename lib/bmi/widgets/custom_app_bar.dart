import 'package:flutter/material.dart';
import 'package:flutter_s2/bmi/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: AppColors.appBarBackgroundColor,
      width: double.infinity,
      height: 50,
      child: Text(
        'BMI Calculator',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
