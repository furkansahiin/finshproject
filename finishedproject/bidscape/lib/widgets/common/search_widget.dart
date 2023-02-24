import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';
import '../../consts/language.dart';
import '../../consts/styles.dart';

Widget SearchWidget() {
  return Container(
    alignment: Alignment.center,
    height: containerheight60, // çünkü sonraki gelen widget alta gelsin

    child: TextFormField(
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.search),
        focusedBorder: InputBorder.none,
        focusColor: appcolor,
        hintText: searchHint,
        filled: true,
        fillColor: whiteColor,
        hintStyle: TextStyle(color: textfieldGrey),
        // prefixIcon: Icon(Icons.search), başa alır
        border: InputBorder.none,
      ),
    ),
  );
}

Widget titleNameAlign({String? title}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: title?.text.color(Colors.black).fontFamily(bold).size(size18).make(),
  );
}
