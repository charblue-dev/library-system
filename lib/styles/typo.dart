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
  static const _headerSize = 28.0;
  static const _subSize = 24.0;
  static const _bodySize = 20.0;

  static const _bold = FontWeight.w500;
  static const _medium = FontWeight.w400;
  static const _light = FontWeight.w300;

  static const _fontFamily = 'esamanru';
  static const _color = Colors.black;
  static const _lineHeight = 1.5;

  TextStyle getStyle({Color? color}) {
    switch (this) {
      case TypoType.headerLight:
        return TextStyle(
          color: color ?? _color,
          fontFamily: _fontFamily,
          fontSize: _headerSize,
          fontWeight: _light,
          height: _lineHeight,
        );
      case TypoType.headerMedium:
        return TextStyle(
          color: color ?? _color,
          fontFamily: _fontFamily,
          fontSize: _headerSize,
          fontWeight: _medium,
          height: _lineHeight,
        );
      case TypoType.headerBold:
        return TextStyle(
          color: color ?? _color,
          fontFamily: _fontFamily,
          fontSize: _headerSize,
          fontWeight: _bold,
          height: _lineHeight,
        );
      case TypoType.subLight:
        return TextStyle(
          color: color ?? _color,
          fontFamily: _fontFamily,
          fontSize: _subSize,
          fontWeight: _light,
          height: _lineHeight,
        );
      case TypoType.subMedium:
        return TextStyle(
          color: color ?? _color,
          fontFamily: _fontFamily,
          fontSize: _subSize,
          fontWeight: _medium,
          height: _lineHeight,
        );
      case TypoType.subBold:
        return TextStyle(
          color: color ?? _color,
          fontFamily: _fontFamily,
          fontSize: _subSize,
          fontWeight: _bold,
          height: _lineHeight,
        );
      case TypoType.bodyLight:
        return TextStyle(
          color: color ?? _color,
          fontFamily: _fontFamily,
          fontSize: _bodySize,
          fontWeight: _light,
          height: _lineHeight,
        );
      case TypoType.bodyMedium:
        return TextStyle(
          color: color ?? _color,
          fontFamily: _fontFamily,
          fontSize: _bodySize,
          fontWeight: _medium,
          height: _lineHeight,
        );
      case TypoType.bodyBold:
        return TextStyle(
          color: color ?? _color,
          fontFamily: _fontFamily,
          fontSize: _bodySize,
          fontWeight: _bold,
          height: _lineHeight,
        );
    }
  }
}
