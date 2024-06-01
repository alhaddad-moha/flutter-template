import 'dart:convert';

import 'package:template/core/providers/localization_provider.dart';
import 'package:template/service_locator.dart';
import 'package:equatable/equatable.dart';

class DescriptionModel with EquatableMixin {
  final String descriptionAr;
  final String descriptionEn;

  const DescriptionModel({
    required this.descriptionAr,
    required this.descriptionEn,
  });


  String get description{
    if(locator<LocalizationProvider>().currentLanguageIsEnglish){
      return descriptionEn;
    }
    return descriptionAr;
  }

  factory DescriptionModel.fromMap(Map<String, dynamic> map) => DescriptionModel(
    descriptionAr: map[DescriptionModelFields.descriptionAr],
    descriptionEn: map[DescriptionModelFields.descriptionEn],
  );

  Map<String, dynamic> toMap() => {
    DescriptionModelFields.descriptionAr: descriptionAr,
    DescriptionModelFields.descriptionEn: descriptionEn,
  };

  factory DescriptionModel.fromJson(String data) {
    return DescriptionModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  DescriptionModel copyWith({
    String? descriptionAr,
    String? descriptionEn,
  }) {
    return DescriptionModel(
      descriptionAr: descriptionAr ?? this.descriptionAr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
    );
  }

  @override
  List<Object?> get props => [ descriptionAr, descriptionEn];

  static empty() {
    return const DescriptionModel(descriptionAr: '', descriptionEn: '',);
  }
}

abstract class DescriptionModelFields {
  static const id = 'id';
  static const descriptionAr = 'descriptionAr';
  static const descriptionEn = 'descriptionEn';
}
