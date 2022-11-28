import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/colors.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/pagination/flutter_pagination_widget.dart';
import 'package:shoppos/core/util/widget/slidable/flutter_slidable.dart';
import 'package:shoppos/core/util/widget/sort_widget.dart';
import 'package:shoppos/features/boarding_screen/presentation/widgets/widgets.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/service_bloc.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/service_event.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/service_state.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/settings_bloc.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/delete_product_widget.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/items_details_widget.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';
import 'package:shoppos/routes/app_router.gr.dart';

import '../widgets/setting_items_details_page_state_row.dart';

class SettingItemsDetailsPage extends StatefulWidget {
  const SettingItemsDetailsPage({Key? key}) : super(key: key);

  @override
  State<SettingItemsDetailsPage> createState() => _SettingItemsDetailsPageState();
}

class _SettingItemsDetailsPageState extends State<SettingItemsDetailsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    settingsBloc.updateScreenStatus(3);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ServiceBloc>()..add(GetServiceData()),
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              title: const Center(
                  child: Text(
                "Service Charges",
                textScaleFactor: 1,
              )),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal! * 3),
                  child: GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).push(const ArchiveRoute());
                      },
                      child: SvgPicture.asset(archive, color: Colors.white, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown)),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: BlocBuilder<ServiceBloc, ServiceState>(
                builder: (context, state) {
                  if (state is ServiceLoading) {
                    return Container(
                      height: SizeConfig.screenHeight,
                      child: const Center(
                        child: const CircularProgressIndicator(),
                      ),
                    );
                  }
                  if (state is ServiceLoaded) {
                    return Container(
                      margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: TextField(
                                  cursorColor: Colors.grey,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(0),
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 3), borderSide: BorderSide.none),
                                      hintText: 'Search...',
                                      hintStyle: TextStyle(color: iconColor, fontSize: SizeConfig.safeBlockHorizontal! * 4),
                                      prefixIcon: SvgPicture.asset(search, color: iconColor, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown)),
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.safeBlockHorizontal! * 7,
                              ),
                              SvgPicture.asset(filter, color: iconColor, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown),
                              SizedBox(
                                width: SizeConfig.safeBlockHorizontal! * 7,
                              ),
                              const SortWidget()
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 8,
                          ),
                          const SettingItemsDetailsPageStateRow(),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 3,
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.61,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.model.results!.length,
                                itemBuilder: (context, i) {
                                  return Slidable(
                                    // Specify a key if the Slidable is dismissible.
                                    key: const ValueKey(0),

                                    // The start action pane is the one at the left or the top side.

                                    // The end action pane is the one at the right or the bottom side.
                                    endActionPane: ActionPane(
                                      motion: const ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (value) {
                                            settingsBloc.updateScreenStatus(0);
                                          },
                                          backgroundColor: const Color(0xFFFF4E4E),
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                        ),
                                        const SlidableAction(
                                          onPressed: null,
                                          backgroundColor: Color(0xFFFF4E4E),
                                          foregroundColor: Colors.white,
                                          icon: Icons.cancel,
                                        ),
                                      ],
                                    ),
                                    // The child of the Slidable is what the user sees when the
                                    // component is not dragged.
                                    child: InkWell(
                                      onTap: () {
                                        settingsBloc.updateScreenStatus(1);
                                      },
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: SizeConfig.safeBlockHorizontal! * 3,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextWidget(
                                                text: "#" + state.model.results![i].id!.toString(),
                                                scale: 1.2,
                                              ),
                                              TextWidget(
                                                text: state.model.results![i].service,
                                                scale: 1.2,
                                              ),
                                              TextWidget(
                                                text: state.model.results![i].chargeType,
                                                scale: 1.2,
                                              ),
                                              TextWidget(
                                                text: state.model.results![i].rate.toString(),
                                                scale: 1.2,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: SizeConfig.safeBlockHorizontal! * 3,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: SizeConfig.screenWidth! * 0.9,
                                                child: const Divider(),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Container(
                            height: SizeConfig.safeBlockHorizontal! * 10,
                            child: WebPagination(
                                currentPage: 1,
                                totalPage: state.model.totalPages!,
                                onPageChanged: (page) {
                                  setState(() {});
                                }),
                          ),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
            floatingActionButton: Padding(
              padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
              child: FloatingActionButton(
                // isExtended: true,
                child: const Icon(Icons.add),
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {
                  AutoRouter.of(context).push(const AddSettingItemsRoute());
                },
              ),
            ),
          ),
          StreamBuilder<int>(
              stream: settingsBloc.screen,
              initialData: 3,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data) {
                    case 0:
                      return DeleteProductWidget(
                        name: "service charge",
                      );
                      break;
                    case 1:
                      return ItemsDetailsWidget();
                      break;
                    default:
                      return Container();
                  }
                }
                return Container();
              })
        ],
      ),
    );
  }
}
