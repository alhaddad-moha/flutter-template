
import 'package:template/common/models/language_model.dart';
import 'package:template/core/utils/extensions/extensions.dart';

abstract class AppConstants{

  static const databaseName = "app_database";

  static final List<LanguageModel> listLanguage = [
    LanguageModel(
      name: 'العربية',
      code: 'ar',
      // icon: AppIcons.arabic,
    ),
    LanguageModel(
      name: 'English',
      code: 'en',
      // icon: AppIcons.english,
    ),
  ];

  static final mainTabletPadding = 192.w;

}

abstract class StatusesNames{


  static const String processCompleted = "Process Completed";
  static const String underReview = "Under Review";
  static const String requestCanceled = "Request Canceled";
  static const String underWarranty = "Under Warranty";
  static const String outOfWarranty = "Out Of Warranty";
  static const String sentToTechnician = "Sent To Technician";
  static const String filesUploaded = "Files Uploaded";
}

abstract class ServiceTypesName{


  static const String purchaseProduct = "Purchase a Product";
  static const String emergencyMaintenance = "Emergency Maintenance";
  static const String periodicMaintenance = "Periodic Maintenance";
}