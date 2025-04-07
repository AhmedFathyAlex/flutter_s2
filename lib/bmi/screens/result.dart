import 'package:flutter/material.dart';
import 'package:flutter_s2/bmi/app_colors.dart';
import 'package:flutter_s2/bmi/widgets/custom_app_bar.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
        body: Column(
        children: [
          CustomAppBar()
        ],
      ),
    );
  }
}