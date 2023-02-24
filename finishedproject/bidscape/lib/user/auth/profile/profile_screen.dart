import 'package:bidscape/consts/language.dart';
import 'package:bidscape/user/auth/profile/profile_edit.dart';
import 'package:bidscape/user/userPreferences/user_preferences.dart';

import '../../../consts/consts.dart';
import '../../userPreferences/current_user.dart';
import '../login_page/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  CurrentUser _rememberCurrentUser = Get.put(CurrentUser());

  signOutUser() async {
    var _result = await Get.dialog(
      AlertDialog(
        title: Text("Sign Out"),
        content: Text("Are you sure you want to sign out?"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("No"),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: true);
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );

    if (_result == true) {
      RememberUserPrefs.removeUserInfo().then((value) {
        Get.off(LoginScreen());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: bgWidget(
        child: Scaffold(
          body: SafeArea(
            child: Container(
              padding: padding8all,
              child: Column(
                children: [
                  // edit profile button
                  Align(
                      alignment: Alignment.topRight,
                      child: const Icon(
                        Icons.edit,
                        color: whiteColor,
                      ).pOnly(right: 8).onTap(() {
                        Get.to(ProfileEditScreen());
                      })),
                  10.heightBox,
                  // profile area
                  Row(children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(icLogo),
                    ),
                    10.widthBox,
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _rememberCurrentUser.user.user_name.text
                                .fontFamily(semibold)
                                .white
                                .make(),
                            5.heightBox,
                            _rememberCurrentUser.user.user_email.text
                                .fontFamily(semibold)
                                .white
                                .make(),
                          ]),
                    ),
                    // Logout button
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: whiteColor),
                        ),
                        onPressed: () {
                          signOutUser();
                        },
                        child:
                            logoutButton.text.fontFamily(semibold).black.make())
                  ]),

                  // buttons section
                  40.heightBox,
                  ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Icon(
                          profileButtonsIcon[index],
                          color: appcolor,
                        ),
                        title: profileButtons[index].text.make(),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: whiteColor,
                      );
                    },
                    itemCount: profileButtons.length,
                  )
                      .box
                      .white
                      .rounded
                      .padding(EdgeInsets.symmetric(horizontal: 16))
                      .make()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
