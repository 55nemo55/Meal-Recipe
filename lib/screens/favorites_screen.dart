import 'package:flutter/material.dart';
import 'package:meal_app/models/meals_data.dart';
import 'package:meal_app/models/provider_model.dart';
import 'package:meal_app/screens/recipe_screen.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = 'favoritesScreen';

  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MealData>(builder: (ctx, meal, child) {
      return Scaffold(
        body: Center(
          child: context.read<ProviderModel>().favoritesList.isEmpty
              ? const Text('You don\'t have a favorite meal yet!')
              : ListView.builder(
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RecipeScreen.routeName,
                            arguments: context
                                .read<ProviderModel>()
                                .favoritesList[index]
                                .id);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        margin: const EdgeInsets.only(
                            left: 10, top: 15, right: 10, bottom: 10),
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
                                  context
                                      .read<ProviderModel>()
                                      .favoritesList[index]
                                      .imageUrl,
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
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20),
                                margin: const EdgeInsets.only(bottom: 15),
                                child: Text(
                                  context
                                      .read<ProviderModel>()
                                      .favoritesList[index]
                                      .title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.access_time),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                          '${context.read<ProviderModel>().favoritesList[index].duration} min')
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.shopping_bag_outlined),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(context
                                          .read<ProviderModel>()
                                          .favoritesList[index]
                                          .complexityText)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.attach_money),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(context
                                          .read<ProviderModel>()
                                          .favoritesList[index]
                                          .affordabilityText)
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
                  itemCount: context.read<ProviderModel>().favoritesList.length,
                ),
        ),
      );
    });
  }
}
