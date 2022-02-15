import 'package:flutter/foundation.dart';

class Src {
  String? original;
  String? portrait;
  String? landscape;

  Src({
    this.original,
    this.portrait,
    this.landscape,
  });

  factory Src.fromJson(Map<String, dynamic> json) {
    return Src(
      original: json['original'] as String,
      portrait: json['portrait'] as String,
      landscape: json['landscape'] as String,
    );
  }
}
