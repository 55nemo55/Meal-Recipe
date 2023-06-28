import 'package:flutter/material.dart';

import 'meal_object.dart';

class ProviderModel extends ChangeNotifier {
  int selectedPageIndex = 0;
  bool switchGlutenFreeValue = false;
  bool switchLactoseFreeValue = false;
  bool switchVegetarianValue= false;
  bool switchVeganValue= false;
  List<Meal> favoritesList=[];
  Map<String,bool> filterData={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false
  };

  void changeIndex(int index) {
    selectedPageIndex = index;
    notifyListeners();
  }

  void toggleIcon(Meal meal) {
    meal.toggleIsFavorite();
    notifyListeners();
  }


  void addToFavorites(Meal meal){
    meal.isFavorite ? favoritesList.add(meal): favoritesList.remove(meal);
    notifyListeners();
  }

  void toggleGlutenFreeSwitch(bool value){
    switchGlutenFreeValue=value;
    filterData['gluten']=value;
    notifyListeners();
  }

  void toggleLactoseFreeSwitch(bool value){
    switchLactoseFreeValue=value;
    filterData['lactose']=value;
    notifyListeners();
  }

  void toggleVegetarianSwitch(bool value){
    switchVegetarianValue=value;
    filterData['vegetarian']=value;
    notifyListeners();
  }

  void toggleVeganSwitch(bool value){
    switchVeganValue=value;
    filterData['vegan']=value;
    notifyListeners();
  }

}
