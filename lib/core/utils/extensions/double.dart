import 'package:template/core/routes/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension DoubleX on double{

  Widget get heightSizedBox {
    return SizedBox(
      height: this,
    );
  }

  Widget get widthSizedBox {
    return SizedBox(
      width: this,
    );
  }

}

extension ScreenUtilEx on num{

  double get w {
    if(ScreenUtil().deviceType(NavigationService.instance.currentContext) == DeviceType.tablet){
      return ScreenUtil().setHeight(this);

    }else{
      return ScreenUtil().setWidth(this);

    }
  }
  double get h {
    if(ScreenUtil().deviceType(NavigationService.instance.currentContext) == DeviceType.tablet){
      return ScreenUtil().setWidth(this);

    }else{
      return ScreenUtil().setHeight(this);

    }
  }

  double get r => ScreenUtil().radius(this);

  double get sp => ScreenUtil().setSp(this);

  SizedBox get verticalSpace => ScreenUtil().setVerticalSpacing(this);

  SizedBox get horizontalSpace => ScreenUtil().setHorizontalSpacing(this);

  double get sw => ScreenUtil().screenWidth * this;

  double get sh => ScreenUtil().screenHeight * this;


}

// extension ScreenUtilEx2 on ScreenUtil{
  bool get isTablet => ScreenUtil().deviceType(NavigationService.instance.currentContext) == DeviceType.tablet;
// }