import 'package:bidscape/consts/consts.dart';

import '../../consts/language.dart';
import '../../fragments/dashborad_fragments.dart';
import '../../user/auth/login_page/login_screen.dart';
import '../../widgets/common/applogo_widget.dart';


class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  changeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      Get.to(() => DashboardFragments());
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Image.asset(icLogo, width: 300),
            // ),
            Expanded(flex: 1, child: Container()),
            applogoWidget(),
            SizedBox(height: 20),
            appname.text.fontFamily(bold).size(22).white.make(),
            SizedBox(height: 20),
            appversiyon.text.white.make(),
            Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
