import 'dart:convert';

import 'package:academy_lms/Asset/assets.dart';
import 'package:academy_lms/Locale/locales.dart';
import 'package:academy_lms/Models/courses.dart';
import 'package:academy_lms/Models/user_experience_card_model.dart';
import 'package:academy_lms/Others/filters.dart';
import 'package:academy_lms/Routes/routes.dart';
import 'package:academy_lms/Theme/colors.dart';
import 'package:academy_lms/providers/categories.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserExperiencePage extends StatefulWidget {
  int courseId;
  UserExperiencePage({required this.courseId});

  @override
  _UserExperiencePageState createState() => _UserExperiencePageState();
}

class _UserExperiencePageState extends State<UserExperiencePage> {
  final List<Course> loadedCourses = [];
  // List<Course> buildCourseList(List extractedData) {
  //   extractedData.forEach((courseData) {
  //     loadedCourses.add(Course(
  //       id: int.parse(courseData['id']),
  //       title: courseData['title'],
  //       thumbnail: courseData['thumbnail'],
  //       price: courseData['price'],
  //       instructor: courseData['instructor_name'],
  //       rating: courseData['rating'],
  //       totalNumberRating: courseData['number_of_ratings'],
  //       numberOfEnrollment: courseData['total_enrollment'],
  //       shareableLink: courseData['shareable_link'],
  //       courseOverviewProvider: courseData['course_overview_provider'],
  //       courseOverviewUrl: courseData['video_url'],
  //       vimeoVideoId: courseData['vimeo_video_id'],
  //     ));
  //     // print(catData['name']);
  //   });
  //   return loadedCourses;
  // }

  bool _loading = false;

  @override
  void initState() {
    super.initState();

    getCoursesByCategory(widget.courseId);
  }

  String BASE_URL = 'https://academy-lms.gstempire.com/';
  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  // Future<void> fetchCoursesByCategory(int categoryId) async {
  //   setState(() {
  //     _loading = true;
  //   });
  //   var url = Uri.parse(
  //       BASE_URL + '/api/category_wise_course?category_id=$categoryId');
  //   try {
  //     final response = await http.get(url);
  //     final extractedData = json.decode(response.body) as List;
  //     setState(() {
  //       _loading = false;
  //     });

  //     print(extractedData);
  //     print(response.statusCode);
  //     if (response.statusCode == 200) {
  //       _items = buildCourseList(extractedData);
  //     }
  //     print(_items);
  //   } catch (error) {
  //     SnackBar(
  //       content: Text(error.toString()),
  //     );
  //   }

  Future<void> getCoursesByCategory(int id) async {
    setState(() {
      _loading = true;
    });
    var url = Uri.parse(BASE_URL + 'api/category_wise_course?category_id=$id');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);

      print(response.body);
      extractedData.forEach((catData) {
        loadedCourses.add(Course(
          id: int.parse(catData['id']),
          title: catData['title'],
          thumbnail: catData['thumbnail'],
          instructor: catData['instructor_name'],
          numberOfEnrollment: int.parse(catData['total_enrollment']),
          rating: int.parse(catData['rating']),
          vimeoVideoId: catData['video_url'],
          shareableLink: catData['shareable_link'],
          courseOverviewProvider: catData['course_overview_provider'],
          price: catData['price'],
          totalNumberRating: int.parse(catData['number_of_ratings']),
          courseOverviewUrl: catData['short_description'],
        ));
      });
      setState(() {
        _loading = false;
      });
      // buildCourseList(extractedData);

    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    // List<UserExperienceCardModel> userExperienceList = [
    //   UserExperienceCardModel(locale.uxDesignDescription, Assets.uxDesignImage,
    //       'Jerry Geirge', 25.00, 4.5, 125),
    //   UserExperienceCardModel(locale.searchThree, Assets.image12,
    //       'Kelly Williamson', 35.00, 4.2, 136),
    //   UserExperienceCardModel(
    //       locale.searchFour, Assets.image13, 'Johnson Taylor', 42.00, 4.5, 105),
    //   UserExperienceCardModel(
    //       locale.searchFive, Assets.image14, 'Linda George', 45.00, 3.9, 206),
    //   UserExperienceCardModel(
    //       locale.searchSix, Assets.image12, 'Amenda Smith', 25.00, 4.9, 50),
    // ];

    return Scaffold(
      endDrawer: Builder(builder: (internalContext) => Filters()),
      backgroundColor: textFieldColor,
      appBar: AppBar(
        title: Text(locale.userExperience!),
        actions: [
          Builder(
            builder: (cnt) => IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () {
                  //  Filters();
                  Scaffold.of(cnt).openEndDrawer();
                }),
          ),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : FadedSlideAnimation(
              Stack(
                children: [
                  Container(
                    height: 60,
                    width: double.infinity,
                    color: theme.primaryColor,
                  ),
                  ListView.builder(
                    // itemCount: userExperienceList.length,
                    itemCount: loadedCourses.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, PageRoutes.courseInfo);
                          },
                          child: Container(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                120, 20, 20, 20),
                            margin: EdgeInsetsDirectional.only(
                                start: 40, end: 20, bottom: 20),
                            decoration: BoxDecoration(
                                color: theme.scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(loadedCourses[index].title),
                                Text(loadedCourses[index].instructor,
                                    style: theme.textTheme.subtitle2),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      '\$${loadedCourses[index].price}'
                                          .toString(),
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
                                        loadedCourses[index].rating.toString(),
                                        style: theme.textTheme.caption!
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '(${loadedCourses[index].courseOverviewProvider})',
                                      style: theme.textTheme.caption!
                                          .copyWith(color: theme.hintColor),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        PositionedDirectional(
                          start: 16,
                          top: 20,
                          bottom: 40,
                          child: FadedScaleAnimation(
                            Image.asset(
                              loadedCourses[index].thumbnail,
                              width: 120,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ListView.builder(
                  //     itemCount: _items.length,
                  //     itemBuilder: (context, index) {
                  //       return Column(
                  //         children: [
                  //           Text(_items[index].title),
                  //         ],
                  //       );
                  //     })
                ],
              ),
              beginOffset: Offset(0, 0.3),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
    );
  }
}
