import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/colors.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/custom_button.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';
import 'package:shoppos/routes/app_router.gr.dart';

class ProductsCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: "Coustumer Details",
                  scale: 1.3,
                  weight: FontWeight.bold,
                  color: Colors.black,
                ),
                TextButton.icon(
                  // <-- TextButton
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    size: SizeConfig.safeBlockHorizontal! * 5,
                    color: Theme.of(context).primaryColor,
                  ),
                  label: TextWidget(
                    text: "Add New Coustumer",
                    scale: SizeConfig.safeBlockHorizontal! * 0.27,
                    weight: FontWeight.w500,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 4,
            ),
            TextField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 3), borderSide: BorderSide.none),
                  hintText: 'Search Costumer',
                  hintStyle: TextStyle(color: iconColor, fontSize: SizeConfig.safeBlockHorizontal! * 4),
                  prefixIcon: SvgPicture.asset(search, color: iconColor, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown)),
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 6,
            ),
            Stack(
              children: [
                Container(
                  height: SizeConfig.screenHeight! * 0.1,
                  width: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(SizeConfig.safeBlockHorizontal! * 3)),
                      color: Colors.grey[200],
                      border: Border.all(color: Theme.of(context).primaryColor)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal! * 4,
                      ),
                      CircleAvatar(
                        radius: SizeConfig.safeBlockHorizontal! * 6,
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal! * 4,
                      ),
                      TextWidget(
                        text: "Jane Copper",
                        scale: 1.3,
                        weight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                Positioned(top: 0, right: 0, child: SvgPicture.asset(corner, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown))
              ],
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 6,
            ),
            TextField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 3), borderSide: BorderSide.none),
                  hintText: 'Search Products',
                  hintStyle: TextStyle(color: iconColor, fontSize: SizeConfig.safeBlockHorizontal! * 4),
                  prefixIcon: SvgPicture.asset(search, color: iconColor, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown)),
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 6,
            ),
            TextWidget(
              text: "Product Details",
              scale: 1.3,
              weight: FontWeight.bold,
              color: Colors.black,
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 4,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 2),
                        height: SizeConfig.screenHeight! * 0.2,
                        width: SizeConfig.screenWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(SizeConfig.safeBlockHorizontal! * 2)), color: Colors.grey[200]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: SizeConfig.screenWidth! * 0.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(SizeConfig.safeBlockHorizontal! * 2)), color: Colors.white),
                                child: Center(
                                  child: SvgPicture.asset(
                                    appLogo,
                                    color: iconColor,
                                    semanticsLabel: 'App Logo',
                                    fit: BoxFit.scaleDown,
                                    height: SizeConfig.safeBlockHorizontal! * 15,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(child: TextWidget(text: "Lorem ipsum dolor sit amet, co..", scale: 1.1)),
                                        Icon(Icons.close)
                                      ],
                                    ),
                                    SizedBox(
                                      height: SizeConfig.safeBlockHorizontal! * 4,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [TextWidget(text: "Size: 34", scale: 1.1), TextWidget(text: "color: Blue", scale: 1.1)],
                                    ),
                                    SizedBox(
                                      height: SizeConfig.safeBlockHorizontal! * 2,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            TextWidget(text: "Quantity", scale: 1.1),
                                            SizedBox(
                                              width: SizeConfig.safeBlockHorizontal! * 2,
                                            ),
                                            TextWidget(text: "-", scale: 1.2),
                                            SizedBox(
                                              width: SizeConfig.safeBlockHorizontal! * 2,
                                            ),
                                            Container(
                                              height: SizeConfig.screenHeight! * 0.03,
                                              width: SizeConfig.screenWidth! * 0.08,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(SizeConfig.safeBlockHorizontal! * 2)),
                                                  color: Colors.white),
                                              child: Center(child: TextWidget(text: "1", scale: 1.1)),
                                            ),
                                            SizedBox(
                                              width: SizeConfig.safeBlockHorizontal! * 2,
                                            ),
                                            TextWidget(text: "+", scale: 1.2)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            TextWidget(text: "Price", scale: 1.1),
                                            TextWidget(
                                              text: '\$100',
                                              scale: 1.1,
                                              weight: FontWeight.bold,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: SizeConfig.safeBlockHorizontal! * 2,
                                    ),
                                    TextWidget(
                                      text: 'Sub-total: \$100',
                                      scale: 1.2,
                                      weight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider()
                    ],
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text: "Total", scale: 1.3),
                TextWidget(
                  text: "\$53.00",
                  scale: 1.3,
                  color: Colors.black,
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 4,
            ),
            Container(
              padding: EdgeInsets.only(bottom: SizeConfig.safeBlockHorizontal! * 3),
              width: SizeConfig.screenWidth,
              child: Center(
                child: CustomButton(
                  onTap: () {
                    AutoRouter.of(context).push(CheckoutRoute());
                  },
                  width: SizeConfig.screenWidth! * 0.9,
                  buttonText: "Proceed",
                  buttonColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
// SvgPicture.asset(
// appLogo,
// color: iconColor,
// semanticsLabel: 'App Logo',
// fit: BoxFit.scaleDown,
// height: SizeConfig.safeBlockHorizontal! * 15,
// ),
