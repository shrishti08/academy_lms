import 'package:academy_lms/Models/lessons.dart';

class Section {
  int id;
  int numberOfCompletedLessons;
  String title;
  String totalDuration;
  int lessonCounterStarts;
  int lessonCounterEnds;
  List<Lessons> mLesson;

  Section({
    required this.id,
    required this.numberOfCompletedLessons,
    required this.title,
    required this.totalDuration,
    required this.lessonCounterEnds,
    required this.lessonCounterStarts,
    required this.mLesson,
  });
}
