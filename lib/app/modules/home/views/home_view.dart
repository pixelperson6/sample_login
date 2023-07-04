import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sample_login/app/core/values/text_strings.dart';

import '../../../core/common_widgets/profile_menu.dart';
import '../../../core/values/image_strings.dart';
import '../../../data/repository/auth_rep/auth_rep.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [        
              const SizedBox(
                height: 50,
              ),
    
              const SizedBox(
                height: 110,
                width: 110,
                child: CircleAvatar(
                  foregroundImage: AssetImage(ZImageAssets.profile),
                ),
              ),
    
              const SizedBox(
                height: 10,
              ),
              const Text(zProfileHeading),
              const Text(zProfileSubHeading),
              const SizedBox(height: 10),
                ProfileMenuWidget(
                  title: zChangePassword,
                  icon: Icons.abc,
                  onPress: () {
                    Get.toNamed(Routes.CHANGE_PASSWORD,arguments:[true , ''] );
                  },
                ),
    
              const Divider(),


              ProfileMenuWidget(
                title: zAbout,
                icon: Icons.info,
                onPress: () {
                  Get.toNamed(Routes.ABOUT);
                },
              ),
    
              ProfileMenuWidget(
                title: zLogout,
                endIcon: false,
                icon: Icons.logout,
                textColor: Colors.red,
                onPress: () => AuthRepository.instance.logout(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}