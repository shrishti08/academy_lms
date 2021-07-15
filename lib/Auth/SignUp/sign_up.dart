import 'package:academy_lms/Components/custombutton.dart';
import 'package:academy_lms/Components/textfieldforauthscreens.dart';
import 'package:academy_lms/Locale/locales.dart';
import 'package:academy_lms/Routes/routes.dart';
import 'package:academy_lms/Theme/colors.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

class SignUpUI extends StatefulWidget {
  @override
  _SignUpUIState createState() => _SignUpUIState();
}

class _SignUpUIState extends State<SignUpUI> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: FadedSlideAnimation(
        Column(
          children: [
            Spacer(),
            Image.asset(
              'Assets/sample_logo.png',
              scale: 2.5,
            ),
            Spacer(),
            Text(
              locale.signUpWithEmail!,
              style: theme.textTheme.subtitle1!.copyWith(
                  color: theme.hintColor, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldForAuthScreens(
              hintText: locale.fullName,
            ),
            TextFieldForAuthScreens(
              hintText: locale.emailAddress,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFieldForAuthScreens(
                    hintText: locale.createPassword,
                    margin: EdgeInsets.only(left: 32, right: 4, top: 4),
                  ),
                ),
                Expanded(
                  child: TextFieldForAuthScreens(
                    hintText: locale.confirmPassword,
                    margin: EdgeInsets.only(right: 32, left: 4, top: 4),
                  ),
                ),
              ],
            ),
            CustomButton(
              text: locale.signUp,
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.home);
              },
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                  text: locale.alreadyRegistered,
                  style: theme.textTheme.subtitle1!.copyWith(color: textColor),
                  children: [
                    TextSpan(
                        text: ' ' + locale.signInNow!,
                        style: theme.textTheme.subtitle1!
                            .copyWith(color: theme.primaryColor))
                  ]),
            ),
            Spacer(),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
