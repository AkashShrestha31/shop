import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/settings_bloc.dart';

class DiscardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      color: Colors.grey.withOpacity(0.5),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 5),
          height: SizeConfig.screenHeight! * 0.16,
          width: SizeConfig.screenWidth! * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 4),
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.safeBlockHorizontal! * 3,
              ),
              Material(
                  color: Colors.white,
                  child: Text(
                    "Exit and Discard all your Changes?",
                    style: TextStyle(fontWeight: FontWeight.w500),
                    textScaleFactor: 1.3,
                  )),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal! * 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      settingsBloc.updateScreenStatus(3);
                    },
                    child: Material(
                        color: Colors.white,
                        child: Text(
                          "No",
                          style: TextStyle(fontWeight: FontWeight.normal),
                          textScaleFactor: 1.3,
                        )),
                  ),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal! * 3,
                  ),
                  Container(
                    width: SizeConfig.screenWidth! * 0.25,
                    height: SizeConfig.screenHeight! * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 2)),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          settingsBloc.updateScreenStatus(3);
                          Navigator.pop(context);
                        },
                        child: Center(
                          child: Text(
                            "Yes",
                            style: TextStyle(color: Colors.white, fontSize: SizeConfig.safeBlockHorizontal! * 3.7, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
