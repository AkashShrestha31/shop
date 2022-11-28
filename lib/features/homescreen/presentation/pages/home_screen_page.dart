import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shoppos/core/constants/constant.dart';
import 'package:shoppos/core/util/widget/custom_button.dart';
import 'package:shoppos/features/add_settings_items/presentation/widgets/start_date_end_date_row.dart';
import 'package:shoppos/features/boarding_screen/presentation/widgets/widgets.dart';

import '../widgets/widget.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future modelSheet(List<String> datmoth) {
    return showMaterialModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Container(
        height: SizeConfig.screenHeight! * 0.6,
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(SizeConfig.safeBlockHorizontal! * 8), topLeft: Radius.circular(SizeConfig.safeBlockHorizontal! * 8)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: "Sort by Date",
                  scale: SizeConfig.safeBlockHorizontal! * 0.3,
                  weight: FontWeight.bold,
                  color: Colors.black,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    )),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal! * 4,
                    ),
                    Column(
                      children: [
                        TextWidget(
                          text: "Today",
                          scale: 1.2,
                          color: Theme.of(context).primaryColor,
                          weight: FontWeight.w500,
                        ),
                        TextWidget(
                            text: "${Constant.months[int.parse(datmoth[0]) - 1]} ${int.parse(datmoth[1])}",
                            scale: 1.1,
                            color: Theme.of(context).primaryColor)
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.check,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 2,
            ),
            Divider(
              color: Colors.grey[300],
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal! * 4,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Yesterday",
                          scale: 1.2,
                          color: Colors.black,
                          weight: FontWeight.w500,
                        ),
                        TextWidget(
                            text: "${Constant.months[int.parse(datmoth[0]) - 1]} ${int.parse(datmoth[1]) - 1}", scale: 1.1, color: Colors.black)
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 2,
            ),
            Divider(
              color: Colors.grey[300],
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 6,
            ),
            TextWidget(
              text: "Custom Date Range",
              scale: SizeConfig.safeBlockHorizontal! * 0.3,
              weight: FontWeight.w400,
              color: Colors.black,
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 4,
            ),
            StartDateEndDateRow(),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  onTap: () {},
                  width: SizeConfig.screenWidth! * 0.4,
                  borderColor: Theme.of(context).primaryColor,
                  buttonText: "Reset",
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                ),
                CustomButton(
                  onTap: () {},
                  width: SizeConfig.screenWidth! * 0.4,
                  buttonText: "Apply",
                  buttonColor: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MM-dd').format(now);
    List<String> datmoth = formattedDate.split('-');

    return Material(
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.43,
                      child: Row(
                        children: [
                          HomeScreenPageExpanded(
                            onTap: () {},
                            text: "Date",
                            bottomLeft: SizeConfig.safeBlockHorizontal!,
                            topLeft: SizeConfig.safeBlockHorizontal!,
                            bottomRight: 0,
                            topRight: 0,
                            containerColor: Colors.blue,
                            textColor: Colors.white,
                          ),
                          HomeScreenPageExpanded(
                            onTap: () {},
                            text: "Month",
                            bottomLeft: 0,
                            topLeft: 0,
                            bottomRight: 0,
                            topRight: 0,
                            containerColor: Colors.grey[200],
                            textColor: iconColor,
                          ),
                          HomeScreenPageExpanded(
                            onTap: () {},
                            text: "Year",
                            bottomLeft: 0,
                            topLeft: 0,
                            bottomRight: SizeConfig.safeBlockHorizontal!,
                            topRight: SizeConfig.safeBlockHorizontal!,
                            containerColor: Colors.grey[200],
                            textColor: iconColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal! * 2,
                    ),
                    InkWell(
                      onTap: () {
                        modelSheet(datmoth);
                      },
                      child: Container(
                        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 2),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal!), color: Colors.grey[200]),
                        child: Row(
                          children: [
                            TextWidget(
                              text: "Sort By: ",
                              scale: 1.1,
                              color: Colors.black,
                              weight: FontWeight.bold,
                            ),
                            SvgPicture.asset(sort, color: Theme.of(context).primaryColor, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Income",
                      scale: 1.4,
                      color: Colors.black,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 9,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                HomeScreenPageContainer(
                    title: "Rs 6000", subTitle: "Sales", gradient1: Color.fromRGBO(47, 127, 237, 1), gradient2: Color.fromRGBO(51, 96, 187, 1)),
                HomeScreenPageContainer(
                    title: "50", subTitle: "Customers", gradient1: Color.fromRGBO(17, 195, 67, 1), gradient2: Color.fromRGBO(54, 161, 92, 1))
              ],
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 7,
            ),
            TextWidget(
              text: "Expenses",
              scale: 1.4,
              color: Colors.black,
              weight: FontWeight.bold,
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                HomeScreenPageContainer(
                    title: "Rs 10000", subTitle: "Expenses", gradient1: Color.fromRGBO(47, 127, 237, 1), gradient2: Color.fromRGBO(51, 96, 187, 1)),
                HomeScreenPageContainer(
                    title: "3", subTitle: "Vendors", gradient1: Color.fromRGBO(17, 195, 67, 1), gradient2: Color.fromRGBO(54, 161, 92, 1))
              ],
            )
          ],
        ),
      ),
    );
  }
}
