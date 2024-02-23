import 'package:fleasy/fleasy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game/components/label/label_widget.dart';
import 'package:flutter_game/gen/colors.gen.dart';
import 'package:flutter_game/utils/formatters/upper_case_text_formatter.dart';

class CustomTextField extends StatelessWidget {
  final Color textColor;
  final Color? borderColor;
  final Color? errorBorderColor;
  final double fontSize;
  final double? height;
  final FontWeight fontWeight;
  final String initialValue;
  final String? hintText;
  final String? labelText;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final FormFieldValidator<String>? validator;
  final TextInputType textInputType;
  final int numberOfLine;
  final int? maxLength;
  final bool obscureText;
  final bool filled;
  final bool disabled;
  final bool alignLabelWithHint;
  final List<TextInputFormatter>? formatters;
  final EdgeInsets? contentPadding;
  final EdgeInsets? padding;
  final TextAlign? textAlign;
  final double? width;
  final double borderRadius;
  final double? labelFontSize;
  final bool isCapital;
  final VoidCallback? onTap;
  final bool isColor;
  final Color? backgroundColor;
  final FontWeight? labelFontWeight;

  CustomTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.onChanged,
    this.maxLength,
    this.onSaved,
    this.validator,
    this.height,
    this.labelFontSize,
    this.labelFontWeight,
    this.formatters,
    this.contentPadding,
    this.textAlign,
    this.disabled = false,
    this.alignLabelWithHint = false,
    this.filled = false,
    this.obscureText = false,
    this.numberOfLine = 1,
    this.textInputType = TextInputType.text,
    this.initialValue = '',
    this.textColor = ColorName.textLightColor,
    this.borderColor,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 14,
    this.width,
    this.padding,
    this.borderRadius = 4,
    this.onTap,
    this.isCapital = false,
    this.errorBorderColor,
    this.isColor = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    controller ??= TextEditingController(text: initialValue);
    return Container(
      width: width ?? double.infinity,
      padding: padding ?? const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (labelText != null || labelText?.isNotEmpty == true)
            LabelWidget(
              labelText ?? '',
              fontSize: labelFontSize ?? 12,
              fontWeight: labelFontWeight,
              color: isColor ? textColor : Colors.black,
            ),
          if (labelText != null || labelText?.isNotEmpty == true)
            const Gap.h4(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: disabled
                  ? backgroundColor?.withOpacity(0.7) ?? const Color(0xFFF2F4F7)
                  : backgroundColor,
            ),
            child: GestureDetector(
              onTap: null,
              child: TextFormField(
                cursorColor: Colors.grey,
                onTap: onTap,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? ColorName.dividerColor,
                    ),
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  enabled: !disabled,
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? ColorName.dividerColor,
                    ),
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: errorBorderColor ?? Colors.red,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: errorBorderColor ?? Colors.red,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: borderColor ?? ColorName.dividerColor,
                    ),
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  hintStyle: TextStyle(
                    fontSize: fontSize,
                    color: textColor.withOpacity(0.6),
                  ),
                  hintText: hintText,
                  contentPadding: contentPadding ??
                      const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                  suffix: suffix,
                  prefix: prefix,
                  suffixIcon: suffixIcon,
                  prefixIcon: prefixIcon,
                  filled: filled,
                  alignLabelWithHint: alignLabelWithHint,
                  isDense: true,
                  counterText: '',
                ),
                inputFormatters: [
                  ...formatters ?? [],
                  if (isCapital) UpperCaseTextFormatter(),
                ],
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: textColor,
                  height: height,
                ),
                keyboardType: textInputType,
                validator: validator,
                onChanged: onChanged,
                onSaved: onSaved,
                maxLines: numberOfLine,
                maxLength: maxLength,
                obscureText: obscureText,
                textAlign: textAlign ?? TextAlign.start,
                controller:
                    controller ?? TextEditingController(text: initialValue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
