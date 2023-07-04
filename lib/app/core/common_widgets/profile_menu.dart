import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            // color: isDark
            //     ? Colors.amber.withOpacity(0.1)
            //     : Colors.amber.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100)),
        child: Icon(
          icon,
          color: textColor,
          // color: isDark ? Colors.amber : Colors.amberAccent,
        ),
      ),
      title: Text(
        title,
        style: Get.textTheme.bodyLarge!.copyWith(color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  // color: Colors.amber.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(100)),
              child: const Icon(
                Icons.arrow_forward_ios,
                // color: Colors.grey,
                size: 18.0,
              ),
            )
          : null,
    );
  }
}
