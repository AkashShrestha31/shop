import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/colors.dart';
import 'package:shoppos/core/constants/constant.dart';
import 'package:shoppos/core/storage/local_storage_repository.dart';
import 'package:shoppos/routes/app_router.gr.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final box = GetStorage();

    Future.delayed(const Duration(seconds: 1), () {
      // get the scoped router by calling
      final token = localRepoImpl.getToken();
      if (token.isNotEmpty) {
        AutoRouter.of(context).replace(const HomeRoute());
      } else {
        AutoRouter.of(context).replace(const BoardingScreenRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, 'assets/boardingdata/images/first-screen.svg'), context);
    precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, 'assets/boardingdata/images/second-screen.svg'), context);
    precachePicture(ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, 'assets/boardingdata/images/third-screen.svg'), context);
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      color: blue800Map[800],
      child: Constant.svgIcon,
    );
  }
}
