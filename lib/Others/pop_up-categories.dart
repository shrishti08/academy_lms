import 'dart:convert';

import 'package:academy_lms/Components/custombutton.dart';
import 'package:academy_lms/Home/home.dart';
import 'package:academy_lms/Locale/locales.dart';
import 'package:academy_lms/Routes/routes.dart';
import 'package:academy_lms/Theme/colors.dart';
import 'package:academy_lms/providers/categories.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../language_cubit.dart';

class SelectCategory extends StatefulWidget {
  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  late LanguageCubit _languageCubit;
  int? _selectedCategory;
  bool _isLoading = false;
  int categoryId = 1;

  @override
  void initState() {
    super.initState();
    _selectedCategory = 0;
    fetchCategories();
  }

  var catData = [];
  final List<String?> categories = [];
  String BASE_URL = 'https://academy-lms.gstempire.com/';
  final List<Category> loadedCategories = [];
  String bannerImage = '';

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
      });
    } catch (error) {
      throw (error);
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Category',
          style: theme.textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : FadedSlideAnimation(
              Stack(
                children: [
                  ListView(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        child: Text(
                          'Select your category',
                          style: theme.textTheme.subtitle2!.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: loadedCategories.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => RadioListTile(
                          activeColor: theme.primaryColor,
                          value: index,
                          groupValue: _selectedCategory,
                          onChanged: (dynamic value) {
                            setState(() {
                              _selectedCategory = value;
                              categoryId = loadedCategories[index].id;
                            });
                          },
                          title: Text(
                            loadedCategories[index].title,
                            style: theme.textTheme.subtitle1!
                                .copyWith(fontSize: 14, color: textColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  PositionedDirectional(
                    bottom: 0,
                    start: 0,
                    end: 0,
                    child: GestureDetector(
                      onTap: () async {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomePage(categoryId: categoryId)));
                      },
                      child: CustomButton(
                        text: locale.save,
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
