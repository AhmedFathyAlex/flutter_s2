import 'package:flutter/material.dart';
import 'package:flutter_s2/bmi/app_colors.dart';
import 'package:flutter_s2/bmi/app_styles.dart';
import 'package:flutter_s2/bmi/result_model.dart';
import 'package:flutter_s2/bmi/widgets/custom_app_bar.dart';
import 'package:flutter_s2/bmi/widgets/custom_button.dart';
import 'package:flutter_s2/bmi/widgets/custom_container.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.model});
  final ResultModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(), 
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Your Result', style: AppStyles.numberTextStyle,),
            ), 
            CustomContainer(
              containerChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(model.result,style: AppStyles.resultTextStyle,),
                  Text(model.bmi, style: AppStyles.numberTextStyle.copyWith(fontSize: 64),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(model.message,
                    textAlign: TextAlign.center, style: AppStyles.resultMessageTextStyle,),
                  ),
                   Row(),
                ],
              ),
            ), 
            CustomButton(title: 'RE-CALCULATE',)
          ],
                ),
        ),
    );
  }
}