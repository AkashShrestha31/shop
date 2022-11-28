import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';

class LoadingTransparentScreen extends StatelessWidget {
  const LoadingTransparentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.5),
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
