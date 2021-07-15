import 'package:flutter/material.dart';

class CourseListItem extends StatelessWidget {
  final int id;
  final String title;
  final String thumbnail;
  final int rating;
  final String price;
  final String instructor;
  final int noOfRating;

  CourseListItem({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.rating,
    required this.price,
    required this.instructor,
    required this.noOfRating,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context)
        //     .pushNamed(CourseDetailScreen.routeName, arguments: id);
      },
      child: Card(
        color: Colors.white,
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
                  // height: 130,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      instructor,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        // Container(
                        //   width: 80,
                        //   child: StarDisplayWidget(
                        //     value: rating,
                        //     filledStar: Icon(
                        //       Icons.star,
                        //       color: Colors.amber,
                        //       size: 15,
                        //     ),
                        //     unfilledStar: Icon(
                        //       Icons.star,
                        //       color: Colors.grey,
                        //       size: 15,
                        //     ),
                        //   ),
                        // ),
                        Container(
                          width: 30,
                          child: Text(
                            '$rating.0',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 30,
                          child: Text(
                            '( $noOfRating )',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            price,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
