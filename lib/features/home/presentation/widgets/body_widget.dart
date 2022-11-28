import 'package:flutter/material.dart';
import 'package:shoppos/features/homescreen/presentation/pages/home_screen_page.dart';
import 'package:shoppos/features/products_cart/presentation/pages/products_cart.dart';
import 'package:shoppos/features/profile/presentation/pages/profile_page.dart';
import 'package:shoppos/features/settings/presentation/pages/settings_pages.dart';

class BodyWidget extends StatelessWidget {
  final int index;

  const BodyWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return const HomeScreenPage();
        break;
      case 1:
        return ProductsCartPage();
        break;
      case 2:
        return const SettingsPages();
        break;
      case 3:
        return ProfilePage();
        break;
      default:
        return Center(child: Text("home isc called"));
        break;
    }
  }
}
