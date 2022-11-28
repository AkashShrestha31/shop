import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/colors.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/details_row_widget.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class TransactionHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0,
          title: const Center(
              child: Text(
            "Transaction History",
            textScaleFactor: 1,
          )),
          actions: [
            SizedBox(
              width: SizeConfig.safeBlockHorizontal! * 6,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      fillColor: Colors.white,
                      filled: true,
                      border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 3), borderSide: BorderSide.none),
                      hintText: 'Search Costumer',
                      hintStyle: TextStyle(color: iconColor, fontSize: SizeConfig.safeBlockHorizontal! * 4),
                      prefixIcon: SvgPicture.asset(search, color: iconColor, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown)),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 6,
                ),
                TextWidget(
                  text: "4 results found.",
                  scale: 1.3,
                  color: Colors.black,
                  weight: FontWeight.w500,
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 4,
                          ),
                          Container(
                            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
                            width: SizeConfig.screenWidth,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 2), color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: SizeConfig.safeBlockHorizontal! * 2,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      text: "Jane Copper",
                                      scale: 1.3,
                                      color: Colors.black,
                                      weight: FontWeight.w500,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 2),
                                              color: Color.fromRGBO(37, 210, 99, 0.3)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: SizeConfig.safeBlockHorizontal! * 3,
                                                right: SizeConfig.safeBlockHorizontal! * 3,
                                                top: SizeConfig.safeBlockHorizontal! * 2,
                                                bottom: SizeConfig.safeBlockHorizontal! * 2),
                                            child: TextWidget(
                                              text: "Paid",
                                              color: Colors.green,
                                              scale: 1.1,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: SizeConfig.safeBlockHorizontal! * 3,
                                        ),
                                        Icon(Icons.arrow_forward_ios)
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: SizeConfig.safeBlockHorizontal! * 4,
                                ),
                                DetailsRowWidget(
                                  leftText: "Created Date",
                                  rightText: "16 Sep 2021",
                                  textAlign: TextAlign.right,
                                  backgroundColor: Colors.grey[300],
                                ),
                                DetailsRowWidget(
                                  leftText: "Amount",
                                  rightText: "\$150",
                                  textAlign: TextAlign.right,
                                  rightTextColor: Colors.red,
                                  backgroundColor: Colors.white,
                                ),
                                DetailsRowWidget(
                                  leftText: "Due Date",
                                  rightText: "22 Oct 2021",
                                  textAlign: TextAlign.right,
                                  backgroundColor: Colors.grey[300],
                                ),
                                DetailsRowWidget(
                                  leftText: "Status",
                                  rightText: "Paid",
                                  textAlign: TextAlign.right,
                                  rightTextColor: Colors.green,
                                  backgroundColor: Colors.white,
                                ),
                                DetailsRowWidget(
                                  leftText: "Paid On",
                                  textAlign: TextAlign.right,
                                  rightText: "22 Oct 2021, 10:45pm",
                                  backgroundColor: Colors.grey[300],
                                ),
                                SizedBox(
                                  height: SizeConfig.safeBlockHorizontal! * 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
