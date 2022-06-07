import 'package:flutter/material.dart';
import 'font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

// regular text style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontConstant.fontFamily,
    FontWeightManager.regular,
    color,
  );
}

// light text style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontConstant.fontFamily,
    FontWeightManager.light,
    color,
  );
}

// bold text style

TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontConstant.fontFamily,
    FontWeightManager.bold,
    color,
  );
}

// semiBold text style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontConstant.fontFamily,
    FontWeightManager.semiBold,
    color,
  );
}

// medium text style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontConstant.fontFamily,
    FontWeightManager.medim,
    color,
  );
}
