import 'package:flutter/material.dart';
import 'package:flutter_s2/bmi/app_colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, this.isDecrement = false, this.onClick});
  final bool isDecrement;
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        height: 42, 
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.grey
        ),
        child:Icon( isDecrement ?  Icons.remove : Icons.add , color: Colors.white,size:  32 , weight: 600,)
      ),
    );
  }
}