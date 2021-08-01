class Course {
  String id;
  String title;
  String thumbnail;
  String price;
  String instructor;
  String rating;
  String totalNumberRating;
  String numberOfEnrollment;
  String shareableLink;
  String courseOverviewProvider;
  String courseOverviewUrl;
  String vimeoVideoId;

  Course({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.price,
    required this.instructor,
    required this.rating,
    required this.totalNumberRating,
    required this.numberOfEnrollment,
    required this.shareableLink,
    required this.courseOverviewProvider,
    required this.courseOverviewUrl,
    required this.vimeoVideoId,
  });
}
