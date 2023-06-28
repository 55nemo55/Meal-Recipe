

import 'package:flutter/material.dart';
import 'package:meal_app/models/categories_data.dart';
import 'package:meal_app/models/meals_data.dart';
import 'package:meal_app/models/provider_model.dart';
import 'package:meal_app/screens/recipe_screen.dart';
import 'package:meal_app/widgets/drawer.dart';
import 'package:provider/provider.dart';

import '../models/meal_object.dart';

class MealsScreen extends StatelessWidget {
  static const routeName = 'mealsScreen';

  const MealsScreen({super.key});



  @override
  Widget build(BuildContext context) {

    var mealProvider=Provider.of<MealData>(context);
    var provider=Provider.of<ProviderModel>(context);



    List<Meal> availableMealsList = mealProvider.listOfMeals.where((meal){
      if(provider.filterData['vegan']! && !meal.isVegan){
        return false;
      }else if(provider.filterData['gluten']! && !meal.isGlutenFree){
        return false;
      }else if(provider.filterData['vegetarian']! && !meal.isVegetarian){
        return false;
      }else if(provider.filterData['lactose']! && !meal.isLactoseFree){
        return false;
      }else{
        return true;
      }
    }).toList();


    final routeArg = ModalRoute.of(context)?.settings.arguments;

    final categoryId =
        Provider.of<CategoryData>(context).dummyCategories[routeArg].id;

    final List<Meal> categoryMeals =
    availableMealsList.where((meal) {
      return meal.categories.contains(categoryId) ? true : false;
    }).toList();





    return Scaffold(
      appBar: AppBar(
        title:
            Text(context.read<CategoryData>().dummyCategories[routeArg].title),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, index) {
          return InkWell(
            onTap: (){
               Navigator.pushNamed(context, RecipeScreen.routeName,arguments: categoryMeals[index].id);},
            child: Card(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              margin:
                  const EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 10),
              elevation: 6,
              child: Column(
                children: [
                  Stack(alignment: Alignment.bottomRight, children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14),
                      ),
                      child: Image.network(
                        categoryMeals[index].imageUrl,
                        fit: BoxFit.cover,
                        height: 250,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black45.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                          )),
                      width: 300,
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        categoryMeals[index].title,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.white70,
                              overflow: TextOverflow.fade,
                            ),
                        softWrap: true,
                      ),
                    )
                  ]),
                  SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.access_time),
                            const SizedBox(
                              width: 5,
                            ),
                            Text('${categoryMeals[index].duration} min')
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.shopping_bag_outlined),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(categoryMeals[index].complexityText)
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.attach_money),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(categoryMeals[index].affordabilityText)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
