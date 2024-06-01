import 'dart:convert';

import 'package:template/core/providers/localization_provider.dart';
import 'package:template/service_locator.dart';
import 'package:equatable/equatable.dart';

class IdNameModel with EquatableMixin {
  final int id;
  final String nameAr;
  final String nameEn;
  final String? code;

  const IdNameModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    this.code,
  });


  String get name{
    if(locator<LocalizationProvider>().currentLanguageIsEnglish){
      return nameEn;
    }
    return nameAr;
  }
  
  factory IdNameModel.fromMap(Map<String, dynamic> map) => IdNameModel(
        id: map[NameCodeModelFields.id],
        nameAr: map[NameCodeModelFields.nameAr],
        nameEn: map[NameCodeModelFields.nameEn],
        code: map[NameCodeModelFields.code],
      );

  Map<String, dynamic> toMap() => {
        NameCodeModelFields.id: id,
        NameCodeModelFields.nameAr: nameAr,
        NameCodeModelFields.nameEn: nameEn,
        NameCodeModelFields.code: code,
      };

  factory IdNameModel.fromJson(String data) {
    return IdNameModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  IdNameModel copyWith({
    int? id,
    String? nameAr,
    String? nameEn,
    String? code,
  }) {
    return IdNameModel(
      id: id ?? this.id,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      code: code ?? this.code,
    );
  }

  @override
  List<Object?> get props => [id, nameAr, nameEn, code];

  static empty() {
    return const IdNameModel(id: 0, nameAr: '', nameEn: '', code: '');
  }
}

abstract class NameCodeModelFields {
  static const id = 'id';
  static const nameAr = 'nameAR';
  static const nameEn = 'nameEN';
  static const code = 'code';
}
