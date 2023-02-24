import 'package:bidscape/consts/consts.dart';
import 'package:bidscape/fragments/dashborad_fragments.dart';
import 'package:bidscape/main.dart';

import 'consts/language.dart';
import 'pages/splash_page/splash_screen.dart';

export 'package:flutter/material.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        // fontFamily: regular,
      ),
      home:  splashScreen(),
      // FutureBuilder(
      //   future: RememberUserPrefs.readUserInfo(),
      //   builder: (context, dataSnapShot) {
      //     if (dataSnapShot.data == null) {
      //       return splashScreen(); 
      //       // return adminPanelScreen();
      //     } else {
      //       // return DashboardFragments();
      //     }
      //   },
      // ),
    );
  }
}
