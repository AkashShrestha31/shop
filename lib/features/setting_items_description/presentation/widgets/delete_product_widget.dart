import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/colors.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/features/boarding_screen/presentation/widgets/widgets.dart';
import 'package:shoppos/features/products/presentation/bloc/products.dart';
import 'package:shoppos/features/products/presentation/bloc/products_bloc.dart';
import 'package:shoppos/features/products/presentation/bloc/products_event.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/settings_bloc.dart';

class DeleteProductWidget extends StatelessWidget {
  String? name;

  DeleteProductWidget({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      color: Colors.grey.withOpacity(0.5),
      child: Stack(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 5),
              height: SizeConfig.screenHeight! * 0.28,
              width: SizeConfig.screenWidth! * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 4),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Material(
                        child: IconButton(
                          onPressed: () {
                            settingsBloc.updateScreenStatus(3);
                          },
                          icon: const Icon(Icons.clear),
                          color: iconColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 3,
                  ),
                  Material(
                      color: Colors.white,
                      child: Text(
                        "You are about to delete a ${name}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textScaleFactor: 1.3,
                      )),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal! * 3,
                  ),
                  Material(
                      color: Colors.white,
                      child: Text(
                        "This will delete your ${name} from catalog Are you sure?",
                        textScaleFactor: 1.2,
                        textAlign: TextAlign.center,
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
                        child: const Material(
                            color: Colors.white,
                            child: Text(
                              "Cancel",
                              style: TextStyle(fontWeight: FontWeight.w500),
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
                              switch (name!) {
                                case "product":
                                  BlocProvider.of<GetDeleteProductsBloc>(context).add(GetProductsDeleteData(productsCRUDBloc.getDeleteProduct().id!));
                                  break;
                                case "image":
                                  break;
                              }
                            },
                            child: Center(
                              child: Text(
                                "Delete",
                                style: TextStyle(color: Colors.white, fontSize: SizeConfig.safeBlockHorizontal! * 3.7, fontWeight: FontWeight.w500),
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
          Positioned(
              bottom: SizeConfig.screenHeight! * 0.59,
              left: SizeConfig.screenWidth! * 0.43,
              child: CircleAvatar(
                radius: SizeConfig.safeBlockHorizontal! * 8,
                backgroundColor: Colors.grey[200],
                child: SvgPicture.asset(delete, color: Colors.black, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown),
              ))
        ],
      ),
    );
  }
}
