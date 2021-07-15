import 'package:academy_lms/Components/course_screen.dart';
import 'package:flutter/material.dart';

enum CoursesPageData {
  Category,
  Filter,
  Search,
  All,
}

class CategoryListItem extends StatelessWidget {
  final int id;
  final String title;
  final String thumbnail;
  final int numberOfCourses;
  final Color backgroundColor;

  CategoryListItem(
      {required this.id,
      required this.title,
      required this.thumbnail,
      required this.numberOfCourses,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          CoursesScreen.routeName,
          arguments: {
            'category_id': id,
            'seacrh_query': null,
            'type': CoursesPageData.Category,
          },
        );
      },
      child: Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading_animated.gif',
                  image: thumbnail,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                width: double.infinity,
                // height: 80,
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '$numberOfCourses Courses',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ImageIcon(
                  AssetImage("assets/images/long_arrow_right.png"),
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
