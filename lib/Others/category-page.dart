import 'dart:convert';

import 'package:academy_lms/Asset/assets.dart';
import 'package:academy_lms/Locale/locales.dart';
import 'package:academy_lms/Models/category_model.dart';
import 'package:academy_lms/Models/courses.dart';
import 'package:academy_lms/Models/search_model.dart';
import 'package:academy_lms/Others/user_experience.dart';
import 'package:academy_lms/Routes/routes.dart';
import 'package:academy_lms/providers/categories.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Theme/colors.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();

    fetchCategories();
  }

  // List<Course> buildCourseList(List extractedData) {
  //   final List<Course> loadedCourses = [];
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
  // List<String> _items = [];
  // Future<void> fetchCoursesByCategory(int categoryId) async {
  //   var url = Uri.parse(
  //       BASE_URL + '/api/category_wise_course?category_id=$categoryId');
  //   try {
  //     final response = await http.get(url);
  //     final extractedData = json.decode(response.body) as List;
  //     if (extractedData == null) {
  //       return;
  //     }
  //     print(extractedData);

  //     _items = extractedData as List<String>;
  //     print(_items);
  //   } catch (error) {
  //     throw (error);
  //   }
  // }

  final List<Category> loadedCategories = [];
  List<String> namesList = [];
  var catData = [];
  String BASE_URL = 'https://academy-lms.gstempire.com/';

  bool _isLoading = false;
  Future<void> fetchCategories() async {
    setState(() {
      _isLoading = true;
    });
    var url = Uri.parse(BASE_URL + '/api/categories');
    try {
      final response = await http.get(url);

      final extractedData = json.decode(response.body) as List;
      setState(() {
        _isLoading = false;
      });
      print(response.statusCode);
      if (extractedData == null) {
        return;
      } else
        print(extractedData);

      extractedData.forEach((catData) {
        loadedCategories.add(Category(
          id: int.parse(catData['id']),
          title: catData['name'],
          thumbnail: catData['thumbnail'],
          numberOfCourses: catData['number_of_courses'],
        ));

        print(catData['name']);
      });
    } catch (error) {
      throw (error);
    }
  }

  @override
  Widget build(BuildContext context) {
    // String category = ModalRoute.of(context)!.settings.arguments as String;
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;

    List<SearchModel> searches = [
      SearchModel(Assets.image1, locale.searchOne, 20.00),
      SearchModel(Assets.image2, locale.searchTwo, 26.00),
      SearchModel(Assets.image3, locale.uxDesignDescription, 25.00),
      SearchModel(Assets.courseInfo, locale.searchThree, 35.00),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('All categories'),
        flexibleSpace: Image.asset(
          Assets.headerImage,
          fit: BoxFit.fill,
        ),
        backgroundColor: Colors.transparent,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : FadedSlideAnimation(
              ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Text(
                      locale.recentSearches!,
                      style: theme.textTheme.subtitle1!.copyWith(
                          color: textColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 164,
                    margin: EdgeInsets.all(16),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: searches.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadedScaleAnimation(
                              Image.asset(
                                searches[index].image,
                                height: 110,
                                width: MediaQuery.of(context).size.width / 2.5,
                              ),
                            ),
                            Text(
                              searches[index].title!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '\$${searches[index].price}',
                              style: theme.textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(thickness: 8),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Text(
                      locale.selectSubcategories!,
                      style: theme.textTheme.subtitle1!.copyWith(
                          color: textColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListView.builder(
                    // itemCount: subCategories.length,
                    itemCount: loadedCategories.length,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(16),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        // Navigator.pushNamed(
                        //   context,
                        //   PageRoutes.userExperience,
                        // );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserExperiencePage(
                                      courseId: loadedCategories[index].id,
                                    )));
                      },
                      child: RichText(
                        text: TextSpan(
                          style: theme.textTheme.subtitle1!
                              .copyWith(color: textColor, height: 2),
                          children: [
                            TextSpan(text: loadedCategories[index].title),
                            TextSpan(
                                text:
                                    ' (${loadedCategories[index].numberOfCourses})',
                                style: theme.textTheme.subtitle1!
                                    .copyWith(color: theme.hintColor))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              beginOffset: Offset(0, 0.3),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
    );
  }
}
