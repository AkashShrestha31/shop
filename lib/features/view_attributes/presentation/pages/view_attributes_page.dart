import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/util/widget/custom_button.dart';
import 'package:shoppos/core/util/widget/discard_widget.dart';
import 'package:shoppos/core/util/widget/name_and_status_widget.dart';
import 'package:shoppos/features/add_attributes/presentation/widgets/name_value_status_widget.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/settings_bloc.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class ViewAttributesPage extends StatefulWidget {
  List<Widget> subAttributeList;
  final String? name;
  ViewAttributesPage({required this.name, required this.subAttributeList});

  @override
  State<ViewAttributesPage> createState() => _ViewAttributesPageState();
}

class _ViewAttributesPageState extends State<ViewAttributesPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.subAttributeList.add(NameValueStatusWidget(
      status: status,
      subAttribute: "Size",
      select_status: "Active",
      value: "large",
    ));
    widget.subAttributeList.add(NameValueStatusWidget(
      status: status,
      subAttribute: "Size",
      select_status: "Active",
      value: "Small",
    ));
  }

  final List<String> status = [
    'Active',
    'Inactive',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Center(
                  child: Text(
                "Attribute Details",
                textScaleFactor: 1,
              )),
              actions: [
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal! * 15,
                )
              ],
            ),
            body: Container(
              padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 5),
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: SizeConfig.safeBlockHorizontal! * 6,
                        ),
                        NameAndStatusWidget(name: widget.name, status: status, dropdownValue: "Active", textfieldValue: "Attri"),
                        widget.subAttributeList.isNotEmpty
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: SizeConfig.safeBlockHorizontal! * 10,
                                  ),
                                  TextWidget(
                                    text: "Sub-Attribute",
                                    scale: SizeConfig.safeBlockHorizontal! * 0.34,
                                    weight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    height: SizeConfig.safeBlockHorizontal! * 6,
                                  ),
                                ],
                              )
                            : Container(),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          addAutomaticKeepAlives: true,
                          itemCount: widget.subAttributeList.length,
                          itemBuilder: (_, i) => widget.subAttributeList[i],
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockHorizontal! * 6,
                        ),
                        TextButton.icon(
                          // <-- TextButton
                          onPressed: () {
                            widget.subAttributeList.add(NameValueStatusWidget(status: status));
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.add,
                            size: SizeConfig.safeBlockHorizontal! * 5,
                            color: Theme.of(context).primaryColor,
                          ),
                          label: TextWidget(
                            text: "Add Sub-Attribute",
                            scale: SizeConfig.safeBlockHorizontal! * 0.27,
                            weight: FontWeight.w500,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockHorizontal! * 20,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: CustomButton(
                      onTap: () {},
                      width: SizeConfig.screenWidth! * 0.9,
                      buttonText: "Save",
                      buttonColor: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            )),
        StreamBuilder<int>(
            stream: settingsBloc.screen,
            initialData: 3,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data) {
                  case 0:
                    return DiscardWidget();
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
