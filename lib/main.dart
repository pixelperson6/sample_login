import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/core/common_widgets/center_loading_bar.dart';
import 'app/core/theme/zapp_theme.dart';
import 'app/data/repository/auth_rep/auth_rep.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await ScreenUtil.ensureScreenSize();
  Get.put(AuthRepository(), permanent: true);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        // splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ZAppTheme.lightTheme,
            darkTheme: ZAppTheme.darkTheme,
            themeMode: ThemeMode.system,
            title: "Application",
            home: const Scaffold(body: CenterLoadingBar()),
            // initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        });
  }
}
