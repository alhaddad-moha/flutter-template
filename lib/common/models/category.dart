import 'dart:convert';

import 'package:template/core/providers/localization_provider.dart';
import 'package:template/service_locator.dart';
import 'package:equatable/equatable.dart';

class CategoryModel with EquatableMixin {
  final int id;
  final String nameAr;
  final String nameEn;

  const CategoryModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });


  String get name{
    if(locator<LocalizationProvider>().currentLanguageIsEnglish){
      return nameEn;
    }
    return nameAr;
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) => CategoryModel(
    id: map[CategoryModelFields.id],
    nameAr: map[CategoryModelFields.nameAr],
    nameEn: map[CategoryModelFields.nameEn],
  );

  Map<String, dynamic> toMap() => {
    CategoryModelFields.id: id,
    CategoryModelFields.nameAr: nameAr,
    CategoryModelFields.nameEn: nameEn,
  };

  factory CategoryModel.fromJson(String data) {
    return CategoryModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  CategoryModel copyWith({
    int? id,
    String? nameAr,
    String? nameEn,
    String? code,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
    );
  }

  @override
  List<Object?> get props => [id, nameAr, nameEn];

  static empty() {
    return const CategoryModel(id: 0, nameAr: '', nameEn: '',);
  }
}

abstract class CategoryModelFields {
  static const id = 'id';
  static const nameAr = 'nameAr';
  static const nameEn = 'nameEn';
}
