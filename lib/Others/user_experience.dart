import 'dart:convert';

import 'package:academy_lms/Asset/assets.dart';
import 'package:academy_lms/Locale/locales.dart';
import 'package:academy_lms/Models/courses.dart';
import 'package:academy_lms/Models/user_experience_card_model.dart';
import 'package:academy_lms/Others/course_info.dart';
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

  List<String> names = [];
  List<String> images = [];
  List prices = [];
  List instructor = [];
  List<int> rating = [];
  List<int> review = [];
  List<UserExperienceCardModel> userExperienceCourses = [];
  final List<Category> loadedCategories = [];
  late String id;

  Future<void> getCoursesByCategory(int id) async {
    setState(() {
      _loading = true;
    });
    var url = Uri.parse(BASE_URL + 'api/category_wise_course?category_id=$id');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);

      // print(response.body);
      setState(() {
        _loading = false;
      });
      id = extractedData['id'];
      for (final value in extractedData) {
        names.add(value['title']);
      }

      for (final value in extractedData) {
        images.add(value['thumbnail']);
      }
      for (final value in extractedData) {
        prices.add(value['price']);
      }
      for (final value in extractedData) {
        instructor.add(value['instructor_name']);
      }
      for (final value in extractedData) {
        rating.add(value['rating']);
      }
      for (final value in extractedData) {
        review.add(value['number_of_ratings']);
      }
    } catch (error) {
      print('error $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;

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
      body: FadedSlideAnimation(
        Stack(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              color: theme.primaryColor,
            ),
            ListView.builder(
              itemCount: names.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CourseInfo(id: int.parse(id)),
                        ),
                      );
                    },
                    child: Container(
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
                          Text(names[index]),
                          Text(instructor[index],
                              style: theme.textTheme.subtitle2),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                '\$${prices[index]}',
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
                                  rating[index].toString(),
                                  style: theme.textTheme.caption!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '(${review[index].toString()})',
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
                      // Image.asset(
                      //   images[index],
                      //   width: 120,
                      //   fit: BoxFit.fill,
                      // ),
                      Image.network(
                        images[index],
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
