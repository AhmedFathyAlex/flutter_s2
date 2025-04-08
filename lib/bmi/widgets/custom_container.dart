import 'package:flutter/material.dart';
import 'package:flutter_s2/bmi/app_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key , this.isActive = true , this.containerChild , this.onClick});
  final bool isActive;
  final Widget? containerChild;
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          margin: EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: isActive ? AppColors.activeContainerColor :
             AppColors.inActiveContainerColor,
            borderRadius: BorderRadius.circular(15) 
          ),
          child: containerChild,
        ),
      ),
    );
  }
}