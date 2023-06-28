import 'package:flutter/material.dart';

import '../constants.dart';
import './list_tile.dart';


Widget buildMyDrawer(ctx){
  return Drawer(
    backgroundColor: kLightestColor,
    elevation: 2,
    child: ListView(
      children: [
        const DrawerHeader(
            decoration: BoxDecoration(color: kDarkColor),
            child: Text(
              'Cooking Up!',
              style: TextStyle(fontSize: 34, color: kDarkestColor,fontWeight: FontWeight.bold),
            )),
        buildListTile(ctx, Icons.no_meals, 'Meals',
                () => Navigator.popAndPushNamed(ctx, '/')),
        buildListTile(ctx, Icons.settings, 'Filters',
                () => Navigator.popAndPushNamed(ctx, 'filtersScreen')),
      ],
    ),
  );
}