import 'package:flutter/material.dart';
import 'package:meal_app/models/provider_model.dart';
import 'package:provider/provider.dart';

import './screens/bottom_tabbar_screen.dart';
import './screens/favorites_screen.dart';
import './screens/filters_screen.dart';
import './screens/meals_screen.dart';
import './screens/recipe_screen.dart';
import '../models/meals_data.dart';
import '../models/categories_data.dart';
import 'constants.dart';


void main() {
  runApp(const MealApp());
}

class MealApp extends StatelessWidget {
  const MealApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create:(_)=> MealData(),
        ),
        ChangeNotifierProvider(
            create: (_)=> CategoryData(),),
        ChangeNotifierProvider(
          create: (_)=> ProviderModel(),)
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily:'Raleway',
                  fontSize: 20,
              fontWeight: FontWeight.w400
            )
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontFamily: 'Dancing',
              fontSize: 23,
              fontWeight: FontWeight.w500
            ),
            titleMedium: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: TextStyle(
              fontFamily: 'Raleway',
                  fontSize:22,
              fontWeight: FontWeight.w400
            ),
            bodyMedium: TextStyle(
                fontFamily:'Raleway',
                fontSize: 16,
                fontWeight: FontWeight.w400
            )
          ),
          scaffoldBackgroundColor: kLightestColor,
          colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: kDarkestColor,
            secondary: kLightColor,
          )
        ),
        initialRoute: BottomTabbarScreen.routeName,
        routes: {
          BottomTabbarScreen.routeName: (context)=>BottomTabbarScreen(),
          FavoritesScreen.routeName:(context)=>const FavoritesScreen(),
          FiltersScreen.routeName:(context)=> const FiltersScreen(),
          MealsScreen.routeName:(context)=> const MealsScreen(),
          RecipeScreen.routeName: (context)=> const RecipeScreen()
        },
      ),
    );
  }
}
