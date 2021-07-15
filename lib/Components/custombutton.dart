import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? width;
  final Function? onTap;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;

  CustomButton(
      {this.text,
      this.color,
      this.onTap,
      this.width,
      this.margin,
      this.borderRadius});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        width: width ?? double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        margin: margin ?? EdgeInsets.all(32),
        decoration: BoxDecoration(
            color: color ?? theme.primaryColor,
            borderRadius: borderRadius ?? BorderRadius.circular(12)),
        child: Text(
          text!,
          style: theme.textTheme.subtitle1,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
