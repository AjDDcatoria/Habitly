import 'package:flutter/material.dart';
import 'package:habitly/src/constants/sizes.dart';

Column labelInput(BuildContext context, String label, TextField input) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: AppSizes.defaultBtwItems,
    children: <Widget>[
      Text(label, style: Theme.of(context).textTheme.bodyLarge),
      input,
    ],
  );
}
