import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../values/colors.dart';

class ZAppTheme {
  ZAppTheme._();

  static ThemeData baseThemeLight = ThemeData.light();
  static ThemeData baseThemeDark = ThemeData.dark();

  static ShapeBorder get shapeMedium => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      );

  static CardTheme cardTheme() {
    return CardTheme(
      elevation: 0,
      shape: shapeMedium,
      clipBehavior: Clip.antiAlias,
    );
  }

  static ListTileThemeData listTileTheme(ColorScheme colors) {
    return ListTileThemeData(
      shape: shapeMedium,
      selectedColor: colors.secondary,
    );
  }

  static AppBarTheme appBarTheme(ColorScheme colors) {
    return AppBarTheme(
      elevation: 0,
      backgroundColor: colors.surface,
      foregroundColor: colors.onSurface,
    );
  }

  static TabBarTheme tabBarTheme(ColorScheme colors) {
    return TabBarTheme(
      labelColor: colors.secondary,
      unselectedLabelColor: colors.onSurfaceVariant,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colors.secondary,
            width: 2,
          ),
        ),
      ),
    );
  }

  static BottomAppBarTheme bottomAppBarTheme(ColorScheme colors) {
    return BottomAppBarTheme(
      color: colors.surface,
      elevation: 0,
    );
  }

  static BottomNavigationBarThemeData bottomNavigationBarTheme(
      ColorScheme colors) {
    return BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: colors.surfaceVariant,
      selectedItemColor: colors.onSurface,
      unselectedItemColor: colors.onSurfaceVariant,
      elevation: 0,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
    );
  }

  static NavigationRailThemeData navigationRailTheme(ColorScheme colors) {
    return const NavigationRailThemeData();
  }

  static DrawerThemeData drawerTheme(ColorScheme colors) {
    return DrawerThemeData(
      backgroundColor: colors.surface,
    );
  }

  static IconThemeData iconTheme(ColorScheme colors) {
    return baseThemeLight.iconTheme.copyWith(color: colors.onSurface);
  }

  static ThemeData lightTheme = ThemeData.light().copyWith(
    // Add page transitions
    //general

    //color
    colorScheme: lightColorScheme,
    primaryColor: lightColorScheme.primary,

    //typography & icon
    textTheme: lightTextTheme,
    iconTheme: iconTheme(lightColorScheme),

    //components
    appBarTheme: appBarTheme(lightColorScheme),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.maxFinite, 50),
      backgroundColor: lightColorScheme.primary,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
    )),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.maxFinite, 50),
        side: BorderSide(color: lightColorScheme.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          // side: BorderSide(color: lightColorScheme.primary ),
        ),
        elevation: 0,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 24),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: lightColorScheme.outline),
          borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: lightColorScheme.primary),
          borderRadius: BorderRadius.circular(12)),
      hintStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
    ),
    cardTheme: cardTheme(),
    listTileTheme: listTileTheme(lightColorScheme),
    bottomAppBarTheme: bottomAppBarTheme(lightColorScheme),
    bottomNavigationBarTheme: bottomNavigationBarTheme(lightColorScheme),
    navigationRailTheme: navigationRailTheme(lightColorScheme),
    tabBarTheme: tabBarTheme(lightColorScheme),
    drawerTheme: drawerTheme(lightColorScheme),
    scaffoldBackgroundColor: lightColorScheme.background,
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    // Add page transitions
    //general

    //color
    colorScheme: darkColorScheme,
    primaryColor: darkColorScheme.primary,

    //typography & icon
    textTheme: darkTextTheme,
    iconTheme: iconTheme(darkColorScheme),

    //components
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.maxFinite, 50),
      backgroundColor: darkColorScheme.primary,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
    )),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.maxFinite, 50),
        side: BorderSide(color: lightColorScheme.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          // side: BorderSide(color: darkColorScheme.primary),
        ),
        elevation: 0,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: darkColorScheme.outline),
          borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: darkColorScheme.primary),
          borderRadius: BorderRadius.circular(12)),
      hintStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
    ),
    appBarTheme: appBarTheme(darkColorScheme),
    cardTheme: cardTheme(),
    listTileTheme: listTileTheme(darkColorScheme),
    bottomAppBarTheme: bottomAppBarTheme(darkColorScheme),
    bottomNavigationBarTheme: bottomNavigationBarTheme(darkColorScheme),
    navigationRailTheme: navigationRailTheme(darkColorScheme),
    tabBarTheme: tabBarTheme(darkColorScheme),
    drawerTheme: drawerTheme(darkColorScheme),
    scaffoldBackgroundColor: darkColorScheme.background,
    useMaterial3: true,
  );

  static TextTheme baseDark = ThemeData.dark().textTheme;
  static TextTheme baseLight = ThemeData.light().textTheme;

 

  static TextTheme darkTextTheme = ThemeData.dark()
      .textTheme
      .copyWith(
        displayLarge: baseDark.displayLarge!.copyWith(
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: baseDark.displayMedium!
            .copyWith(fontSize: 24.sp, fontWeight: FontWeight.w500),
        displaySmall: baseDark.displaySmall!.copyWith(
          fontSize: 24.sp,
        ),
        headlineLarge: baseDark.headlineLarge!.copyWith(
          fontSize: 23.sp,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: baseDark.headlineMedium!.copyWith(
          fontSize: 22.sp,
        ),
        headlineSmall: baseDark.headlineSmall!.copyWith(
          fontSize: 20.sp,
        ),
        titleLarge: baseDark.titleLarge!.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: baseDark.titleMedium!.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
        titleSmall: baseDark.titleSmall!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        bodyLarge: baseDark.bodyLarge!.copyWith(
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: baseDark.bodyMedium!.copyWith(
          fontSize: 12.sp,
        ),
        bodySmall: baseDark.bodySmall!.copyWith(
          fontSize: 11.sp,
        ),
        labelLarge: baseDark.labelLarge!.copyWith(
          fontSize: 13.sp,
          fontWeight: FontWeight.w700,
        ),
        labelMedium: baseDark.labelMedium!.copyWith(
          fontSize: 12.sp,
        ),
        labelSmall: baseDark.labelSmall!.copyWith(
          fontSize: 10.sp,
        ),
      )
      .apply(
        fontFamily: GoogleFonts.notoSans().fontFamily,
      );

  static TextTheme lightTextTheme = ThemeData.light()
      .textTheme
      .copyWith(
        displayLarge: baseLight.displayLarge!.copyWith(
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: baseLight.displayMedium!
            .copyWith(fontSize: 24.sp, fontWeight: FontWeight.w500),
        displaySmall: baseLight.displaySmall!.copyWith(
          fontSize: 24.sp,
        ),
        headlineLarge: baseLight.headlineLarge!.copyWith(
          fontSize: 23.sp,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: baseLight.headlineMedium!.copyWith(
          fontSize: 22.sp,
        ),
        headlineSmall: baseLight.headlineSmall!.copyWith(
          fontSize: 20.sp,
        ),
        titleLarge: baseLight.titleLarge!.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: baseLight.titleMedium!.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
        titleSmall: baseLight.titleSmall!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
        bodyLarge: baseLight.bodyLarge!.copyWith(
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: baseLight.bodyMedium!.copyWith(
          fontSize: 12.sp,
        ),
        bodySmall: baseLight.bodySmall!.copyWith(
          fontSize: 11.sp,
        ),
        labelLarge: baseLight.labelLarge!.copyWith(
          fontSize: 13.sp,
          fontWeight: FontWeight.w700,
        ),
        labelMedium: baseLight.labelMedium!.copyWith(
          fontSize: 12.sp,
        ),
        labelSmall: baseLight.labelSmall!.copyWith(
          fontSize: 10.sp,
        ),
      )
      .apply(
        fontFamily: GoogleFonts.notoSans().fontFamily,
      );
}
