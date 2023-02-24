import 'dart:convert';
import 'package:bidscape/user/auth/login_page/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../apiconnection/api_connection.dart';
import 'package:http/http.dart' as http;

import '../../../consts/consts.dart';
import '../../../consts/language.dart';
import '../../../widgets/common/applogo_widget.dart';


class ProfileFragmentsScreen extends StatelessWidget {
  const ProfileFragmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Profile Fragments Screen",
            style: TextStyle(
              color: appcolor,
              fontSize: size18,
              fontFamily: bold,
            ),
          ),
        ),
      ),
    );
  }
}
