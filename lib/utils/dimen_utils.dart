import 'package:flutter/material.dart';

double getMainHorizontalPadding(BuildContext context) {
  if (MediaQuery.of(context).size.width > 1000) {
    return 150;
  } else if (MediaQuery.of(context).size.width > 500) {
    return 80;
  } else {
    return 32;
  }
}
