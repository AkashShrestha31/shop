import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/expasion_tile.dart';
import 'package:shoppos/routes/app_router.gr.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: SizeConfig.screenHeight,
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.safeBlockHorizontal! * 6,
                    ),
                    const UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: Colors.white),
                      accountName: Text(
                        "Akash Shrestha",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 1.3,
                      ),
                      accountEmail: Text(
                        "aakahshrestha31@gmail.com",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      currentAccountPicture: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Divider(color: Colors.grey[200]),
                    Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent, cardColor: Colors.black),
                      child: CustomExpansionTile(
                        title: Transform.translate(
                          offset: const Offset(-14, 0),
                          child: const Text(
                            "Settings",
                            style: TextStyle(fontWeight: FontWeight.w400),
                            textScaleFactor: 1.3,
                          ),
                        ),
                        leading: setting, //add icon

                        childrenPadding: const EdgeInsets.only(left: 60), //children padding
                        children: [
                          Transform.translate(
                            offset: const Offset(-24, 0),
                            child: ListTile(
                              leading: SvgPicture.asset(billing, color: Colors.grey[500], semanticsLabel: 'App Logo', fit: BoxFit.scaleDown),
                              contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
                              title: Transform.translate(
                                offset: const Offset(-16, 0),
                                child: const Text('Service Charges'),
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                                AutoRouter.of(context).push(const SettingItemsDetailsRoute());
                                //action on press
                              },
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(-24, 0),
                            child: ListTile(
                              leading: SvgPicture.asset(categories, color: Colors.grey[500], semanticsLabel: 'App Logo', fit: BoxFit.scaleDown),
                              contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
                              title: Transform.translate(
                                offset: const Offset(-16, 0),
                                child: const Text('Categories'),
                              ),
                              onTap: () {
                                //action on press
                                Navigator.of(context).pop();
                                AutoRouter.of(context).push(CategoryRoute(name: "Category"));
                              },
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(-24, 0),
                            child: ListTile(
                              leading: SvgPicture.asset(brand, color: Colors.grey[500], semanticsLabel: 'App Logo', fit: BoxFit.scaleDown),
                              contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
                              title: Transform.translate(
                                offset: const Offset(-16, 0),
                                child: const Text('Brands'),
                              ),
                              onTap: () {
                                //action on press
                                Navigator.of(context).pop();
                                AutoRouter.of(context).push(CategoryRoute(name: "Brands"));
                              },
                            ),
                          ),

                          //more child menu
                        ],
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent, cardColor: Colors.black),
                      child: CustomExpansionTile(
                        title: Transform.translate(
                          offset: const Offset(-14, 0),
                          child: const Text(
                            "Product",
                            style: TextStyle(fontWeight: FontWeight.w400),
                            textScaleFactor: 1.3,
                          ),
                        ),
                        leading: product, //add icon
                        childrenPadding: const EdgeInsets.only(left: 60), //children padding
                        children: [
                          //more child menu
                          Transform.translate(
                            offset: const Offset(-24, 0),
                            child: ListTile(
                              leading: SvgPicture.asset(billing, color: Colors.grey[500], semanticsLabel: 'App Logo', fit: BoxFit.scaleDown),
                              contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
                              title: Transform.translate(
                                offset: const Offset(-16, 0),
                                child: const Text('All Product'),
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                                AutoRouter.of(context).push(ProductsRoute(name: "Products"));
                                //action on press
                              },
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(-24, 0),
                            child: ListTile(
                              leading: SvgPicture.asset(billing, color: Colors.grey[500], semanticsLabel: 'App Logo', fit: BoxFit.scaleDown),
                              contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
                              title: Transform.translate(
                                offset: const Offset(-16, 0),
                                child: const Text('Add Product'),
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                                AutoRouter.of(context).push(AddProductRoute(title: "Add Products"));
                                //action on press
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent, cardColor: Colors.black),
                      child: CustomExpansionTile(
                        title: Transform.translate(
                          offset: const Offset(-14, 0),
                          child: const Text(
                            "User",
                            style: TextStyle(fontWeight: FontWeight.w400),
                            textScaleFactor: 1.3,
                          ),
                        ),
                        leading: profile, //add icon
                        childrenPadding: const EdgeInsets.only(left: 60), //children padding
                        children: [
                          //more child menu
                          Transform.translate(
                            offset: const Offset(-24, 0),
                            child: ListTile(
                              leading: SvgPicture.asset(billing, color: Colors.grey[500], semanticsLabel: 'App Logo', fit: BoxFit.scaleDown),
                              contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
                              title: Transform.translate(
                                offset: const Offset(-16, 0),
                                child: const Text('Shopworker'),
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                                AutoRouter.of(context).push(const ShopWorkerRoute());
                                //action on press
                              },
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(-24, 0),
                            child: ListTile(
                              leading: SvgPicture.asset(billing, color: Colors.grey[500], semanticsLabel: 'App Logo', fit: BoxFit.scaleDown),
                              contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
                              title: Transform.translate(
                                offset: const Offset(-16, 0),
                                child: const Text('Customers'),
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                                AutoRouter.of(context).push(const TransactionHistoryRoute());
                                //action on press
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent, cardColor: Colors.black),
                      child: CustomExpansionTile(
                        title: Transform.translate(
                          offset: const Offset(-14, 0),
                          child: const Text(
                            "Report",
                            style: TextStyle(fontWeight: FontWeight.w400),
                            textScaleFactor: 1.3,
                          ),
                        ),
                        leading: report, //add icon
                        childrenPadding: const EdgeInsets.only(left: 60), //children padding
                        children: const [
                          //more child menu
                        ],
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent, cardColor: Colors.black),
                      child: CustomExpansionTile(
                        title: Transform.translate(
                          offset: const Offset(-14, 0),
                          child: const Text(
                            "Wholesellers",
                            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
                            textScaleFactor: 1.3,
                          ),
                        ),
                        leading: wholeseller, //add icon
                        childrenPadding: const EdgeInsets.only(left: 60), //children padding
                        children: const [
                          //more child menu
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      height: SizeConfig.screenHeight! * 0.08,
                      width: SizeConfig.screenWidth,
                      child: Column(
                        children: [
                          Divider(color: Colors.grey[200], thickness: 2),
                          Container(
                              height: SizeConfig.screenHeight! * 0.06,
                              width: SizeConfig.screenWidth,
                              padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal! * 3),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Version 0.0.1",
                                    style: TextStyle(color: Color(0xFF747474)),
                                    textScaleFactor: 1.3,
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
