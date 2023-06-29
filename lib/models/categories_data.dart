import 'package:flutter/material.dart';

import './category_object.dart';

class CategoryData extends ChangeNotifier {
  final List<Category> _Categories = [
    Category(
      id: 'c1',
      title: 'Italian',
      color: const Color(0xffFFF5DA),
    ),
    Category(
      id: 'c2',
      title: 'Quick & Easy',
      color: const Color(0xffFF9F9F),
    ),
    Category(
      id: 'c3',
      title: 'Hamburgers',
      color: const Color(0xffB2A4FF),
    ),
    Category(
      id: 'c4',
      title: 'German',
      color: const Color(0xffB5F1CC),
    ),
    Category(
      id: 'c5',
      title: 'Light & Lovely',
      color: const Color(0xffFFCEFE),
    ),
    Category(
      id: 'c6',
      title: 'Exotic',
      color: const Color(0xffFCFFA6),
    ),
    Category(
      id: 'c7',
      title: 'Breakfast',
      color: const Color(0xffAEE2FF),
    ),
    Category(
      id: 'c8',
      title: 'Asian',
      color: const Color(0xff95BDFF),
    ),
    Category(
      id: 'c9',
      title: 'French',
      color: const Color(0xffFF87CA),
    ),
    Category(
      id: 'c10',
      title: 'Summer',
      color: const Color(0xff5C8984),
    ),
  ];


  get dummyCategories => _Categories;
}
