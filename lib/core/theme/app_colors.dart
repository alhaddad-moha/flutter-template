import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppColors{


  static const appBackGroundColor = Color(0xFFF7FAFD);
  static const buttonSoldColor = Color(0xFFCBD5E1);

  static const buttonLabelColor = Color(0xFFCBD5E1);
  static const boxShadowColor = Color(0xFF646E76);

  static const salte50 = Color(0xFFF8FAFC);
  static const salte100 = Color(0xFFF1F5F9);
  static const salte200 = Color(0xFFE2E8F0);
  static const salte300 = Color(0xFFCBD5E1);
  static const salte400 = Color(0xFF94A3B8);
  static const salte500 = Color(0xFF64748B);
  static const salte600 = Color(0xFF475569);
  static const salte700 = Color(0xFF334155);
  static const salte800 = Color(0xFF1E293B);
  static const salte900 = Color(0xFF0F172A);
  static const salte950 = Color(0xFF020617);


  static const blue100 = Color(0xFFE3EDFE);
  static const blue200 = Color(0xFFB9D3FC);
  static const blue400 = Color(0xFF669EF8);
  static const blue500 = Color(0xFF3B82F6);
  static const blue800 = Color(0xFF052B68);



  static const cyan100 = Color(0xFFD7F8FE);
  static const cyan200 = Color(0xFF9AEDFC);
  static const cyan500 = Color(0xFF06B6D4);
  static const cyan600 = Color(0xFF058FA7);


  static const danger50 = Color(0xFFFDE4E4);
  static const danger200 = Color(0xFFF9BCBC);
  static const danger300 = Color(0xFFF69494);
  static const danger500 = Color(0xFFEF4444);
  static const danger800 = Color(0xFF650909);



  static final buttonGradiant = LinearGradient(
    begin: AlignmentDirectional.centerEnd,
    end: AlignmentDirectional.centerStart,
    stops: [
      .20.w,
      .79.w
    ],
    colors: const [
      Color(0xFF3B82F6),
      Color(0xFF06B6D4),
    ]
  );

}