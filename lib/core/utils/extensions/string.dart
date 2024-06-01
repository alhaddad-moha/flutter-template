import 'dart:convert';
import 'dart:typed_data';

import 'package:path_to_regexp/path_to_regexp.dart';

extension GoRouterExtension on String {
  String replaceParams(Map<String, String> params) {
    final toPath = pathToFunction(this);
    String newPath = toPath(params);
    return newPath;
  }

  Uint8List get toUint8List {
    return base64Decode(this);
  }

  String? toNullIfEmpty() {
    if (trim().isEmpty) {
      return null;
    } else {
      return this;
    }
  }


}
