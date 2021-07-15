import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Category {
  final int id;
  final String title;
  final String thumbnail;
  final int numberOfCourses;

  Category({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.numberOfCourses,
  });
}

class Categories with ChangeNotifier {
  List<Category> _items = [];

  List<Category> get items {
    return [..._items];
  }

  Future<void> fetchCategories() async {
    final url =
        Uri.parse('https://academy-lms.gstempire.com/' + '/api/categories');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List;
      if (extractedData == null) {
        return;
      }
      // print(extractedData);
      final List<Category> loadedCategories = [];

      extractedData.forEach((catData) {
        loadedCategories.add(Category(
          id: int.parse(catData['id']),
          title: catData['name'],
          thumbnail: catData['thumbnail'],
          numberOfCourses: catData['number_of_courses'],
        ));

        // print(catData['name']);
      });
      _items = loadedCategories;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
