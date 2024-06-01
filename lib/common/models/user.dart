import 'package:template/core/providers/localization_provider.dart';
import 'package:template/service_locator.dart';
import 'package:equatable/equatable.dart';

class UserModel with EquatableMixin{

  int id;
  String name;
  String positionAr;
  String positionEn;
  String token;
  String refreshToken;

  UserModel({
    required this.id,
    required this.name,
    required this.positionAr,
    required this.positionEn,
    required this.token,
    required this.refreshToken,
});


  String get position{
    if(locator<LocalizationProvider>().currentLanguageIsEnglish){
      return positionEn;
    }
    return positionAr;
  }


  bool get isSpecialist => positionEn.toLowerCase() == UserType.technician;

  Map<String, dynamic> toMap() => {
    UserModelFields.id: id,
    UserModelFields.name: name,
    UserModelFields.positionAr: positionAr,
    UserModelFields.positionEn: positionEn,
    UserModelFields.token: token,
    UserModelFields.refreshToken: refreshToken,
  };


  static empty() => UserModel(
    id: 0,
    name: '',
    positionAr: '',
    positionEn: '',
    token: '',
    refreshToken: '',
  );
  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
    id: map[UserModelFields.id],
    name: map[UserModelFields.name],
    positionAr: map[UserModelFields.positionAr],
    positionEn: map[UserModelFields.positionEn],
    token: map[UserModelFields.token],
    refreshToken: map[UserModelFields.refreshToken],
  );

  @override
  List<Object?> get props => [id, name, positionEn];
}

abstract class  UserModelFields{
  static const String userBox = 'userBox';
  static const String id = 'id';
  static const String name = 'name';
  static const String positionAr = 'positionAr';
  static const String positionEn = 'positionEn';
  static const String token = 'token';
  static const String refreshToken = 'refreshToken';
}

abstract class UserType{
  static const String customer = 'customer';
  static const String technician = 'technician';

}