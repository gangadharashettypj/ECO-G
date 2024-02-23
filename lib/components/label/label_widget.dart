import 'package:flutter/material.dart';
import 'package:flutter_game/gen/colors.gen.dart';

enum LabelType {
  title,
  normal,
  subTitle,
}

class LabelWidget extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight? fontWeight;
  final int? maxLine;
  final TextOverflow overflow;
  final bool vertical;
  final double runSpacing;
  final double? fontSize;
  final double? height;
  final EdgeInsets? padding;
  final TextAlign? textAlign;
  final LabelType labelType;
  final EdgeInsets? margin;
  final Color backgroundColor;
  final TextDecoration? decoration;
  final TextDecorationStyle? decorationStyle;

  const LabelWidget(
    this.text, {
    super.key,
    this.color = ColorName.textColor,
    this.fontSize,
    this.height,
    this.padding,
    this.maxLine,
    this.textAlign,
    this.fontWeight,
    this.overflow = TextOverflow.ellipsis,
    this.vertical = false,
    this.runSpacing = 10,
    this.labelType = LabelType.normal,
    this.margin,
    this.backgroundColor = Colors.white,
    this.decoration,
    this.decorationStyle,
  });

  @override
  Widget build(BuildContext context) {
    if (vertical) {
      return Container(
        padding: padding,
        margin: margin,
        child: Wrap(
          runSpacing: runSpacing,
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: text
              .split("")
              .map(
                (string) => Text(
                  string,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: color,
                    fontWeight: fontWeight,
                    decoration: decoration,
                    decorationStyle: decorationStyle,
                  ),
                  textAlign: textAlign,
                  maxLines: maxLine,
                  overflow: overflow,
                ),
              )
              .toList(),
        ),
      );
    }
    return Container(
      padding: padding,
      margin: margin,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? _getFontSize(),
          color: color,
          fontWeight: fontWeight ?? _getFontWeight(),
          height: height,
          decoration: decoration,
          decorationStyle: decorationStyle,
        ),
        textAlign: textAlign,
        maxLines: maxLine,
        overflow: overflow,
      ),
    );
  }

  double? _getFontSize() {
    switch (labelType) {
      case LabelType.title:
        return 28.0;
      case LabelType.normal:
        return 15;
      case LabelType.subTitle:
        return 10;
    }
  }

  FontWeight? _getFontWeight() {
    switch (labelType) {
      case LabelType.title:
        return FontWeight.w700;
      case LabelType.normal:
        return FontWeight.normal;
      case LabelType.subTitle:
        return FontWeight.w300;
      default:
        return FontWeight.normal;
    }
  }
}
