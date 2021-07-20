import 'package:academy_lms/Asset/assets.dart';
import 'package:academy_lms/Components/app_drawer.dart';
import 'package:academy_lms/Locale/locales.dart';
import 'package:academy_lms/Models/user_experience_card_model.dart';
import 'package:academy_lms/Theme/colors.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

class Bookmarked extends StatefulWidget {
  @override
  _BookmarkedState createState() => _BookmarkedState();
}

class _BookmarkedState extends State<Bookmarked> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    List<UserExperienceCardModel> userExperienceList = [
      UserExperienceCardModel(locale.uxDesignDescription, Assets.uxDesignImage,
          'Jerry Geirge', 25.00, 4.5, 125),
      UserExperienceCardModel(locale.searchThree, Assets.image12,
          'Kelly Williamson', 35.00, 4.2, 136),
      UserExperienceCardModel(
          locale.searchFour, Assets.image13, 'Johnson Taylor', 42.00, 4.5, 105),
      UserExperienceCardModel(
          locale.searchFive, Assets.image14, 'Linda George', 45.00, 3.9, 206),
      UserExperienceCardModel(
          locale.searchSix, Assets.image12, 'Amenda Smith', 25.00, 4.9, 50),
    ];

    return Scaffold(
      backgroundColor: textFieldColor,
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          locale.bookmarked!,
          style: theme.textTheme.headline6,
        ),
      ),
      body: FadedSlideAnimation(
        Stack(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              color: theme.primaryColor,
            ),
            ListView.builder(
              itemCount: userExperienceList.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => Stack(
                children: [
                  Container(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(120, 20, 20, 20),
                    margin: EdgeInsetsDirectional.only(
                        start: 40, end: 20, bottom: 20),
                    decoration: BoxDecoration(
                        color: theme.scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(userExperienceList[index].title!),
                        Text(userExperienceList[index].teacher,
                            style: theme.textTheme.subtitle2),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              '\$${userExperienceList[index].price}',
                              textAlign: TextAlign.end,
                              style: theme.textTheme.subtitle1!
                                  .copyWith(color: theme.hintColor),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                userExperienceList[index].ratings.toString(),
                                style: theme.textTheme.caption!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '(${userExperienceList[index].reviews})',
                              style: theme.textTheme.caption!
                                  .copyWith(color: theme.hintColor),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  PositionedDirectional(
                    start: 16,
                    top: 20,
                    bottom: 40,
                    child: FadedScaleAnimation(
                      Image.asset(
                        userExperienceList[index].image,
                        width: 120,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
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
