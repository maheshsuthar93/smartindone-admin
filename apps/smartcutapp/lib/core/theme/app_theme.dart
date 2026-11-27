// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ny_times_app/src/core/theme/app_text_style.dart';
//
// // import 'package:google_fonts/google_fonts.dart';
//
// import 'app_colors.dart';
// import 'app_text_style.dart';
//
// /// Light theme
// final ThemeData appTheme = ThemeData(
//   dialogBackgroundColor: AppColors.lightGray,
//   cardColor: AppColors.primaryColor,
//   appBarTheme: AppBarTheme(
//     // shadowColor: AppColors.lightGray,
//     color: AppColors.white,
//     elevation: 2,
//     toolbarTextStyle: const TextTheme(
//       titleLarge: AppTextStyle.xxxLargeBlack,
//     ).bodyLarge,
//     titleTextStyle: const TextTheme(
//       titleLarge: AppTextStyle.xxxLargeBlack,
//     ).titleLarge,
//     systemOverlayStyle: SystemUiOverlayStyle.light,
//   ),
//   fontFamily: "Montserrat",
//   scaffoldBackgroundColor: AppColors.white,
//   iconTheme: const IconThemeData(color: AppColors.black, size: 25),
//   textTheme: const TextTheme(
//     headlineLarge: AppTextStyle.xxxLargeBlack,
//     headlineMedium: AppTextStyle.xLargeBlack,
//     titleMedium: AppTextStyle.xSmallBlack,
//     titleSmall: AppTextStyle.smallBlack,
//     bodyLarge: AppTextStyle.largeBlack,
//     bodyMedium: AppTextStyle.mediumBlack,
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: AppColors.primaryColor,
//       padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 12.h),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.sp),
//       ),
//     ),
//   ),
//   colorScheme:
//   ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColor),
//   inputDecorationTheme: InputDecorationTheme(
//       fillColor: AppColors.transparent,
//       contentPadding: EdgeInsets.symmetric(
//         horizontal: 10.sp,
//       ),
//       suffixIconColor: AppColors.black,
//       border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.sp),
//           borderSide: const BorderSide(color: AppColors.white, width: 1)),
//       enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.sp),
//           borderSide: const BorderSide(color: AppColors.white, width: 1)),
//       focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.sp),
//           borderSide: const BorderSide(color: AppColors.white, width: 1)),
//       errorMaxLines: 2),
// );
//
// /// Dark theme
// final ThemeData darkAppTheme = ThemeData(
//   dialogBackgroundColor: AppColors.primaryColor,
//   cardColor: AppColors.orange.withOpacity(0.5),
//   appBarTheme: AppBarTheme(
//     shadowColor: AppColors.white,
//     color: AppColors.darkGray,
//     elevation: 0,
//     toolbarTextStyle: const TextTheme(
//       titleLarge: AppTextStyle.xxxLargeWhite,
//     ).bodyLarge,
//     titleTextStyle: const TextTheme(
//       titleLarge: AppTextStyle.xxxLargeWhite,
//     ).titleLarge,
//     systemOverlayStyle: SystemUiOverlayStyle.light,
//   ),
//   fontFamily: "Montserrat",
//   scaffoldBackgroundColor: AppColors.primaryColor,
//   iconTheme: const IconThemeData(color: AppColors.white, size: 25),
//   textTheme: const TextTheme(
//     headlineLarge: AppTextStyle.xxxLargeWhite,
//     headlineMedium: AppTextStyle.xLargeWhite,
//     titleMedium: AppTextStyle.xSmallWhite,
//     titleSmall: AppTextStyle.smallWhite,
//     bodyLarge: AppTextStyle.largeWhite,
//     bodyMedium: AppTextStyle.mediumWhite,
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: AppColors.primaryColor,
//       padding: EdgeInsets.symmetric(
//         horizontal: 50.w,
//         vertical: 12.h,
//       ),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//     ),
//   ),
//   colorScheme:
//   ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColor),
//   inputDecorationTheme: InputDecorationTheme(
//     contentPadding: EdgeInsets.symmetric(
//       horizontal: 10.w,
//     ),
//     filled: true,
//     suffixIconColor: AppColors.white,
//     fillColor: AppColors.transparent,
//     border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10.sp),
//         borderSide: const BorderSide(color: AppColors.lightGray, width: 1)),
//     enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10.sp),
//         borderSide: const BorderSide(color: AppColors.lightGray, width: 1)),
//     focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10.sp),
//         borderSide: const BorderSide(color: AppColors.lightGray, width: 1)),
//     errorMaxLines: 2,
//   ),
// );

import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_size.dart';
import 'app_text_style.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor).copyWith(
    primary: AppColors.primaryColor,
    secondary: AppColors.secondaryColor,
    surface: AppColors.surfaceColor,
  ),
  scaffoldBackgroundColor: AppColors.backgroundColor,
  fontFamily: AppTextStyle.fontFamily,
  dialogTheme: DialogThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.borderRadius),
    ),
  ),
  popupMenuTheme: PopupMenuThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.borderRadius),
    ),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppSize.borderRadius),
      ),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryColor,
    foregroundColor: AppColors.white,
    focusColor: AppColors.primaryColor,
    hoverColor: AppColors.primaryColor,
    elevation: 4,
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: AppColors.primaryColor,
    contentTextStyle: const TextStyle(color: Colors.white),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.borderRadius),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,

    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.borderRadius),
      borderSide: const BorderSide(color: Color(0xFFD8E2EE), width: 1.2),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.borderRadius),
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.8),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.borderRadius),
      borderSide: const BorderSide(color: Color(0xFFDC2626)),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.borderRadius),
      borderSide: const BorderSide(color: Color(0xFFDC2626), width: 1.8),
    ),
  ),
);
