import 'dart:convert';

import 'package:bidscape/consts/language.dart';

import '../../../apiconnection/api_connection.dart';
import '../../../consts/consts.dart';
import 'package:http/http.dart' as http;

import '../../../model/user.dart';
import '../../../widgets/common/applogo_widget.dart';
import '../login_page/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var isObsecure = true.obs;
  var isObsecureconfirm = true.obs;
  bool? isCheck = false;

  final formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();

  validateUserEmail() async {
    try {
      var res = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'user_email': _emailController.text.trim(),
        },
      );

      if (res.statusCode == 200) {
        var resBodyOfValidateEmail = jsonDecode(res.body);

        if (resBodyOfValidateEmail["emailfound"] == true) {
          Get.snackbar(
            "HATA",
            "KUllanıcı zaten var",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: redColor,
            colorText: whiteColor,
          );
        } else {
          //save database
          saveNewUser();
        }
      }
      else {
        Get.snackbar(
          "HATA",
          "Status Code: ${res.statusCode}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: redColor,
          colorText: whiteColor,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Bize Ulaşınız",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: redColor,
        colorText: whiteColor,
      );
    }
  }

  saveNewUser() async {
    User userModel = User(
      1,
      _nameController.text.trim(),
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    try {
      var res = await http.post(
        Uri.parse(API.signUp),
        body: userModel.toJson(),
      );

      if (res.statusCode == 200) {
        var resBodyOfSaveNewUser = jsonDecode(res.body);

        if (resBodyOfSaveNewUser["status"] == true) {
          Get.snackbar(
            "BAŞARILI",
            "Kullanıcı kayıt edildi",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: greenColor,
            colorText: whiteColor,
          );
          Future.delayed(Duration(milliseconds: 2000), () {
            Get.offAll(() => const LoginScreen());
          });
        } else {
          Get.snackbar(
            "HATA",
            "Kullanıcı kayıt edilemedi tekrar deneyiniz",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: redColor,
            colorText: whiteColor,
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        "title",
        e.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Center(
                child: Column(
              children: [
                (context.screenHeight * 0.05).heightBox,
                applogoWidget(),
                10.heightBox,
                welcome.text.fontFamily(bold).purple400.size(size16).make(),
                10.heightBox,
                signupHeader.text.fontFamily(bold).white.size(size18).make(),
                20.heightBox,
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      custumTextFieldWidget(
                        title: name,
                        hint: nameHint,
                        controller: _nameController,
                      ),
                      custumTextFieldWidget(
                        title: email,
                        hint: emailHint,
                        controller: _emailController,
                      ),
                      Obx(
                        () => passwordtextfield(
                          title: password,
                          hint: passwordHint,
                          isObsecure: isObsecure,
                          controller: _passwordController,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      Obx(
                        () => passwordtextfield(
                          title: confirmPass,
                          hint: confirmPassHint,
                          isObsecure: isObsecureconfirm,
                          controller: _confirmpasswordController,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                              activeColor: appcolor,
                              checkColor: whiteColor,
                              value: isCheck,
                              onChanged: (newValue) {
                                setState(() {
                                  isCheck = newValue;
                                });
                              }),
                          Expanded(
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: termAndCond,
                                    style: TextStyle(
                                        color: appcolor, fontFamily: regular)),
                                TextSpan(
                                    text: and,
                                    style: TextStyle(
                                        color: darkfontGrey,
                                        fontFamily: regular)),
                                TextSpan(
                                    text: privacyPolicyt,
                                    style: TextStyle(
                                        color: appcolor, fontFamily: regular)),
                                TextSpan(
                                    text: readAndAgree,
                                    style: TextStyle(
                                        color: darkfontGrey,
                                        fontFamily: regular)),
                              ]),
                            ),
                          ),
                        ],
                      ),
                      10.heightBox,
                      // signup button
                      ourButton(
                          color: isCheck == true ? appcolor : lightGrey,
                          title: signupButton,
                          textColor: whiteColor,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              if (_nameController.text.isEmpty ||
                                  _emailController.text.isEmpty ||
                                  _passwordController.text.isEmpty ||
                                  _confirmpasswordController.text.isEmpty) {
                                Get.snackbar(
                                  "HATA",
                                  "Lütfen tüm alanları doldurunuz",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: redColor,
                                  colorText: whiteColor,
                                );
                              } else if (isCheck == false) {
                                Get.snackbar(
                                  "HATA",
                                  "Lütfen şartları kabul ediniz",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: redColor,
                                  colorText: whiteColor,
                                );
                              } else {
                                if (_nameController.text.trim().length < 3) {
                                  Get.snackbar(
                                    "HATA",
                                    "Lütfen isminizi kontrol ediniz",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: redColor,
                                    colorText: whiteColor,
                                  );
                                } else if (_emailController.text.trim().length <
                                    3) {
                                  Get.snackbar(
                                    "HATA",
                                    "Lütfen emailinizi kontrol ediniz",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: redColor,
                                    colorText: whiteColor,
                                  );
                                } else if (_passwordController.text
                                        .trim()
                                        .length <
                                    3) {
                                  Get.snackbar(
                                    "HATA",
                                    "Lütfen şifrenizi kontrol ediniz",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: redColor,
                                    colorText: whiteColor,
                                  );
                                } else if (_passwordController.text !=
                                    _confirmpasswordController.text) {
                                  Get.snackbar(
                                    "HATA",
                                    "Şifreler uyuşmuyor",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: redColor,
                                    colorText: whiteColor,
                                  );
                                } else {
                                  validateUserEmail();
                                }
                              }
                            } else {
                              Get.snackbar(
                                "HATA",
                                "Bir sorun olşuştu tekrar deneyiniz",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: redColor,
                                colorText: whiteColor,
                              );
                            }
                          }).box.width(context.screenWidth - 50).make(),
                      10.heightBox,
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: haveAAccount,
                                style: TextStyle(
                                    color: darkfontGrey, fontFamily: regular)),
                            TextSpan(
                                text: loginButton,
                                style: TextStyle(
                                    color: appcolor, fontFamily: regular)),
                          ],
                        ),
                      ).onTap(() {
                        Get.back();
                      }),
                    ],
                  )
                      .box
                      .white
                      .rounded
                      .padding(EdgeInsets.all(16.0))
                      .margin(EdgeInsets.all(16.0))
                      .width(context.screenWidth - 60)
                      .make(),
                ),
              ],
            )),
          )),
    );
  }
}
