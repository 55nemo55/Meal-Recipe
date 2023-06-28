import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../models/provider_model.dart';
import '../widgets/drawer.dart';

import './categories_screen.dart';
import './favorites_screen.dart';


class BottomTabbarScreen extends StatelessWidget {
  static const routeName='/';
   BottomTabbarScreen({Key? key}) : super(key: key);

List<Widget>pages=[
  const Categories(),
  const FavoritesScreen()
  ];

  @override
  Widget build(BuildContext context) {
    int index=Provider.of<ProviderModel>(context).selectedPageIndex;
    return Scaffold(
      appBar: AppBar(
        title: index==0? const Text('Categories'):const Text('Favorites'),
      ),
      drawer: buildMyDrawer(context),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: Provider.of<ProviderModel>(context).changeIndex ,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Colors.white,
        unselectedItemColor: kDarkest2Color,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: 'Favorites')
        ],
      ),
    );
  }
}
