import '../../consts/consts.dart';

Widget applogoWidget() {
  return Image.asset(icLogo)
      .box
      .white
      .size(77, 77)
      .padding(const EdgeInsets.all(10.0))
      .rounded
      .make();
}
