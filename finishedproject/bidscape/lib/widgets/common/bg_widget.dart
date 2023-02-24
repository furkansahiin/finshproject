import 'package:flutter/material.dart';
import '../../consts/images.dart';

Widget bgWidget({Widget? child}) {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(bgImage),
        fit: BoxFit.fill,
      ),
    ),
    child: child,
  );
}
