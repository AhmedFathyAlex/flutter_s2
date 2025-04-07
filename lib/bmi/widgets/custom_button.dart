import 'package:flutter/material.dart';
import 'package:flutter_s2/bmi/app_colors.dart';
import 'package:flutter_s2/bmi/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key , this.title = '' , this.onClick});
  final String title;
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 80,
        color: AppColors.pink,
        child: Text(title,style: AppStyles.buttonTextStyle, ),
      ),
    );
  }
}