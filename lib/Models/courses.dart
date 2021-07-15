class Course {
  int id;
  String title;
  String thumbnail;
  String price;
  String instructor;
  int rating;
  int totalNumberRating;
  int numberOfEnrollment;
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
