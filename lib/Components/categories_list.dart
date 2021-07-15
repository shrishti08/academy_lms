import 'package:academy_lms/Locale/locales.dart';
import 'package:academy_lms/Models/category_model.dart';
import 'package:academy_lms/Routes/routes.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  final List<TopCategory> list;
  final EdgeInsetsGeometry? padding;

  CategoriesList(this.list, {this.padding});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: padding ?? EdgeInsets.zero,
      itemCount: list.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        childAspectRatio: 2,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.pushNamed(context, PageRoutes.categoryPage,
              arguments: list[index].course);
        },
        child: FadedScaleAnimation(
          Container(
              padding: EdgeInsetsDirectional.only(start: 12, top: 44),
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(list[index].image))),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: list[index].course,
                        style: theme.textTheme.headline6),
                    TextSpan(
                        text: '\n' +
                            list[index].numberOfCourses +
                            ' ' +
                            AppLocalizations.of(context)!.courses!,
                        style: theme.textTheme.caption!.copyWith(
                            color:
                                theme.scaffoldBackgroundColor.withOpacity(0.7)))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
