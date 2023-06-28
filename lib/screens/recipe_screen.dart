import 'package:flutter/material.dart';
import 'package:meal_app/constants.dart';
import 'package:meal_app/models/meals_data.dart';
import 'package:meal_app/models/provider_model.dart';
import 'package:provider/provider.dart';

import '../models/meal_object.dart';

class RecipeScreen extends StatelessWidget {
  static const routeName = 'RecipeScreen';
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments;
    Meal selectedMeal =
        Provider.of<MealData>(context).listOfMeals.firstWhere((meal) {
      return meal.id == mealId ? true : false;
    });
    Icon selectedIcon = const Icon(Icons.star_border_outlined);
    return Consumer<ProviderModel>(
      builder: (context,meal,child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: kDarkestColor,
            child: selectedMeal.isFavorite
                ? Icon(Icons.star)
                : Icon(Icons.star_border_outlined),
            onPressed: () {
             meal.toggleIcon(selectedMeal);
             meal.addToFavorites(selectedMeal);
              print('${selectedMeal.isFavorite}');
            },
          ),
          backgroundColor: kLightestColor,
          appBar: AppBar(
            title: Text(selectedMeal.title),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                  selectedMeal.imageUrl,
                  height: 230,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Ingredients',
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  alignment: Alignment.center,
                  height: 200,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.all(4),
                        padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        decoration: BoxDecoration(
                          color: kDarkColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(selectedMeal.ingredients[index]),
                      );
                    },
                    itemCount: selectedMeal.ingredients.length,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Text(
                  'Steps',
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleMedium,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  alignment: Alignment.center,
                  height: 200,
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.all(4),
                        padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                        decoration: BoxDecoration(
                          color: kDarkColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(selectedMeal.steps[index]),
                      );
                    },
                    itemCount: selectedMeal.steps.length,
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        );

      } );
  }
}
