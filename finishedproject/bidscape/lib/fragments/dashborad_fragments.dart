import 'package:bidscape/consts/consts.dart';

class DashboardFragments extends StatelessWidget {
  CurrentUser _rememberCurrentUser = Get.put(CurrentUser());

  List<Widget> _fragmentScreens = [
    HomeScreen(),
    FavoriteFragmentsScreen(),
    ProfileScreen(),
  ];

  List _navigationButton = [
    {
      "active_icon": Icons.home,
      "non_active_icon": Icons.home_outlined,
      "label": "Home",
    },
    {
      "active_icon": Icons.favorite_border,
      "non_active_icon": Icons.favorite_border,
      "label": "Favorite",
    },
    {
      "active_icon": Icons.person,
      "non_active_icon": Icons.person_outline,
      "label": "Profile",
    },
  ];

  RxInt _indexNumber = 0.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CurrentUser(),
        initState: (currentState) {
          _rememberCurrentUser.getUserInfo();
        },
        builder: (controller) {
          return Scaffold(
            backgroundColor: darkfontGrey,
            body: bgWidget(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Obx(
                  () => _fragmentScreens[_indexNumber.value],
                ),
              ),
            ),
            bottomNavigationBar: Obx(() => BottomNavigationBar(
                  backgroundColor: blackColor,
                  items: List.generate(_navigationButton.length, (index) {
                    return BottomNavigationBarItem(
                        backgroundColor: Colors.black,
                        icon: Icon(_navigationButton[index]["non_active_icon"]),
                        activeIcon:
                            Icon(_navigationButton[index]["active_icon"]),
                        label: _navigationButton[index]["label"]);
                  }),
                  currentIndex: _indexNumber.value,
                  onTap: (index) {
                    _indexNumber.value = index;
                  },
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  selectedItemColor: appcolor,
                  unselectedItemColor: whiteColor,
                )),
          );
        });
  }
}
