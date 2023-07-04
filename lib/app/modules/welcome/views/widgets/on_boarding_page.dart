import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/values/on_boarding_static.dart';

class WelcomeOnBoarding extends StatelessWidget {
  final int index;

  const WelcomeOnBoarding({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          onBoardingList[index].image!,
          width: 360.w,
          height: 300.h,
          fit: BoxFit.fill,
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            onBoardingList[index].title!.tr,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineMedium,
            

          ),
        ),
          SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            onBoardingList[index].body!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
        
          ),
        ),
      ],
    );
  }
}
