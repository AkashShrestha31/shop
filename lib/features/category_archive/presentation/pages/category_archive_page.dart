import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/settings_bloc.dart';

import '../../../attributes/presentation/widgets/setting_item_body_widget.dart';

class CategoryArchivePage extends StatefulWidget {
  final String? name;

  CategoryArchivePage({required this.name});

  @override
  State<CategoryArchivePage> createState() => _CategoryArchivePageState();
}

class _CategoryArchivePageState extends State<CategoryArchivePage> {
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
                SettingItemBodyWidget(
                  name: widget.name!,
                  type: "Archive",
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
