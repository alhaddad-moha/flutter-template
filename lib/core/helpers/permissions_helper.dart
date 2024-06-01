import 'package:template/common/assets_path/icons_paths.dart';
import 'package:template/common/dialogs/custom_dialog_with_actions.dart';
import 'package:template/core/theme/app_colors.dart';
import 'package:template/core/theme/app_font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';


abstract class PermissionsHelper {


  // static Future<bool> checkCameraPermission() async {
  //   PermissionStatus status = await Permission.camera.status;
  //   print("status is ${status}");
  //   if (status.isDenied) {
  //     // Permission has not been granted. Request it.
  //     return await requestCameraPermission();
  //   } else if (status.isGranted) {
  //     // Permission already granted. Proceed with accessing the camera.
  //     return true;
  //   }
  //   return false;
  // }

  static Future<bool> requestCameraPermission(BuildContext context) async {
    PermissionStatus status = await Permission.camera.request();
    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      // Permission permanently denied. Open app settings.
      // final result = await CustomDialogWithActions.show(context: context,
      //     height: 220.h,
      //     title: "الكاميرا",
      //     icon: IconsPaths.category,
      //     fillColor: AppColors.cyan200,
      //     child: Material(
      //
      //         child: Text("فتح الإعدادت لمنح صلاحية الوصول الى الكاميرا", style: AppFontStyle.regular20,)),
      // );
      // if(result == null || result == false){
      //   return false;
      // }else{
      //   return await openAppSettings();
      // }
    } else if (status.isDenied) {
      return false;
    }

    return false;
  }


}