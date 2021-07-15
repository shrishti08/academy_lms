import 'package:academy_lms/Theme/colors.dart';
import 'package:flutter/material.dart';

class TextFieldForKdemy extends StatelessWidget {
  final String? hintText;
  final String? suffixText;
  final EdgeInsets? margin;
  final IconData? prefixIcon;
  final Color? color;
  final Function? onTap;
  final bool? readOnly;

  TextFieldForKdemy(
      {this.hintText,
      this.suffixText,
      this.margin,
      this.prefixIcon,
      this.color,
      this.onTap,
      this.readOnly});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 32, vertical: 4),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: color ?? textFieldColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        readOnly: readOnly ?? false,
        onTap: onTap as void Function()?,
        style: theme.textTheme.subtitle2!.copyWith(
          color: Colors.black,
        ),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: theme.textTheme.subtitle2,
            enabledBorder: InputBorder.none,
            suffix: Text(suffixText ?? ' '),
            prefixIcon: prefixIcon == null
                ? SizedBox.shrink()
                : Icon(prefixIcon, color: theme.primaryColor),
            suffixStyle: theme.textTheme.subtitle2!.copyWith(
              color: theme.primaryColor,
            ),
            focusColor: Colors.black),
      ),
    );
  }
}
