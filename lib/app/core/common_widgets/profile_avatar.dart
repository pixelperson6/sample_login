import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    Key? key,
    required this.avatar,
    required this.onPress,
    required this.iconData,
  }) : super(key: key);

  final String avatar;
  final VoidCallback onPress;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // SizedBox(
        //   width: 110,
        //   height: 110,
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(100),
        //     child: Image(
        //       image: NetworkImage(avatar),
        //       fit: BoxFit.fill,
        //     ),
        //   ),
        // ),

        Container(
          padding: const EdgeInsets.all(1),
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Get.theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(100),
          ),
          child: GestureDetector(
            // onTap: () => Get.toNamed(Routes.PROFILE),
            child: CircleAvatar(
              backgroundColor: Get.theme.colorScheme.primary,
              radius: 20,
              backgroundImage: NetworkImage(avatar),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 35,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Get.theme.primaryColor),
            child: IconButton(
              onPressed: onPress,
              icon: Icon(
                iconData,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
