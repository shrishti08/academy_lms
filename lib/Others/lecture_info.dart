import 'package:academy_lms/Asset/assets.dart';
import 'package:academy_lms/Locale/locales.dart';
import 'package:academy_lms/Theme/colors.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';

class LectureInfo extends StatefulWidget {
  @override
  _LectureInfoState createState() => _LectureInfoState();
}

class _LectureInfoState extends State<LectureInfo> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: textFieldColor,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Image.asset(
                  Assets.image9,
                  scale: 2.75,
                ),
                Expanded(
                  child: TabBarView(children: [
                    FadedSlideAnimation(
                      LecturesTab(),
                      beginOffset: Offset(0, 0.3),
                      endOffset: Offset(0, 0),
                      slideCurve: Curves.linearToEaseOut,
                    ),
                    FadedSlideAnimation(
                      QATab(),
                      beginOffset: Offset(0, 0.3),
                      endOffset: Offset(0, 0),
                      slideCurve: Curves.linearToEaseOut,
                    ),
                    FadedSlideAnimation(
                      MoreTab(),
                      beginOffset: Offset(0, 0.3),
                      endOffset: Offset(0, 0),
                      slideCurve: Curves.linearToEaseOut,
                    ),
                  ]),
                ),
              ],
            ),
            PositionedDirectional(
              top: 236,
              start: 0,
              end: 0,
              child: Material(
                borderRadius: BorderRadius.circular(8),
                elevation: 20,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        locale.uxDesignDescription!,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: textColor,
                              fontSize: 15,
                            ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            'by Jerry George',
                            style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                      fontSize: 12,
                                    ),
                          ),
                          Spacer(),
                        ],
                      ),
                      TabBar(
                        indicatorColor: Theme.of(context).primaryColor,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: theme.primaryColor,
                        unselectedLabelColor: theme.hintColor,
                        tabs: [
                          Tab(
                            text: locale.lectures,
                          ),
                          Tab(
                            text: 'Q&A',
                          ),
                          Tab(
                            text: locale.more,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            PositionedDirectional(
              top: 30,
              start: 0,
              end: 0,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: theme.scaffoldBackgroundColor,
                      )),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        color: theme.scaffoldBackgroundColor,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.bookmark_border,
                        color: theme.scaffoldBackgroundColor,
                      ))
                ],
              ),
            ),
            PositionedDirectional(
              top: 120,
              start: 0,
              end: 0,
              child: Row(
                children: [
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.fast_rewind,
                        color: theme.scaffoldBackgroundColor,
                      )),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.pause,
                        color: theme.scaffoldBackgroundColor,
                      )),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.fast_forward_rounded,
                        color: theme.scaffoldBackgroundColor,
                      )),
                  Spacer(),
                ],
              ),
            ),
            PositionedDirectional(
              top: 183,
              start: 0,
              end: 0,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '1:35',
                        style:
                            theme.textTheme.subtitle1!.copyWith(fontSize: 14),
                      ),
                      Spacer(),
                      Text(
                        '2:56',
                        style:
                            theme.textTheme.subtitle1!.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.filter_center_focus_sharp,
                            color: theme.scaffoldBackgroundColor,
                          )),
                    ],
                  ),
                  LinearPercentIndicator(
                    backgroundColor: Theme.of(context).hintColor,
                    width: MediaQuery.of(context).size.width,
                    lineHeight: 4.0,
                    percent: 0.4,
                    progressColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LecturesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    List<QA> chapters = [
      QA(locale.questionOne, '9:56 ' + 'mins'),
      QA(locale.questionTwo, '12:56 mins'),
      QA(locale.questionThree, '16:12 mins'),
      QA(locale.questionFour, '18:15 ' + 'mins'),
      QA(locale.questionFive, '9:56 ' + 'mins'),
      QA(locale.questionOne, '12:56 mins'),
      QA(locale.questionTwo, '16:12 mins'),
      QA(locale.questionThree, '18:15 ' + 'mins'),
    ];
    return Column(
      children: [
        SizedBox(
          height: 80,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 80, bottom: 0),
            color: textFieldColor,
            padding: EdgeInsets.all(8),
            child: Material(
              color: Theme.of(context).scaffoldBackgroundColor,
              elevation: 5,
              borderRadius: BorderRadius.circular(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 16),
                    child: Row(
                      children: [
                        Text(
                          locale.introductionToUserInterface!,
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    fontSize: 12,
                                  ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.download_sharp,
                          color: theme.primaryColor,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 0, left: 10),
                        physics: BouncingScrollPhysics(),
                        itemCount: chapters.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text(
                              '${index + 1}' + '.',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                            title: Text(
                              chapters[index].title!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 14),
                            ),
                            subtitle: Text(
                              chapters[index].subtitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(fontSize: 12),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class QATab extends StatefulWidget {
  @override
  _QATabState createState() => _QATabState();
}

class QA {
  String? title;
  String subtitle;

  QA(this.title, this.subtitle);
}

class _QATabState extends State<QATab> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    List<QA> qa = [
      QA(locale.questionOne, '9:56 ' + 'mins'),
      QA(locale.questionTwo, '12:56 mins'),
      QA(locale.questionThree, '16:12 mins'),
      QA(locale.questionFour, '18:15 ' + 'mins'),
      QA(locale.questionFive, '9:56 ' + 'mins'),
      QA(locale.questionOne, '12:56 mins'),
      QA(locale.questionTwo, '16:12 mins'),
      QA(locale.questionThree, '18:15 ' + 'mins'),
    ];

    return Column(
      children: [
        SizedBox(
          height: 160,
        ),
        Expanded(
          child: Container(
            color: textFieldColor,
            padding: EdgeInsets.all(8),
            child: Material(
              color: Theme.of(context).scaffoldBackgroundColor,
              elevation: 5,
              borderRadius: BorderRadius.circular(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 16),
                    child: Row(
                      children: [
                        Text(
                          locale.total! + ' 114 ' + locale.questions!,
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    fontSize: 12,
                                  ),
                        ),
                        Spacer(),
                        Text(
                          locale.allLectures!,
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    fontSize: 12,
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 70, left: 10),
                        physics: BouncingScrollPhysics(),
                        itemCount: qa.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: Theme.of(context).hintColor,
                                  width: double.infinity,
                                  height: 1,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        locale.lecture! + ' 5',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                              fontSize: 12,
                                            ),
                                      ),
                                      Spacer(),
                                      Text(
                                        'By Ammy George',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                              fontSize: 12,
                                            ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    qa[index].title!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    locale.lectureDescription!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                          color: textColor,
                                          fontSize: 12,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        '28 May 18 | 12:48',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                              fontSize: 12,
                                            ),
                                      ),
                                      Spacer(),
                                      Text(
                                        locale.read! + ' 3 ' + locale.replies!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 12),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MoreTab extends StatefulWidget {
  @override
  _MoreTabState createState() => _MoreTabState();
}

class MoreItems {
  final String? title;
  final Icon icon;

  MoreItems(this.title, this.icon);
}

class _MoreTabState extends State<MoreTab> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<MoreItems> _moreItems = [
      MoreItems(
          locale.courseDescription,
          Icon(
            Icons.info,
            color: Theme.of(context).primaryColor,
          )),
      MoreItems(
          locale.shareThisCourse,
          Icon(
            Icons.share,
            color: Theme.of(context).primaryColor,
          )),
      MoreItems(
          locale.addToBookmark,
          Icon(
            Icons.bookmark,
            color: Theme.of(context).primaryColor,
          )),
      MoreItems(
          locale.reviewThisCourse,
          Icon(
            Icons.thumb_up,
            color: Theme.of(context).primaryColor,
          )),
      MoreItems(
          locale.viewSimilarCourses,
          Icon(
            Icons.table_view_rounded,
            color: Theme.of(context).primaryColor,
          )),
    ];
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        color: textFieldColor,
        padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 80),
        child: Column(
          children: [
            SizedBox(
              height: 160,
            ),
            Material(
              color: Theme.of(context).scaffoldBackgroundColor,
              elevation: 5,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: _moreItems.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: _moreItems[index].icon,
                          title: Text(
                            _moreItems[index].title!,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        );
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
