import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/colors.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/features/products/presentation/bloc/products_bloc.dart';
import 'package:shoppos/features/products/presentation/bloc/products_event.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/settings_bloc.dart';

class SearchFilterSortWidget extends StatelessWidget {
  String? name;
  TextEditingController searchController = TextEditingController();

  SearchFilterSortWidget({
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: TextField(
        controller: searchController,
        cursorColor: Colors.grey,
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            switch (name) {
              case "products":
                settingsBloc.updateScreenStatus(13);
                BlocProvider.of<GetSearchProductsBloc>(context).add(GetProductsSearchData(value));
                break;
            }
          }
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            fillColor: Colors.grey[200],
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 3), borderSide: BorderSide.none),
            hintText: 'Search...',
            hintStyle: TextStyle(color: iconColor, fontSize: SizeConfig.safeBlockHorizontal! * 4),
            prefixIcon: SvgPicture.asset(search, color: iconColor, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown)),
      ),
    );
  }
}
