
import 'package:get/get.dart';
import 'package:sample_login/app/core/values/text_strings.dart';

import '../../data/models/onboarding_model.dart';
import 'image_strings.dart';


List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title:
          zOnBoardingTitle1
              .tr,
      body: zOnBoardingSubTitle1.tr,
      image: ZImageAssets.onBoardingImageThree),
  OnBoardingModel(
      title:
          zOnBoardingTitle2
              .tr,
      body:  zOnBoardingSubTitle2.tr,
      image: ZImageAssets.onBoardingImageOne),
  OnBoardingModel(
      title:
          zOnBoardingTitle3
              .tr,
      body:  zOnBoardingSubTitle3.tr,
      image: ZImageAssets.onBoardingImageTwo),
];


