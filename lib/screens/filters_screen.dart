import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/drawer.dart';
import '../widgets/filterSwitch.dart';
import '../models/provider_model.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = 'filtersScreen';
  const FiltersScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        drawer: buildMyDrawer(context),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 45.0, horizontal: 65),
          child: Column(
            children: [
              buildFilterSwitch('GlutenFree', provider.switchGlutenFreeValue,
                  provider.toggleGlutenFreeSwitch),
              buildFilterSwitch('LactoseFree', provider.switchLactoseFreeValue,
                  provider.toggleLactoseFreeSwitch),
              buildFilterSwitch('Vegetarian', provider.switchVegetarianValue,
                  provider.toggleVegetarianSwitch),
              buildFilterSwitch('Vegan', provider.switchVeganValue,
                  provider.toggleVeganSwitch),
            ],
          ),
        ));
  }
}
