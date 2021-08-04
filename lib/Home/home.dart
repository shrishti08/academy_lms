import 'dart:convert';

import 'package:academy_lms/Asset/assets.dart';
import 'package:academy_lms/Auth/SignIn/auth.dart';
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
  int categoryId;
  HomePage({required this.categoryId});

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
  late Future<String?> auth_token;
  @override
  void initState() {
    super.initState();
    auth_token = AuthClass().getToken();
    getBannerImage();
    getCoursesByCategory(widget.categoryId);
    getOngoingCourse();
  }

  String data = '';
  List categories = [];
  List<Category> _items = [];
  List<String> namesList = [];
  var catData = [];
  String BASE_URL = 'https://academy-lms.gstempire.com/';
  final List<Category> loadedCategories = [];
  String bannerImage = '';

  // Future<void> fetchCategories() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   var url = Uri.parse(BASE_URL + '/api/categories');
  //   try {
  //     final response = await http.get(url);

  //     final extractedData = json.decode(response.body) as List;
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     print(response.statusCode);
  //     if (extractedData == null) {
  //       return;
  //     } else
  //       print(extractedData);

  // extractedData.forEach((catData) {
  //   loadedCategories.add(Category(
  //     id: int.parse(catData['id']),
  //     title: catData['name'],
  //     thumbnail: catData['thumbnail'],
  //     numberOfCourses: catData['number_of_courses'],
  //   ));

  //   print(catData['name']);
  //   data = catData['name'];
  //   for (final name in loadedCategories) {
  //     print(name);
  //   }
  //   print(namesList);
  // });
  //   } catch (error) {
  //     throw (error);
  //   }
  // }
  Future<void> getCoursesByCategory(int id) async {
    setState(() {
      _isLoading = true;
    });
    var url = Uri.parse(BASE_URL + 'api/category_wise_course?category_id=$id');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      setState(() {
        _isLoading = false;
      });
      print(response.statusCode);
      extractedData.forEach((catData) {
        loadedCategories.add(Category(
            id: int.parse(catData['id']),
            title: catData['title'],
            thumbnail: catData['thumbnail'],
            // numberOfCourses: catData['number_of_courses'],
            numberOfCourses: 4));
      });
    } catch (error) {
      print(error);
    }
  }

  Future<void> getBannerImage() async {
    setState(() {
      _isLoading = true;
    });
    var url = Uri.parse(BASE_URL + 'api/app_logo');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      setState(() {
        _isLoading = false;
      });
      print(response.statusCode);
      bannerImage = extractedData['banner_image'];
    } catch (e) {
      throw (e);
    }
  }

  Future<void> getOngoingCourse() async {
    var url = Uri.parse(BASE_URL + 'api/my_courses?auth_token=$auth_token');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      print('status code of ongoing course: ${response.statusCode}');
      print('ongoing course : $extractedData');
      print(response.body);
    } catch (e) {
      throw (e);
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
            'Raone Education',
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
                    Image.network(bannerImage),
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

                // GridView.builder(
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2),
                //   shrinkWrap: true,
                //   itemCount: loadedCategories.length,
                //   itemBuilder: (context, index) {
                //     return Container(
                //       height: 10,
                //       width: double.infinity,
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Align(
                //           alignment: Alignment.center,
                //           child: Text(
                //             loadedCategories[index].title,
                //             style: TextStyle(color: Colors.black, fontSize: 10),
                //           ),
                //         ),
                //       ),
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(20),
                //         image: DecorationImage(
                //             colorFilter: new ColorFilter.mode(
                //                 Colors.black.withOpacity(0.3),
                //                 BlendMode.dstATop),
                //             image:
                //                 NetworkImage(loadedCategories[index].thumbnail),
                //             fit: BoxFit.fill),
                //       ),
                //     );
                //   },
                // )
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount: loadedCategories.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    childAspectRatio: 2,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryPage(),
                        ),
                      );
                    },
                    child: FadedScaleAnimation(
                      Container(
                          padding:
                              EdgeInsetsDirectional.only(start: 12, top: 44),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  loadedCategories[index].thumbnail),
                            ),
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: loadedCategories[index].title,
                                    style: theme.textTheme.headline6),
                                TextSpan(
                                    text: '\n' +
                                        loadedCategories[index]
                                            .numberOfCourses
                                            .toString() +
                                        ' ' +
                                        AppLocalizations.of(context)!.courses!,
                                    style: theme.textTheme.caption!.copyWith(
                                        color: theme.scaffoldBackgroundColor
                                            .withOpacity(0.7)))
                              ],
                            ),
                          )),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
