import 'package:flutter/material.dart';
import 'package:meal_app/constants.dart';
import 'package:provider/provider.dart';

import '../models/provider_model.dart';

Widget BuildFilterSwitch(filterName,value,filterProviderFunction) {
  return Consumer<ProviderModel>(
    builder: (context, filter, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(filterName),
          Switch(
            activeColor: Theme.of(context).colorScheme.primary,
            activeTrackColor: kDarkColor,
            value: value,
            onChanged: (value) {
              filterProviderFunction(value);
            },
          )
        ],
      );
    },
  );
}
