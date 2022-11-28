import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/features/profile/presentation/pages/profile_page_container.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';
import 'package:shoppos/routes/app_router.gr.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: SizeConfig.screenHeight! * 0.2,
          width: SizeConfig.screenWidth,
          color: Theme.of(context).primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Padding(
                    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal!),
                    child: CircleAvatar(
                      radius: SizeConfig.safeBlockHorizontal! * 12,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 50),
                          color: Colors.white,
                          border: Border.all(color: Theme.of(context).primaryColor)),
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 2),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: "Account setting",
                scale: 1.4,
                color: Colors.black,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal! * 6,
              ),
              ProfilePageContainer(
                title: "Personal Information",
                subtitle: "Change your account information",
                icon: personalinfo,
                onTap: () {
                  AutoRouter.of(context).push(const EditProfileRoute());
                },
              ),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal! * 4,
              ),
              ProfilePageContainer(
                title: "Upload your documents",
                subtitle: "Upload your documents, IDs...",
                icon: document,
                onTap: () {
                  AutoRouter.of(context).push(const UploadDocumentRoute());
                },
              ),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal! * 4,
              ),
              ProfilePageContainer(
                title: "Change password",
                subtitle: "Change your current password",
                icon: passwordIcon,
                onTap: () {
                  AutoRouter.of(context).push(const ChangePasswordRoute());
                },
              ),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal! * 4,
              ),
              ProfilePageContainer(
                title: "Logout",
                iconcolor: Colors.redAccent,
                titlecolor: Colors.redAccent,
                subtitle: "Logout of your current account",
                icon: logout,
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    ));
  }
}
