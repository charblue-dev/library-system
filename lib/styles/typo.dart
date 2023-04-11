import 'package:flutter/material.dart';

enum TypoType {
  headerLight,
  headerMedium,
  headerBold,
  subLight,
  subMedium,
  subBold,
  bodyLight,
  bodyMedium,
  bodyBold,
}

extension TypoExtension on TypoType {
  static const _headerSize = 40.0;
  static const _subSize = 28.0;
  static const _bodySize = 20.0;

  static const _bold = FontWeight.w700;
  static const _medium = FontWeight.w400;
  static const _light = FontWeight.w300;

  static const _fontFamily = 'esamanru';

  static const _color = Colors.black;

  TextStyle getStyle({Color? color}) {
    switch (this) {
      case TypoType.headerLight:
        return TextStyle(
          color: color ?? _color,
          fontFamily: _fontFamily,
          fontSize: _headerSize,
          fontWeight: _light,
        );
      case TypoType.headerMedium:
        return TextStyle(
          color: color ?? _color,
          fontFamily: _fontFamily,
          fontSize: _headerSize,
          fontWeight: _medium,
        );
      case TypoType.headerBold:
        return TextStyle(
          color: color ?? _color,
          fontFamily: _fontFamily,
          fontSize: _headerSize,
          fontWeight: _bold,
        );
      case TypoType.subLight:
        return TextStyle(
          color: color ?? _color,
          fontFamily: _fontFamily,
          fontSize: _subSize,
          fontWeight: _light,
        );
      case TypoType.subMedium:
        return TextStyle(
          color: color ?? _color,
          fontFamily: _fontFamily,
          fontSize: _subSize,
          fontWeight: _medium,
        );
      case TypoType.subBold:
        return TextStyle(
          color: color ?? _color,
          fontFamily: _fontFamily,
          fontSize: _subSize,
          fontWeight: _bold,
        );
      case TypoType.bodyLight:
        return TextStyle(
          color: color ?? _color,
          fontFamily: _fontFamily,
          fontSize: _bodySize,
          fontWeight: _light,
        );
      case TypoType.bodyMedium:
        return TextStyle(
          color: color ?? _color,
          fontFamily: _fontFamily,
          fontSize: _bodySize,
          fontWeight: _medium,
        );
      case TypoType.bodyBold:
        return TextStyle(
          color: color ?? _color,
          fontFamily: _fontFamily,
          fontSize: _bodySize,
          fontWeight: _bold,
        );
    }
  }
}
