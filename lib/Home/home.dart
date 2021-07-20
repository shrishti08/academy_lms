import 'dart:convert';

import 'package:academy_lms/Asset/assets.dart';
import 'package:academy_lms/Components/app_drawer.dart';
import 'package:academy_lms/Components/category_list_items.dart';

import 'package:academy_lms/Components/course_list_itn.dart';
import 'package:academy_lms/Components/textfield.dart';
import 'package:academy_lms/Components/title_row.dart';
import 'package:academy_lms/Locale/locales.dart';
import 'package:academy_lms/Others/category-page.dart';

import 'package:academy_lms/Routes/routes.dart';
import 'package:academy_lms/providers/categories.dart';

import 'package:academy_lms/providers/courses.dart';
import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var _isInit = true;
  bool _isLoading = false;
  // var catData = [];
  // var topCourses = [];

  // @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     setState(() {
  //       _isLoading = true;
  //     });

  //     Provider.of<Categories>(context).fetchCategories().then((_) {
  //       setState(() {
  //         _isLoading = false;
  //         catData = Provider.of<Categories>(context, listen: false).items;
  //       });
  //     });

  //     Provider.of<Courses>(context).fetchTopCourses().then((_) {
  //       setState(() {
  //         _isLoading = false;
  //         topCourses = Provider.of<Courses>(context, listen: false).topItems;
  //       });
  //     });
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  // Future<Null> refreshList() async {
  //   try {
  //     await Provider.of<Categories>(context, listen: false).fetchCategories();
  //     await Provider.of<Courses>(context, listen: false).fetchTopCourses();

  //     setState(() {
  //       catData = Provider.of<Categories>(context, listen: false).items;
  //       topCourses = Provider.of<Courses>(context, listen: false).topItems;
  //     });
  //   } catch (error) {
  //     print(error);
  //     const errorMsg = 'Could not refresh!';
  //     CommonFunctions.showErrorDialog(errorMsg, context);
  //   }

  //   return null;
  // }
  @override
  void initState() {
    super.initState();

    fetchCategories();
  }

  String data = '';
  List categories = [];
  List<Category> _items = [];
  List<String> namesList = [];
  var catData = [];
  String BASE_URL = 'https://academy-lms.gstempire.com/';
  final List<Category> loadedCategories = [];

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
        data = catData['name'];
        for (final name in loadedCategories) {
          print(name);
        }
        print(namesList);
      });
    } catch (error) {
      throw (error);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final courseData = Provider.of<Courses>(context, listen: false).items;
    // final courseCount = courseData.length;

    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: FadedScaleAnimation(
          Text(
            'Academy LMS',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.notifications);
              },
              child: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(Assets.headerImage),
                    PositionedDirectional(
                      top: 144,
                      start: 16,
                      end: 16,
                      child: FadedScaleAnimation(
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: locale.learnFromBasics,
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    TextSpan(
                                      text: '\n' + locale.fullUIUXDesigns!,
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              FadedScaleAnimation(
                                TextButton(
                                  child: Text(locale.knowMore!),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, PageRoutes.search);
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      bottom: -16,
                      width: MediaQuery.of(context).size.width,
                      child: FadedScaleAnimation(
                        TextFieldForKdemy(
                          readOnly: true,
                          onTap: () {
                            Navigator.pushNamed(context, PageRoutes.search);
                          },
                          prefixIcon: Icons.search,
                          color: Colors.white,
                          hintText: locale.searchForCourseTopic,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 12),
                TitleRow(
                  locale.ongoingCourses,
                  padding: EdgeInsets.all(16),
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutes.ongoingCourses);
                  },
                ),
                Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, PageRoutes.lecturerInfo);
                      },
                      child: FadedScaleAnimation(
                        Container(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              120, 20, 20, 20),
                          margin:
                              EdgeInsetsDirectional.only(start: 40, end: 20),
                          decoration: BoxDecoration(
                              color: theme.scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(locale.uxDesignDescription!),
                              Text('Sam Smith',
                                  style: theme.textTheme.subtitle2),
                              Text(
                                '35 % ' + locale.complete!,
                                textAlign: TextAlign.end,
                                style: theme.textTheme.caption!
                                    .copyWith(color: theme.primaryColor),
                              ),
                              SizedBox(height: 4),
                              Container(
                                height: 4,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                  theme.primaryColor,
                                  theme.hintColor,
                                ], stops: [
                                  0.3,
                                  0.3
                                ])),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      start: 16,
                      top: 20,
                      bottom: 20,
                      child: Image.asset(Assets.uxDesignImage),
                    ),
                  ],
                ),
                TitleRow(
                  locale.topCategories,
                  padding: EdgeInsets.all(16),
                  onTap: () {
                    // Navigator.pushNamed(context, PageRoutes.categoryPage,
                    //     arguments: 'All Categories');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryPage()));
                  },
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20),
                //   child: ListView.builder(
                //     shrinkWrap: true,
                //     physics: NeverScrollableScrollPhysics(),
                //     itemBuilder: (ctx, index) {
                //       return CategoryListItem(
                //         id: catData[index].id,
                //         title: catData[index].title,
                //         thumbnail: catData[index].thumbnail,
                //         numberOfCourses: catData[index].numberOfCourses,
                //         backgroundColor: Colors.white,
                //       );
                //     },
                //     itemCount: catData.length,
                //   ),
                // ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  shrinkWrap: true,
                  itemCount: loadedCategories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 10,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            loadedCategories[index].title,
                            style: TextStyle(color: Colors.black, fontSize: 10),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.3),
                                BlendMode.dstATop),
                            image:
                                NetworkImage(loadedCategories[index].thumbnail),
                            fit: BoxFit.fill),
                      ),
                    );
                  },
                )

                // Container(
                //   height: 100,

                // ),

                // CategoriesList(
                //   topCategories,
                //   padding: EdgeInsets.symmetric(horizontal: 16),
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20),
                //   child: ListView.builder(
                //     shrinkWrap: true,
                //     physics: NeverScrollableScrollPhysics(),
                //     itemBuilder: (ctx, index) {
                //       return Center(
                //         child: CourseListItem(
                //           id: courseData[index].id,
                //           title: courseData[index].title,
                //           thumbnail: courseData[index].thumbnail,
                //           rating: courseData[index].rating,
                //           price: courseData[index].price,
                //           instructor: courseData[index].instructor,
                //           noOfRating: courseData[index].totalNumberRating,
                //         ),
                //       );
                //     },
                //     itemCount: courseData.length,
                //   ),
                // ),
              ],
            ),
    );
  }
}
