import 'package:academy_lms/Components/custombutton.dart';
import 'package:academy_lms/Components/line_container.dart';
import 'package:academy_lms/Locale/locales.dart';
import 'package:academy_lms/Theme/colors.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  int? sortGroupValue = 1;
  int? priceGroupValue = 2;
  int? levelsGroupValue = 3;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    return Drawer(
      child: FadedSlideAnimation(
        ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: textFieldColor,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 50, bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      locale.filters!,
                      style: theme.textTheme.subtitle2!.copyWith(
                          fontSize: 18.3,
                          color: Color(0xffA2A3A3),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      locale.reset!,
                      style: theme.textTheme.subtitle1!.copyWith(
                          color: theme.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Text(
                locale.sortBy!,
                style: theme.textTheme.subtitle1!
                    .copyWith(color: textColor, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                locale.ratings!,
                style: theme.textTheme.subtitle1!
                    .copyWith(color: textColor, fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: theme.primaryColor,
                value: 1,
                groupValue: sortGroupValue,
                onChanged: (dynamic value) {
                  setState(() {
                    sortGroupValue = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                locale.price!,
                style: theme.textTheme.subtitle1!
                    .copyWith(color: textColor, fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: theme.primaryColor,
                value: 2,
                groupValue: sortGroupValue,
                onChanged: (dynamic value) {
                  setState(() {
                    sortGroupValue = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                locale.recent!,
                style: theme.textTheme.subtitle1!
                    .copyWith(color: textColor, fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: theme.primaryColor,
                value: 3,
                groupValue: sortGroupValue,
                onChanged: (dynamic value) {
                  setState(() {
                    sortGroupValue = value;
                  });
                },
              ),
            ),
            LineContainer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Text(
                locale.price!,
                style: theme.textTheme.subtitle1!
                    .copyWith(color: textColor, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                locale.paid!,
                style: theme.textTheme.subtitle1!
                    .copyWith(color: textColor, fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: theme.primaryColor,
                value: 1,
                groupValue: priceGroupValue,
                onChanged: (dynamic value) {
                  setState(() {
                    priceGroupValue = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                locale.free!,
                style: theme.textTheme.subtitle1!
                    .copyWith(color: textColor, fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: theme.primaryColor,
                value: 2,
                groupValue: priceGroupValue,
                onChanged: (dynamic value) {
                  setState(() {
                    priceGroupValue = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                locale.both!,
                style: theme.textTheme.subtitle1!
                    .copyWith(color: textColor, fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: theme.primaryColor,
                value: 3,
                groupValue: priceGroupValue,
                onChanged: (dynamic value) {
                  setState(() {
                    priceGroupValue = value;
                  });
                },
              ),
            ),
            LineContainer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Text(
                locale.levels!,
                style: theme.textTheme.subtitle1!
                    .copyWith(color: textColor, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Text(
                locale.begginer!,
                style: theme.textTheme.subtitle1!
                    .copyWith(color: textColor, fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: theme.primaryColor,
                value: 1,
                groupValue: levelsGroupValue,
                onChanged: (dynamic value) {
                  setState(() {
                    levelsGroupValue = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                locale.intermediate!,
                style: theme.textTheme.subtitle1!
                    .copyWith(color: textColor, fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: theme.primaryColor,
                value: 2,
                groupValue: levelsGroupValue,
                onChanged: (dynamic value) {
                  setState(() {
                    levelsGroupValue = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                locale.advanced!,
                style: theme.textTheme.subtitle1!
                    .copyWith(color: textColor, fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: theme.primaryColor,
                value: 3,
                groupValue: levelsGroupValue,
                onChanged: (dynamic value) {
                  setState(() {
                    levelsGroupValue = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              borderRadius: BorderRadius.zero,
              margin: EdgeInsets.zero,
              text: locale.applyFilters,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
