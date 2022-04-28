import 'package:flutter/material.dart';

class KText extends StatelessWidget {
  final String text;
  final EnumText? enumText;
  final double? fontSize;
  final Color? color;
  final TextAlign? textAlign;

  const KText(this.text,
      {Key? key,
        this.enumText,
        this.fontSize,
        this.textAlign,
        this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: Theme
          .of(context)
          .textTheme
          .bodyText1!
          .copyWith(
          color: color,
          fontSize: fontSize,
          fontWeight: enumText == EnumText.light
              ? FontWeight.w300
              : enumText == EnumText.regular
              ? FontWeight.w400
              : enumText == EnumText.semiBold
              ? FontWeight.w600
              : enumText == EnumText.bold
              ? FontWeight.w700
              : FontWeight.w400),
    );
  }
}


enum EnumText {
  light,
  regular,
  medium,
  semiBold,
  bold
}

// {
// FontWeight.w100: 'Thin',
// FontWeight.w200: 'ExtraLight',
// FontWeight.w300: 'Light',
// FontWeight.w400: 'Regular',
// FontWeight.w500: 'Medium',
// FontWeight.w600: 'SemiBold',
// FontWeight.w700: 'Bold',
// FontWeight.w800: 'ExtraBold',
// FontWeight.w900: 'Black',
// }