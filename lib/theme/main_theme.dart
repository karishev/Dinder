import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final ThemeData defaultTheme = buildDefaultTheme();
ThemeData buildDefaultTheme() {
  return ThemeData(
      appBarTheme: AppBarTheme(
        color: ColorPalette.background,
      ),
      scaffoldBackgroundColor: ColorPalette.background,
      fontFamily: "SFUiDisplay");
}

class ColorPalette {
  static const mainColor = Color(0xFF2B2E3B);
  static const yellow = Color(0xFFFAC15C);
  static const colorPhone = Color(0xFFFAC15C);
  static const mainBlack = Color(0xFF000000);
  static const dividerColor = Color.fromRGBO(255, 255, 255, 0.2);
  static const textWithOpacityZeroPointFive =
      Color.fromRGBO(255, 255, 255, 0.2);
  static const Color background = Color(0xFF2B2E3B);
  static const Color darkerBackground = Color(0xFF23252f);
  static const Color tabbarBackground = Color(0xFF1A1C23);
  static const Color lightBackground = Color(0xFF3a3d49);
  static const Color starOrange = Color(0xFFF9B233);
  static const Color textBody = Color(0xFFBDBDBD);
  static const Color hintText = Color(0xFF4f5159);
  static const Color tabbarText = Color(0xFFE0E0E0);
  static const Color bodyText2 = Color(0xFF8F8E94);
  static const Color borderColor = Color(0xFF4F4F4F);
  static const Color botyTitleTextStyle = Color(0xFFB3B3B3);
}

class TextStyles {
  static var button14 = TextStyle(
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static var buttonHeader16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    color: Colors.white,
  );
  static var body13Light = TextStyle(
    fontSize: 13,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w300,
    color: Colors.white,
  );
  static var body14Regular = TextStyle(
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static var header18Bold = TextStyle(
    fontSize: 18,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static var header16Bold = TextStyle(
    fontSize: 16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static var header24Light = TextStyle(
    fontSize: 24,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w300,
    color: Colors.white,
  );
  static var header24Bold = TextStyle(
    fontSize: 24,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
  static var textPhoneCard = TextStyle(
    fontSize: 16,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    color: ColorPalette.colorPhone,
  );
}

class FormatsTextTheme {
  var maskFormatter = MaskTextInputFormatter(
      mask: '(###) ###-##-##', filter: {"#": RegExp(r'[0-9]')});

  var phoneRegisterFormatter = MaskTextInputFormatter(
      mask: '+7(###)###-##-##', filter: {"#": RegExp(r'[0-9]')});

  var phoneFormatter = MaskTextInputFormatter(
      mask: '+7-###-###-##-##', filter: {"#": RegExp(r'[0-9]')});
}
