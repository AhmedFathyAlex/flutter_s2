import 'package:flutter/material.dart';
import 'package:flutter_s2/bmi/app_colors.dart';
import 'package:flutter_s2/bmi/app_styles.dart';
import 'package:flutter_s2/bmi/widgets/custom_app_bar.dart';
import 'package:flutter_s2/bmi/widgets/custom_button.dart';
import 'package:flutter_s2/bmi/widgets/custom_container.dart';
import 'package:flutter_s2/bmi/widgets/round_button.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  bool isMale = true;
  int weight = 50;
  int age = 20;
  int height = 200;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        body: Column(
          children: [
            CustomAppBar(),
            Expanded(
              child: Row(
                children: [
                  CustomContainer(
                    onClick: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    isActive: isMale,
                    containerChild: Column(
                      children: [
                        Icon(Icons.male, size: 110, color: Colors.white,), 
                        Text('MALE',style: AppStyles.labelTextStyle)],
                    ),
                  ),
                  CustomContainer(
                    onClick: () {
                      setState(() {
                         isMale = false;
                      });
                    },
                    isActive: !isMale,
                      containerChild: Column(
                      children: [
                        Icon(Icons.female, size: 110, color: Colors.white,), 
                        Text('FEMALE',style: AppStyles.labelTextStyle)],
                    ),
                  ),
                ],
              ),
            ),
            CustomContainer(
              containerChild: Column(
                  children: [
                    Row(),
                    Text('HEIGHT', style : AppStyles.labelTextStyle,),
                    RichText(text: TextSpan(
                      children: [
                        TextSpan(text: '$height', style : AppStyles.numberTextStyle,),
                        TextSpan(text: 'cm', style : AppStyles.subtitleTextStyle,),
                      ]
                    ),
                    ),
                  Slider(value: height.toDouble(), 
                  onChanged: (newValue){
                    setState(() {
                      height = newValue.round();
                    });
                  } ,
                   min: 140, max: 250, 
                   activeColor: AppColors.pink,)  
                  ],
                ),
            ),
            Expanded(
              child: Row(children: [CustomContainer(
                containerChild: Column(
                  children: [
                    Text('WEIGHT', style : AppStyles.labelTextStyle,),
                    Text('$weight', style : AppStyles.numberTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RoundButton(isDecrement: true,onClick: () {
                          setState(() {
                            weight--;
                          });
                        },),
                        RoundButton(
                          onClick: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ), CustomContainer(
                containerChild: Column(
                  children: [
                    Text('Age', style : AppStyles.labelTextStyle,),
                    Text('$age', style : AppStyles.numberTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RoundButton(isDecrement: true,onClick: () {
                          setState(() {
                            age--;
                          });
                        },),
                        RoundButton(
                          onClick: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )]),
            ),
            CustomButton(
              title: 'Calculate',
              onClick: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Clicked')));
              },
            ),
          ],
        ),
      ),
    );
  }
}
