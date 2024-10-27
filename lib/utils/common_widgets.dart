import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showSnackBar(String title, BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(title)),
  );
}
