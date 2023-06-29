
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/categories_data.dart';
import '../models/category_object.dart';
import './meals_screen.dart';


class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 1.40),
      itemBuilder: (BuildContext context, int index) {
        Category selectedCategory=Provider.of<CategoryData>(context).dummyCategories[index];
        return InkWell(
          borderRadius: BorderRadius.circular(18),
          splashColor: selectedCategory.color,
          onTap: (){
            Navigator.pushNamed(context, MealsScreen.routeName,arguments: index);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            elevation: 6,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    selectedCategory.color,
                    selectedCategory.color.withOpacity(0.3),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(15),
              child: Text(
                selectedCategory.title,
                style: Theme.of(context).textTheme.titleLarge,
                softWrap: true,
              ),
            ),
          ),
        );
      },
      itemCount: Provider.of<CategoryData>(context).dummyCategories.length,
    );
  }
}
