import 'package:academy_lms/Asset/assets.dart';
import 'package:academy_lms/Components/categories_list.dart';
import 'package:academy_lms/Components/textfield.dart';
import 'package:academy_lms/Components/title_row.dart';
import 'package:academy_lms/Locale/locales.dart';
import 'package:academy_lms/Models/category_model.dart';
import 'package:academy_lms/Theme/colors.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    List<String?> searches = [
      locale.foodPhotographyCourses,
      locale.designingCourses,
      locale.howToCreateMockUp,
    ];
    List<TopCategory> topCategories = [
      TopCategory(locale.design, '125', Assets.topCategory1),
      TopCategory(locale.business, '221', Assets.topCategory2),
      TopCategory(locale.development, '199', Assets.topCategory3),
      TopCategory(locale.photography, '201', Assets.topCategory4),
      TopCategory(locale.fitness, '112', Assets.topCategory5),
      TopCategory(locale.music, '156', Assets.topCategory1),
    ];

    return Scaffold(
      body: FadedSlideAnimation(
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFieldForKdemy(
                prefixIcon: Icons.search,
                color: Colors.white,
                hintText: locale.searchForCourseTopic,
                margin: EdgeInsets.symmetric(horizontal: 8),
              ),
              Divider(),
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                children: [
                  Text(
                    locale.recentSearches!,
                    style: theme.textTheme.subtitle1!.copyWith(
                        color: textColor, fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: searches.length,
                    itemBuilder: (context, index) => Text(
                      searches[index]!,
                      style: theme.textTheme.subtitle2!.copyWith(height: 2),
                    ),
                  ),
                  SizedBox(height: 20),
                  TitleRow(locale.topCategories),
                  CategoriesList(topCategories),
                ],
              ),
            ],
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
