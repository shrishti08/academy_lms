import 'package:academy_lms/Auth/SignIn/sign_in.dart';
import 'package:academy_lms/Auth/SignUp/sign_up.dart';
import 'package:academy_lms/Home/home.dart';
import 'package:academy_lms/Locale/change_language.dart';
import 'package:academy_lms/Others/ongoing_courses.dart';
import 'package:academy_lms/Others/support.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  static const String signIn = 'signIn';
  static const String signUp = 'sign_up';
  static const String home = 'home';
  static const String search = 'search';
  static const String categoryPage = 'category_page';
  static const String userExperience = 'userExperience';
  static const String bookmarked = 'bookmarked';
  static const String notifications = 'notifications';
  static const String profile = 'profile';
  static const String support = 'support';
  static const String ongoingCourses = 'ongoingCourses';
  static const String courseInfo = 'courseInfo';
  static const String lecturerProfile = 'lecturerProfile';
  static const String lecturerInfo = 'lecturerInfo';
  static const String changeLanguage = 'changeLanguage';

  Map<String, WidgetBuilder> routes() {
    return {
      signIn: (context) => SignInPage(),
      signUp: (context) => SignUpUI(),
      home: (context) => HomePage(),
      // search: (context) => SearchPage(),
      // categoryPage: (context) => CategoryPage(),
      // userExperience: (context) => UserExperiencePage(),
      // bookmarked: (context) => Bookmarked(),
      // notifications: (context) => Notifications(),
      // profile: (context) => Profile(),
      support: (context) => Support(),
      ongoingCourses: (context) => OngoingCourses(),
      // courseInfo: (context) => CourseInfo(),
      // lecturerProfile: (context) => LecturerProfile(),
      // lecturerInfo: (context) => LectureInfo(),
      changeLanguage: (context) => SelectLanguage(),
    };
  }
}
