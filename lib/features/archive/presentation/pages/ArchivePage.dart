import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/util/widget/slidable/flutter_slidable.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/settings_bloc.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/items_details_widget.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/setting_items_details_page_state_row.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class ArchivePage extends StatefulWidget {
  const ArchivePage({Key? key}) : super(key: key);

  @override
  State<ArchivePage> createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    settingsBloc.updateScreenStatus(3);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            title: const Center(
                child: Text(
              "Archived",
              textScaleFactor: 1,
            )),
            actions: [
              SizedBox(
                width: SizeConfig.screenWidth! * 0.2,
              ),
            ],
          ),
          body: Container(
            margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 8,
                ),
                SettingItemsDetailsPageStateRow(),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! * 3,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, i) {
                        return Slidable(
                          // Specify a key if the Slidable is dismissible.
                          key: const ValueKey(0),

                          // The start action pane is the one at the left or the top side.

                          // The end action pane is the one at the right or the bottom side.
                          endActionPane: const ActionPane(
                            motion: ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: null,
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                icon: Icons.refresh,
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
                                      text: "#29392",
                                      scale: 1.2,
                                    ),
                                    TextWidget(
                                      text: "Service Name",
                                      scale: 1.2,
                                    ),
                                    TextWidget(
                                      text: "Percent",
                                      scale: 1.2,
                                    ),
                                    TextWidget(
                                      text: "100",
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
              ],
            ),
          ),
        ),
        StreamBuilder<int>(
            stream: settingsBloc.screen,
            initialData: 3,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data) {
                  // case 0:
                  //   return DeleteProductWidget();
                  //   break;
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
    );
  }
}
