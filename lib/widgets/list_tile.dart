import 'package:flutter/material.dart';

Widget buildListTile(ctx, icon, title, goToAnotherScreen) {
  return ListTile(
    leading: Icon(icon),
    title: Text(
      title,
      style: Theme.of(ctx).textTheme.titleMedium,
    ),
    onTap: goToAnotherScreen,
  );
}