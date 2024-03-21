import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String title;
  Color backgroundColor;
  String imagePath;

  CategoryModel(
      {required this.id,
      required this.title,
      required this.backgroundColor,
      required this.imagePath});

  static List<CategoryModel> getAllCategories() {
    return [
      CategoryModel(
          id: 'sports',
          title: 'Sports',
          backgroundColor: Color(0xFFC91C22),
          imagePath: 'assets/images/sports.png'),
      CategoryModel(
          id: 'general',
          title: 'General',
          backgroundColor: Color(0xFF003E90),
          imagePath: 'assets/images/Politics.png'),
      CategoryModel(
          id: 'health',
          title: 'Health',
          backgroundColor: Color(0xFFED1E79),
          imagePath: 'assets/images/health.png'),
      CategoryModel(
          id: 'business',
          title: 'Business',
          backgroundColor: Color(0xFFCF7E48),
          imagePath: 'assets/images/bussines.png'),
      CategoryModel(
          id: 'science',
          title: 'Science',
          backgroundColor: Color(0xFF4882CF),
          imagePath: 'assets/images/science.png'),
      CategoryModel(
          id: 'technology',
          title: 'Technology',
          backgroundColor: Color(0xFFF2D352),
          imagePath: 'assets/images/bussines.png'),
      CategoryModel(
          id: 'entertainment',
          title: 'Entertainment',
          backgroundColor: Color(0xFFCF7E48),
          imagePath: 'assets/images/environment.png'),
    ];
  }
}
