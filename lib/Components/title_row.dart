import 'package:academy_lms/Locale/locales.dart';
import 'package:flutter/material.dart';

import '../Theme/colors.dart';

class TitleRow extends StatelessWidget {
  final String? title;
  final EdgeInsetsGeometry? padding;
  final Function? onTap;

  TitleRow(this.title, {this.padding, this.onTap});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
      contentPadding: padding ?? EdgeInsets.zero,
      title: Text(
        title!,
        style: theme.textTheme.subtitle1!.copyWith(color: textColor),
      ),
      trailing: MaterialButton(
        child: Text(
          AppLocalizations.of(context)!.viewAll!,
          style: theme.textTheme.headline6!
              .copyWith(color: theme.primaryColor, fontSize: 16),
        ),
        onPressed: onTap as void Function()?,
      ),
    );
  }
}
