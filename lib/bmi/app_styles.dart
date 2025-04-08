import 'package:flutter/material.dart';
import 'package:flutter_s2/bmi/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static final buttonTextStyle =  GoogleFonts.inter(fontSize: 32,
  fontWeight: FontWeight.w600,color: Colors.white);
   static final labelTextStyle =  GoogleFonts.inter(fontSize: 20,
  fontWeight: FontWeight.w400,color: AppColors.grey);
   static final resultMessageTextStyle =  GoogleFonts.inter(fontSize: 16,
  fontWeight: FontWeight.w500,color: AppColors.grey);
  static final numberTextStyle =  GoogleFonts.inter(fontSize: 40,
  fontWeight: FontWeight.bold ,color:Colors.white);
  static final subtitleTextStyle =  GoogleFonts.inter(fontSize: 15,
  fontWeight: FontWeight.w500 ,color:Colors.white);
  static final resultTextStyle =  GoogleFonts.inter(fontSize: 20,
  fontWeight: FontWeight.bold ,color:AppColors.green);
}
