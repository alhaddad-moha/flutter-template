import 'dart:ui';

import 'package:equatable/equatable.dart';



class LanguageModel with EquatableMixin {

  String code;
  String name;

  LanguageModel({
    required this.name,
    required this.code,
  });

  @override
  List<Object?> get props => [name, code];

  factory LanguageModel.defaultLanguage() => LanguageModel(
      code: "ar",
    name: "العربيه"
  );

  factory LanguageModel.empty() => LanguageModel(
      code: "",
    name: ""
  );

  factory LanguageModel.fromMap(Map<dynamic, dynamic> map) => LanguageModel(
      name: map[LanguageModelFields.name],
      code: map[LanguageModelFields.code]
  );

   Map<String, dynamic> toMap() => {
    LanguageModelFields.code : code,
    LanguageModelFields.name : name,
  };

  Locale get locale => Locale(code);


}

extension LanguageModelEx on List<LanguageModel>{

  List<Locale> get appLocales => map((e) => Locale(e.code)).toList();

}

class LanguageModelFields{
  static const code = "code";
  static const name = "name";

}
