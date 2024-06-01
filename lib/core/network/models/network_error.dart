import 'dart:convert';

import 'package:template/core/providers/localization_provider.dart';
import 'package:template/service_locator.dart';
import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final String messageAr;
  final String messageEn;

  const ErrorModel({required this.messageAr,required  this.messageEn});

  factory ErrorModel.fromMap(Map<String, dynamic> data) => ErrorModel(
    messageAr: data['messageAr'],
    messageEn: data['messageEn'],
  );

  Map<String, dynamic> toMap() => {
    'messageAr': messageAr,
    'messageEn': messageEn,
  };


  factory ErrorModel.fromJson(String data) {
    return ErrorModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }


  String toJson() => json.encode(toMap());

  ErrorModel copyWith({
    String? messageAr,
    String? messageEn,
  }) {
    return ErrorModel(
      messageAr: messageAr ?? this.messageAr,
      messageEn: messageEn ?? this.messageEn,
    );
  }

  String get message{
    if(locator<LocalizationProvider>().currentLanguageIsEnglish){
      return messageEn;
    }
    return messageAr;
  }

  @override
  List<Object?> get props => [messageAr, messageEn];
}
