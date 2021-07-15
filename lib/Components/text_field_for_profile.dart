import 'package:academy_lms/Theme/colors.dart';
import 'package:flutter/material.dart';

class EntryField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? initialValue;
  final bool? isCollapsed;
  final InputBorder? border;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function? onTap;
  final Color? imageColor;

  EntryField(
      {this.controller,
      this.label,
      this.initialValue,
      this.border,
      this.suffixIcon,
      this.onTap,
      this.imageColor,
      this.prefixIcon,
      this.isCollapsed});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(top: 4.0, left: 36.0, right: 36.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          prefixIcon ?? Icon(Icons.place),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              cursorColor: theme.primaryColor,
              onTap: onTap as void Function()?,
              autofocus: false,
              controller: controller,
              initialValue: initialValue,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: textColor,
                  ),
              minLines: 1,
              decoration: InputDecoration(
                suffixIcon: suffixIcon,
                labelText: label,
                // prefixIcon: prefixIcon,
                labelStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontSize: 16,
                    ),
                isCollapsed: isCollapsed ?? false,
                alignLabelWithHint: true,
                hintStyle: theme.textTheme.subtitle1!
                    .copyWith(color: theme.hintColor, fontSize: 14),
                border: border,
                enabledBorder:
                    UnderlineInputBorder(borderSide: BorderSide(width: 0.1)),
                counter: Offstage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
