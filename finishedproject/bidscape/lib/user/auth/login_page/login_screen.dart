import 'dart:convert';
import 'package:bidscape/consts/consts.dart';
import 'package:bidscape/consts/language.dart';
import 'package:bidscape/widgets/common/applogo_widget.dart';

import '../../../apiconnection/api_connection.dart';
import '../../../fragments/dashborad_fragments.dart';
import '../../../model/user.dart';
import '../../userPreferences/user_preferences.dart';
import '../signup_page/signup_screen.dart';

import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isObsecure = true.obs;

  loginUserNow() async {
    try {
      var res = await http.post(
        Uri.parse(API.login),
        body: {
          "user_email": emailController.text.trim(),
          "user_password": passwordController.text.trim(),
        },
      );

      if (res.statusCode ==
          200) //from flutter app the connection with api to server - success
      {
        var resBodyOfLogin = jsonDecode(res.body);
        if (resBodyOfLogin['success'] == true) {
          Get.snackbar(
            "BAŞARILI",
            "Hoşgeliniz ${resBodyOfLogin["userData"]["user_name"]}",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: greenColor,
            colorText: whiteColor,
          );

          User userInfo = User.fromJson(resBodyOfLogin["userData"]);

          //save userInfo to local Storage using Shared Prefrences
          // sharedprefferance
          await RememberUserPrefs.storeUserInfo(userInfo);

          Future.delayed(Duration(milliseconds: 2000), () {
            Get.offAll(() => DashboardFragments());
          });
        } else {
          Get.snackbar(
            "HATA",
            "Kullanıcı adı veya şifre hatalı",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: redColor,
            colorText: whiteColor,
          );
        }
      } else //from flutter app the connection with api to server - failed
      {
        Get.snackbar(
          "HATA",
          "kullanıcı bulunamadı kayıt olmak ister misiniz?",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: redColor,
          colorText: whiteColor,
        );
      }
    } catch (errorMsg) {
      Get.snackbar(
        "HATA",
        "bir sorun oluştu tekrar dene",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: redColor,
        colorText: whiteColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
              child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              10.heightBox,
              welcome.text.fontFamily(bold).color(appcolor).size(size16).make(),
              10.heightBox,
              loginPageHeader.text.fontFamily(bold).black.size(size18).make(),
              20.heightBox,
              Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        custumTextFieldWidget(
                          controller: emailController,
                          title: email,
                          hint: emailHint,
                        ),
                        Obx(
                          () => passwordtextfield(
                            controller: passwordController,
                            title: password,
                            hint: passwordHint,
                            isObsecure: isObsecure,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: forgetPass.text.black.make())),
                  5.heightBox,
                  // login button
                  ourButton(
                          title: loginButton,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              loginUserNow();
                            } else {
                              Get.snackbar(
                                "HATA",
                                "Kullanıcı adı veya şifre hatalı",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: redColor,
                                colorText: whiteColor,
                              );
                            }
                          },
                          textColor: blackColor,
                          color: appcolor)
                      .box
                      .width(context.screenWidth - 50)
                      .make(),
                  10.heightBox,
                  createNewAccount.text.black.make(),
                  10.heightBox,
                  ourButton(
                          title: signupButton,
                          onPressed: () {
                            Get.to(() => const SignupScreen());
                          },
                          textColor: blackColor,
                          color: appcolor)
                      .box
                      .width(context.screenWidth - 50)
                      .make(),
                  5.heightBox,
                  
                  5.heightBox,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.end,
                  //       children: List.generate(
                  //         socialIconList.length,
                  //         (index) => CircleAvatar(
                  //           backgroundColor: lightGrey,
                  //           radius: 25,
                  //           child: Image.asset(
                  //             socialIconList[index],
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     googleWith.text.make(),
                  //   ],
                  // )
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16.0))
                  .width(context.screenWidth - 60)
                  .make(),
            ],
          ))),
    );
  }
}
