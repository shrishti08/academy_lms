import 'dart:convert';

import 'package:academy_lms/Asset/assets.dart';
import 'package:academy_lms/Auth/SignIn/auth.dart';
import 'package:academy_lms/Components/custombutton.dart';
import 'package:academy_lms/Locale/locales.dart';
import 'package:academy_lms/Routes/routes.dart';
import 'package:academy_lms/Theme/colors.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:http/http.dart' as http;

class CourseInfo extends StatefulWidget {
  int id;
  CourseInfo({required this.id});
  @override
  _CourseInfoState createState() => _CourseInfoState();
}

class _CourseInfoState extends State<CourseInfo> {
  late String authToken;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authToken = AuthClass().getToken() as String;
    getCourseDetails();
  }

  String BASE_URL = 'https://academy-lms.gstempire.com/';
  Future<void> getCourseDetails() async {
    var url = Uri.parse(BASE_URL +
        'api/course_details_by_id?auth_token=$authToken&course_id=${widget.id}');
    try {
      final response = await http.get(url);
      final extracedData = json.decode(response.body);
      print('Course details are: $extracedData');
    } catch (e) {
      print('error: $e');
      throw (e);
    }
  }

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
                  Assets.courseInfo,
                  scale: 2.75,
                ),
                Expanded(
                  child: TabBarView(children: [
                    FadedSlideAnimation(
                      AboutTab(),
                      beginOffset: Offset(0, 0.3),
                      endOffset: Offset(0, 0),
                      slideCurve: Curves.linearToEaseOut,
                    ),
                    FadedSlideAnimation(
                      ChaptersTab(),
                      beginOffset: Offset(0, 0.3),
                      endOffset: Offset(0, 0),
                      slideCurve: Curves.linearToEaseOut,
                    ),
                    FadedSlideAnimation(
                      ReviewsTab(),
                      beginOffset: Offset(0, 0.3),
                      endOffset: Offset(0, 0),
                      slideCurve: Curves.linearToEaseOut,
                    ),
                  ]),
                ),
              ],
            ),
            PositionedDirectional(
              top: 230,
              start: 14,
              end: 14,
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
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
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
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '4.5',
                              style: theme.textTheme.caption!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            ' (125)',
                            style: theme.textTheme.caption!
                                .copyWith(color: theme.hintColor),
                          )
                        ],
                      ),
                      TabBar(
                        indicatorColor: Theme.of(context).primaryColor,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: theme.primaryColor,
                        unselectedLabelColor: theme.hintColor,
                        tabs: [
                          Tab(
                            text: locale.about,
                          ),
                          Tab(
                            text: locale.videos,
                          ),
                          Tab(
                            text: locale.reviews,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            PositionedDirectional(
              bottom: 0,
              start: 0,
              end: 0,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            locale.lifetimeSubscription!,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '      ' + '\$ 25.00',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: textColor),
                          ),
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                    child: CustomButton(
                      onTap: () {
                        Navigator.pushNamed(context, PageRoutes.home);
                      },
                      text: locale.subscribe,
                      margin: EdgeInsets.zero,
                      borderRadius: BorderRadius.zero,
                    ),
                  )
                ],
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
          ],
        ),
      ),
    );
  }
}

class AboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        color: textFieldColor,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Material(
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
                      locale.courseBrief!,
                      style: theme.textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.timelapse,
                          color: Theme.of(context).primaryColor,
                          size: 18,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              locale.totalTimings!,
                              style: Theme.of(context).textTheme.caption,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              '36 ' + locale.hours!,
                              style: Theme.of(context).textTheme.bodyText1,
                            )
                          ],
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        Icon(
                          Icons.live_tv_outlined,
                          size: 18,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              locale.totalVideos!,
                              style: Theme.of(context).textTheme.caption,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              '35 ' + locale.lectures!,
                              style: Theme.of(context).textTheme.bodyText1,
                            )
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.verified_user,
                          color: Theme.of(context).primaryColor,
                          size: 18,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              locale.accessibility!,
                              style: Theme.of(context).textTheme.caption,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              locale.lifetime!,
                              style: Theme.of(context).textTheme.bodyText1,
                            )
                          ],
                        ),
                        Spacer(
                          flex: 4,
                        ),
                        Icon(
                          Icons.calendar_today_rounded,
                          size: 18,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              locale.courseUploaded!,
                              style: Theme.of(context).textTheme.caption,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              '20th March, 18',
                              style: Theme.of(context).textTheme.bodyText1,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Material(
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
                      locale.description!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec felis tellus. Mauris consectetur scelerisque risus nec mollis.\n\nNullam varius augue et sollicitudin feugiat. Donec sit amet ligula a lorem condimentum eleifend eu sit amet arcu.',
                      style: theme.textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 80),
              child: GestureDetector(
                onTap: () {
                  //Navigator.pushNamed(context, PageRoutes.authorInfo);
                },
                child: Material(
                  borderRadius: BorderRadius.circular(8),
                  elevation: 20,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, PageRoutes.lecturerProfile);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            locale.createdBy!,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: ClipOval(
                              child: Image.asset(Assets.profileImage),
                            ),
                            title: Row(
                              children: [
                                Text(
                                  'Mark Johnson',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 15),
                                ),
                                Spacer(),
                                Text(locale.viewProfile!,
                                    style: Theme.of(context).textTheme.caption),
                              ],
                            ),
                            subtitle: Text(
                              'New jersey',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(fontSize: 12),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Spacer(
                                flex: 3,
                              ),
                              Text(
                                '886' + '  ',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Spacer(
                                flex: 2,
                              ),
                              Text(
                                '39',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Spacer(
                                flex: 2,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  '4.5',
                                  style: theme.textTheme.caption!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                ' (125)',
                                style: theme.textTheme.caption!
                                    .copyWith(color: theme.hintColor),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Spacer(
                                flex: 3,
                              ),
                              Text(
                                locale.subscribed!,
                                style: Theme.of(context).textTheme.caption,
                              ),
                              Spacer(
                                flex: 2,
                              ),
                              Text(
                                locale.courses!,
                                style: Theme.of(context).textTheme.caption,
                              ),
                              Spacer(
                                flex: 2,
                              ),
                              Text(
                                locale.averageRatings!,
                                style: theme.textTheme.caption!
                                    .copyWith(color: theme.hintColor),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChaptersTab extends StatefulWidget {
  @override
  _ChaptersTabState createState() => _ChaptersTabState();
}

class Chapter {
  String? title;
  String subtitle;

  Chapter(this.title, this.subtitle);
}

class _ChaptersTabState extends State<ChaptersTab> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<Chapter> chapters = [
      Chapter(locale.questionOne, '9:56 ' + 'mins'),
      Chapter(locale.questionTwo, '12:56 mins'),
      Chapter(locale.questionThree, '16:12 mins'),
      Chapter(locale.questionFour, '18:15 ' + 'mins'),
      Chapter(locale.questionFive, '9:56 ' + 'mins'),
      Chapter(locale.questionOne, '12:56 mins'),
      Chapter(locale.questionTwo, '16:12 mins'),
      Chapter(locale.questionThree, '18:15 ' + 'mins'),
    ];
    return Column(
      children: [
        SizedBox(
          height: 85,
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
                    child: Text(
                      locale.introductionToUserInterface!,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontSize: 12,
                          ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 70, left: 10),
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

class ReviewsTab extends StatefulWidget {
  @override
  _ReviewsTabState createState() => _ReviewsTabState();
}

class _ReviewsTabState extends State<ReviewsTab> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        color: textFieldColor,
        padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 80),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Material(
              color: Theme.of(context).scaffoldBackgroundColor,
              elevation: 5,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      locale.overallRatings!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.lightGreen,
                          ),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: '4.5' + '\n',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor)),
                              TextSpan(
                                  text: '\n' + '(125 ' + locale.reviews! + ')',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          fontSize: 11,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          height: 0.5)),
                            ]),
                          ),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            buildReviewIndicator(context, '5', 0.7, '78'),
                            buildReviewIndicator(context, '4', 0.4, '12'),
                            buildReviewIndicator(context, '3', 0.3, '07'),
                            buildReviewIndicator(context, '2', 0.2, '04'),
                            buildReviewIndicator(context, '1', 0.1, '02'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Material(
              color: Theme.of(context).scaffoldBackgroundColor,
              elevation: 5,
              borderRadius: BorderRadius.circular(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 4),
                    child: Text(
                      locale.studentFeedbacks!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  ListView.builder(
                      padding: EdgeInsets.only(bottom: 20),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Divider(
                              height: 24,
                            ),
                            ListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                              leading: ClipOval(
                                child: Image.asset(Assets.image6),
                              ),
                              title: Text(
                                'Emili Williamson',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 14),
                              ),
                              subtitle: Text(
                                '20 March\'18',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(fontSize: 12),
                              ),
                              trailing: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.lightGreen,
                                ),
                                child: Text(
                                  '5.0',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
                            ),
                          ],
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildReviewIndicator(
      context, String number, double percent, String reviews) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Text(
            number,
            style: TextStyle(color: Colors.grey[600]),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            AppLocalizations.of(context)!.star!,
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(
            width: 10,
          ),
          LinearPercentIndicator(
            backgroundColor: Theme.of(context).hintColor,
            width: 120.0,
            lineHeight: 4.0,
            percent: percent,
            progressColor: Theme.of(context).primaryColor,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            reviews,
            style: TextStyle(color: Theme.of(context).hintColor),
          ),
        ],
      ),
    );
  }
}
