import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'dart:async';

import 'Languages/arabic.dart';
import 'Languages/english.dart';
import 'Languages/french.dart';
import 'Languages/indonesian.dart';
import 'Languages/italian.dart';
import 'Languages/portuguese.dart';
import 'Languages/spanish.dart';
import 'Languages/swahili.dart';
import 'Languages/turkish.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': english(),
    'ar': arabic(),
    'pt': portuguese(),
    'fr': french(),
    'id': indonesian(),
    'es': spanish(),
    'tr': turkish(),
    'it': italian(),
    'sw': swahili()
  };

  // String? get signInWithFacebook {
  //   return _localizedValues[locale.languageCode]!['signInWithFacebook'];
  // }

  String? get signInWithEmail {
    return _localizedValues[locale.languageCode]!['signInWithEmail'];
  }

  String? get orSignInWith {
    return _localizedValues[locale.languageCode]!['orSignInWith'];
  }

  String? get emailAddress {
    return _localizedValues[locale.languageCode]!['emailAddress'];
  }

  String? get phoneNumber {
    return _localizedValues[locale.languageCode]!['phoneNumber'];
  }

  String? get password {
    return _localizedValues[locale.languageCode]!['password'];
  }

  String? get forgot {
    return _localizedValues[locale.languageCode]!['forgot'];
  }

  String? get signIn {
    return _localizedValues[locale.languageCode]!['signIn'];
  }

  String? get notRegisteredYet {
    return _localizedValues[locale.languageCode]!['notRegisteredYet'];
  }

  String? get signUpNow {
    return _localizedValues[locale.languageCode]!['signUpNow'];
  }

  String? get signUpWithEmail {
    return _localizedValues[locale.languageCode]!['signUpWithEmail'];
  }

  String? get fullName {
    return _localizedValues[locale.languageCode]!['fullName'];
  }

  String? get createPassword {
    return _localizedValues[locale.languageCode]!['createPassword'];
  }

  String? get confirmPassword {
    return _localizedValues[locale.languageCode]!['confirmPassword'];
  }

  String? get signUp {
    return _localizedValues[locale.languageCode]!['signUp'];
  }

  String? get alreadyRegistered {
    return _localizedValues[locale.languageCode]!['alreadyRegistered'];
  }

  String? get signInNow {
    return _localizedValues[locale.languageCode]!['signInNow'];
  }

  String? get home {
    return _localizedValues[locale.languageCode]!['home'];
  }

  String? get ongoingCourses {
    return _localizedValues[locale.languageCode]!['ongoingCourses'];
  }

  String? get bookmarked {
    return _localizedValues[locale.languageCode]!['bookmarked'];
  }

  String? get support {
    return _localizedValues[locale.languageCode]!['support'];
  }

  String? get shareApp {
    return _localizedValues[locale.languageCode]!['shareApp'];
  }

  String? get logout {
    return _localizedValues[locale.languageCode]!['logout'];
  }

  String? get changeLanguage {
    return _localizedValues[locale.languageCode]!['changeLanguage'];
  }

  String? get viewProfile {
    return _localizedValues[locale.languageCode]!['viewProfile'];
  }

  String? get followUs {
    return _localizedValues[locale.languageCode]!['followUs'];
  }

  String? get courses {
    return _localizedValues[locale.languageCode]!['courses'];
  }

  String? get viewAll {
    return _localizedValues[locale.languageCode]!['viewAll'];
  }

  String? get learnFromBasics {
    return _localizedValues[locale.languageCode]!['learnFromBasics'];
  }

  String? get fullUIUXDesigns {
    return _localizedValues[locale.languageCode]!['fullUIUXDesigns'];
  }

  String? get knowMore {
    return _localizedValues[locale.languageCode]!['knowMore'];
  }

  String? get searchForCourseTopic {
    return _localizedValues[locale.languageCode]!['searchForCourseTopic'];
  }

  String? get uxDesignDescription {
    return _localizedValues[locale.languageCode]!['UXDesignDescription'];
  }

  String? get complete {
    return _localizedValues[locale.languageCode]!['complete'];
  }

  String? get topCategories {
    return _localizedValues[locale.languageCode]!['topCategories'];
  }

  String? get recentSearches {
    return _localizedValues[locale.languageCode]!['recentSearches'];
  }

  String? get selectSubcategories {
    return _localizedValues[locale.languageCode]!['selectSubcategories'];
  }

  String? get englishh {
    return _localizedValues[locale.languageCode]!['englishh'];
  }

  String? get arabicc {
    return _localizedValues[locale.languageCode]!['arabicc'];
  }

  String? get frenchh {
    return _localizedValues[locale.languageCode]!['frenchh'];
  }

  String? get portuguesee {
    return _localizedValues[locale.languageCode]!['portuguesee'];
  }

  String? get indonesiann {
    return _localizedValues[locale.languageCode]!['indonesiann'];
  }

  String? get spanishh {
    return _localizedValues[locale.languageCode]!['spanishh'];
  }

  String? get turkishh {
    return _localizedValues[locale.languageCode]!['turkishh'];
  }

  String? get italiann {
    return _localizedValues[locale.languageCode]!['italiann'];
  }

  String? get swahilii {
    return _localizedValues[locale.languageCode]!['swahilii'];
  }

  String? get selectYourLanguage {
    return _localizedValues[locale.languageCode]!['selectYourLanguage'];
  }

  String? get save {
    return _localizedValues[locale.languageCode]!['save'];
  }

  String? get userExperience {
    return _localizedValues[locale.languageCode]!['userExperience'];
  }

  String? get filters {
    return _localizedValues[locale.languageCode]!['filters'];
  }

  String? get reset {
    return _localizedValues[locale.languageCode]!['reset'];
  }

  String? get sortBy {
    return _localizedValues[locale.languageCode]!['sortBy'];
  }

  String? get ratings {
    return _localizedValues[locale.languageCode]!['ratings'];
  }

  String? get price {
    return _localizedValues[locale.languageCode]!['price'];
  }

  String? get recent {
    return _localizedValues[locale.languageCode]!['recent'];
  }

  String? get paid {
    return _localizedValues[locale.languageCode]!['paid'];
  }

  String? get free {
    return _localizedValues[locale.languageCode]!['free'];
  }

  String? get both {
    return _localizedValues[locale.languageCode]!['both'];
  }

  String? get levels {
    return _localizedValues[locale.languageCode]!['levels'];
  }

  String? get begginer {
    return _localizedValues[locale.languageCode]!['begginer'];
  }

  String? get intermediate {
    return _localizedValues[locale.languageCode]!['intermediate'];
  }

  String? get advanced {
    return _localizedValues[locale.languageCode]!['advanced'];
  }

  String? get applyFilters {
    return _localizedValues[locale.languageCode]!['applyFilters'];
  }

  String? get about {
    return _localizedValues[locale.languageCode]!['about'];
  }

  String? get videos {
    return _localizedValues[locale.languageCode]!['videos'];
  }

  String? get reviews {
    return _localizedValues[locale.languageCode]!['reviews'];
  }

  String? get lifetimeSubscription {
    return _localizedValues[locale.languageCode]!['lifetimeSubscription'];
  }

  String? get subscribe {
    return _localizedValues[locale.languageCode]!['subscribe'];
  }

  String? get courseBrief {
    return _localizedValues[locale.languageCode]!['courseBrief'];
  }

  String? get totalTimings {
    return _localizedValues[locale.languageCode]!['totalTimings'];
  }

  String? get hours {
    return _localizedValues[locale.languageCode]!['hours'];
  }

  String? get totalVideos {
    return _localizedValues[locale.languageCode]!['totalVideos'];
  }

  String? get lectures {
    return _localizedValues[locale.languageCode]!['lectures'];
  }

  String? get accessibility {
    return _localizedValues[locale.languageCode]!['accessibility'];
  }

  String? get lifetime {
    return _localizedValues[locale.languageCode]!['lifetime'];
  }

  String? get courseUploaded {
    return _localizedValues[locale.languageCode]!['courseUploaded'];
  }

  String? get description {
    return _localizedValues[locale.languageCode]!['description'];
  }

  String? get createdBy {
    return _localizedValues[locale.languageCode]!['createdBy'];
  }

  String? get averageRatings {
    return _localizedValues[locale.languageCode]!['averageRatings'];
  }

  String? get subscribed {
    return _localizedValues[locale.languageCode]!['subscribed'];
  }

  String? get questionOne {
    return _localizedValues[locale.languageCode]!['questionOne'];
  }

  String? get questionTwo {
    return _localizedValues[locale.languageCode]!['questionTwo'];
  }

  String? get questionThree {
    return _localizedValues[locale.languageCode]!['questionThree'];
  }

  String? get questionFour {
    return _localizedValues[locale.languageCode]!['questionFour'];
  }

  String? get questionFive {
    return _localizedValues[locale.languageCode]!['questionFive'];
  }

  String? get introductionToUserInterface {
    return _localizedValues[locale.languageCode]![
        'introductionToUserInterface'];
  }

  String? get overallRatings {
    return _localizedValues[locale.languageCode]!['overallRatings'];
  }

  String? get studentFeedbacks {
    return _localizedValues[locale.languageCode]!['studentFeedbacks'];
  }

  String? get star {
    return _localizedValues[locale.languageCode]!['star'];
  }

  String? get more {
    return _localizedValues[locale.languageCode]!['more'];
  }

  String? get total {
    return _localizedValues[locale.languageCode]!['total'];
  }

  String? get questions {
    return _localizedValues[locale.languageCode]!['questions'];
  }

  String? get allLectures {
    return _localizedValues[locale.languageCode]!['allLectures'];
  }

  String? get lecture {
    return _localizedValues[locale.languageCode]!['lecture'];
  }

  String? get lectureDescription {
    return _localizedValues[locale.languageCode]!['lectureDescription'];
  }

  String? get read {
    return _localizedValues[locale.languageCode]!['read'];
  }

  String? get replies {
    return _localizedValues[locale.languageCode]!['replies'];
  }

  String? get courseDescription {
    return _localizedValues[locale.languageCode]!['courseDescription'];
  }

  String? get shareThisCourse {
    return _localizedValues[locale.languageCode]!['shareThisCourse'];
  }

  String? get addToBookmark {
    return _localizedValues[locale.languageCode]!['addToBookmark'];
  }

  String? get reviewThisCourse {
    return _localizedValues[locale.languageCode]!['reviewThisCourse'];
  }

  String? get viewSimilarCourses {
    return _localizedValues[locale.languageCode]!['viewSimilarCourses'];
  }

  String? get notificationOne {
    return _localizedValues[locale.languageCode]!['notificationOne'];
  }

  String? get notificationTwo {
    return _localizedValues[locale.languageCode]!['notificationTwo'];
  }

  String? get notificationThree {
    return _localizedValues[locale.languageCode]!['notificationThree'];
  }

  String? get notifications {
    return _localizedValues[locale.languageCode]!['notifications'];
  }

  String? get needHelp {
    return _localizedValues[locale.languageCode]!['needHelp'];
  }

  String? get connectUs {
    return _localizedValues[locale.languageCode]!['connectUs'];
  }

  String? get writeUsDirectly {
    return _localizedValues[locale.languageCode]!['writeUsDirectly'];
  }

  String? get yourMessage {
    return _localizedValues[locale.languageCode]!['yourMessage'];
  }

  String? get submit {
    return _localizedValues[locale.languageCode]!['submit'];
  }

  String? get foodPhotographyCourses {
    return _localizedValues[locale.languageCode]!['foodPhotographyCourses'];
  }

  String? get designingCourses {
    return _localizedValues[locale.languageCode]!['designingCourses'];
  }

  String? get howToCreateMockUp {
    return _localizedValues[locale.languageCode]!['howToCreateMockUp'];
  }

  String? get profile {
    return _localizedValues[locale.languageCode]!['profile'];
  }

  String? get contactNumber {
    return _localizedValues[locale.languageCode]!['contactNumber'];
  }

  String? get dateOfBirth {
    return _localizedValues[locale.languageCode]!['dateOfBirth'];
  }

  String? get updateProfile {
    return _localizedValues[locale.languageCode]!['updateProfile'];
  }

  String? get socialLinks {
    return _localizedValues[locale.languageCode]!['socialLinks'];
  }

  String? get design {
    return _localizedValues[locale.languageCode]!['design'];
  }

  String? get business {
    return _localizedValues[locale.languageCode]!['business'];
  }

  String? get development {
    return _localizedValues[locale.languageCode]!['development'];
  }

  String? get photography {
    return _localizedValues[locale.languageCode]!['photography'];
  }

  String? get fitness {
    return _localizedValues[locale.languageCode]!['fitness'];
  }

  String? get music {
    return _localizedValues[locale.languageCode]!['music'];
  }

  String? get architecture {
    return _localizedValues[locale.languageCode]!['architecture'];
  }

  String? get artHistory {
    return _localizedValues[locale.languageCode]!['artHistory'];
  }

  String? get fashionDesign {
    return _localizedValues[locale.languageCode]!['fashionDesign'];
  }

  String? get filmPhotography {
    return _localizedValues[locale.languageCode]!['filmPhotography'];
  }

  String? get graphicDesign {
    return _localizedValues[locale.languageCode]!['graphicDesign'];
  }

  String? get industrialDesign {
    return _localizedValues[locale.languageCode]!['industrialDesign'];
  }

  String? get interiorDesign {
    return _localizedValues[locale.languageCode]!['interiorDesign'];
  }

  String? get searchOne {
    return _localizedValues[locale.languageCode]!['searchOne'];
  }

  String? get searchTwo {
    return _localizedValues[locale.languageCode]!['searchTwo'];
  }

  String? get searchThree {
    return _localizedValues[locale.languageCode]!['searchThree'];
  }

  String? get searchFour {
    return _localizedValues[locale.languageCode]!['searchFour'];
  }

  String? get searchFive {
    return _localizedValues[locale.languageCode]!['searchFive'];
  }

  String? get searchSix {
    return _localizedValues[locale.languageCode]!['searchSix'];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
        'ar',
        'id',
        'pt',
        'fr',
        'es',
        'tr',
        'it',
        'sw',
      ].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of AppLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
