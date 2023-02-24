import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';
import '../../consts/language.dart';
import '../../consts/styles.dart';

Widget custumTextFieldWidget(
    {String title = "", String hint = "", controller, onTap}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title.text.color(blackColor).fontFamily(bold).size(size16).make(),
      5.heightBox,
      TextField(
        controller: controller,
        textInputAction: TextInputAction.next, // klavyede enter tuşu
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: blackColor,
            fontFamily: regular,
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: lightGrey,
          isDense: true,
        ),
      ),
      10.heightBox,
    ],
  );
}

Widget passwordtextfield({
  String title = "",
  String hint = "",
  textInputAction,
  controller,
  onTap,
  isObsecure,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title.text.color(blackColor).fontFamily(bold).size(size16).make(),
      5.heightBox,
      TextField(
        controller: controller,
        textInputAction: textInputAction,
        obscureText: isObsecure.value,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: blackColor,
            fontFamily: regular,
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: lightGrey,
          isDense: true,
          suffixIcon: Obx(
            () => GestureDetector(
              onTap: () {
                isObsecure.value = !isObsecure.value;
              },
              child: Icon(
                isObsecure.value ? Icons.visibility : Icons.visibility_off,
                color: blackColor,
              ),
            ),
          ),
        ),
      ),
      10.heightBox,
    ],
  );
}
