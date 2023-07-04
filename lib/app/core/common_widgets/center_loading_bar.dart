import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CenterLoadingBar extends StatelessWidget {
  const CenterLoadingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            height: 60.h,
            width: 60.h,
            child: const CircularProgressIndicator()));
  }
}
