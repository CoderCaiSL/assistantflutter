import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);
  static const Color orange = Color(0xFFFAAB1A);
  static const Color background = Color(0xFFFFFFFF);
  static const Color red = Colors.red;

  static const Color text_red = Color(0xFFFD2A6F);
  static const Color dark_text_red = Color(0xFFFD2A6F);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);

  static const Color nearlyDarkBlue = Color(0xFF2633C5);
  static const Color homeBottomTextSel = Color(0xff13227a);



  static const Color nearlyBlue = Color(0xFF5A82E6);
  static const String fontName = 'WorkSans';
  static const String appTitle = '大白菜';

  //两种色系
  static const Color appbar_color = Color(0xFFFFFFFF);
  static const Color dark_appbar_color = Color(0xFF191A1E);

  static const Color bg_color = Color(0xFFF9F9F9);
  static const Color dark_bg_color = Color(0xFF111111);

  static const Color cell_color = Color(0xFFFFFFFF);
  static const Color dark_cell_color = Color(0xFF191A1E);


  static const Color input_bg_color = Color(0xFFFAFAFA);
  static const Color dark_input_bg_color = Color(0xFF333333);


  static const Color bg_red = Color(0xFFFD2A6F);
  static const Color dark_bg_red = Color(0xFFFD2A6F);

  static const Color bg_light_red = Color(0xFFFFE8EC);
  static const Color dark_bg_light_red = Color(0xFFFFE8EC);

  static const Color bg_slider = Color(0xFFF1F1F1);
  static const Color dark_bg_slider = Color(0xFFF1F1F1);

  static const Color bg_btn_border = Color(0xFFEEEEEE);
  static const Color dark_bg_btn_border = Color(0xFFB8B8B8);

  static const Color bg_gray_ = Color(0xFFFAFAFA);
  static const Color dark_bg_gray_ = Color(0xFF242526);

  static const Color bg_white = Colors.white;
  static const Color dark_bg_white = Color(0xFF35363B);

  static const Color bg_black = Color(0xFF333333);
  static const Color dark_bg_black = Color(0xFF333333);

  static const Color text_gray_c = Color(0xFFcccccc);
  static const Color dark_button_text = Color(0xFFF2F2F2);

  static const Color text_gray = Color(0xFF666666);
  static const Color dark_text_gray = Colors.white70;

  static const Color bg_gray = Color(0xFFF9F9F9);
  static const Color dark_bg_gray = Colors.black12;

  static const Color line = Color(0xFFF9F9F9);
  static const Color dark_line = Color(0xFF111111);

  static const Color text_title = Color(0xFF333333);
  static const Color dark_text_title = Colors.white;

  static const Color text_light_gray = Color(0xFFAAAAAA);
  static const Color dark_text_light_gray = Colors.white54;

  static const Color textWhite = Color(0xFFFFFFFF);

  static const Color jin10Bg = Color(0xffF6F7F8);
  static const Color jin10riBg = Color(0xffF7FBFF);




  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
    caption: caption,
  );

  static const TextStyle display1 = TextStyle( // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkerText,
  );

  static const TextStyle headline = TextStyle( // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextSetSell = TextStyle(
    fontFamily: fontName,
    fontSize: 14,
    color: deactivatedText,
  );

  static const TextSetSellContent = TextStyle(
    fontFamily: fontName,
    fontSize: 16,
    color: darkText,
  );

  static const TextAppBarTitle = TextStyle(
    color: AppTheme.text_title,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle TextAppBarRight = TextStyle( // body2 -> body1
    fontFamily: fontName,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextButtonLight = TextStyle(
    fontFamily: fontName,
    color: AppTheme.white,
    fontSize: 16.0,
  );

  static const TextStyle title = TextStyle( // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize:  16,
    letterSpacing: 0.18,
    color: darkerText,
  );


  static const TextStyle searchTitle = TextStyle( // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 14,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle title12 = TextStyle( // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 12,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle searchContent = TextStyle( // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 12,
    letterSpacing: 0.18,
    color: text_gray,
  );

  static const TextStyle subtitle = TextStyle( // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle( // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle bodyTitle = TextStyle( // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle( // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle homeBottom = TextStyle( // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle homeBottomSel = TextStyle( // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.05,
    color: homeBottomTextSel,
  );

  static const TextStyle caption = TextStyle( // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );

  static const TextStyle jin10Search = TextStyle( // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );

  static const TextStyle jin10ListTitle = TextStyle( // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    letterSpacing: 0.2,
    color: darkerText, // was lightText
  );




  static const ButtonStyle buttonStyle = ButtonStyle(
    //shape: MaterialStateProperty.all(OutlinedBorder(side: BorderSide(color: Colors.red))),
  );

}


class IconFonts {
  IconFonts._();

  /// iconfont:flutter base
  static const String fontFamily = 'iconfont';

  static const IconData pageEmpty = IconData(0xe63c, fontFamily: fontFamily);
  static const IconData pageError = IconData(0xe600, fontFamily: fontFamily);
  static const IconData pageNetworkError = IconData(0xe678, fontFamily: fontFamily);
  static const IconData pageUnAuth = IconData(0xe65f, fontFamily: fontFamily);
}