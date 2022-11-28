import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppos/core/bloc/sort_by_bloc.dart';
import 'package:shoppos/core/constants/colors.dart';

class SortWidget extends StatelessWidget {
  const SortWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: sortByBloc.sort,
        initialData: 0,
        builder: (context, snapshot) {
          if (snapshot.data == 0) {
            return InkWell(
                onTap: () {
                  sortByBloc.updateSort(1);
                },
                child: Icon(
                  FontAwesomeIcons.sortAlphaUp,
                  color: iconColor,
                ));
          }
          return InkWell(
              onTap: () {
                sortByBloc.updateSort(0);
              },
              child: Icon(
                FontAwesomeIcons.sortAlphaDown,
                color: iconColor,
              ));
        });
  }
}
