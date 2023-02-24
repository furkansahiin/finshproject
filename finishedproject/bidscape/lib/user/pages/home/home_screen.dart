
import 'package:bidscape/consts/language.dart';

import '../../../consts/consts.dart';
import '../../../widgets/common/search_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            SearchWidget(),
            15.heightBox,
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Home Screen",
                        style: TextStyle(
                          color: appcolor,
                          fontSize: size18,
                          fontFamily: bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _gridallcafes extends StatelessWidget {
//   const _gridallcafes({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: categorylist.length % 7 != 0
//           ? GridView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: categorylist.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 1,
//                 mainAxisSpacing: 5,
//                 mainAxisExtent: 120,
//               ),
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
                  
//                   },
//                   child: Row(
//                     children: [
//                       Image.asset(
//                         categorylist[index],
//                         width: 100,
//                         fit: BoxFit.cover,
//                       ).box.rounded.make(),
//                       10.widthBox,
//                       Expanded(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Expanded(
//                                 child: "Mekan adı $index".text.size(10).make()),
//                             2.heightBox,
//                             Expanded(child: "adress".text.size(10).make()),
//                             2.heightBox,
//                             Expanded(child: "5.0".text.size(10).make()),
//                           ],
//                         ),
//                       )
//                     ],
//                   )
//                       .box
//                       .gray400
//                       .margin(marginhorizontal)
//                       .rounded
//                       .padding(padding8all)
//                       .make(),
//                 );
//               })
//           : Card(
//               child: Text("No data"),
//             ),
//     );
//   }
// }
