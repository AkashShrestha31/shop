import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/util/widget/slidable/src/action_pane_motions.dart';
import 'package:shoppos/core/util/widget/slidable/src/actions.dart';
import 'package:shoppos/core/util/widget/slidable/src/slidable.dart';
import 'package:shoppos/features/category/presentation/bloc/category_bloc.dart';
import 'package:shoppos/features/category/presentation/bloc/category_state.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/settings_bloc.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class SettingItemBodyWidget extends StatelessWidget {
  final String? name;
  final String? type;

  SettingItemBodyWidget({required this.name, this.type});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return Container();
        } else if (state is CategoryLoaded) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: state.model.results!.length,
              itemBuilder: (context, i) {
                return Slidable(
                  // Specify a key if the Slidable is dismissible.
                  key: const ValueKey(0),

                  // The start action pane is the one at the left or the top side.

                  // The end action pane is the one at the right or the bottom side.
                  endActionPane: type != "Archive"
                      ? ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (value) {
                                settingsBloc.updateScreenStatus(0);
                              },
                              backgroundColor: Color(0xFFFF4E4E),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                            ),
                            SlidableAction(
                              onPressed: null,
                              backgroundColor: Color(0xFFFF4E4E),
                              foregroundColor: Colors.white,
                              icon: Icons.cancel,
                            ),
                          ],
                        )
                      : ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: null,
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              icon: Icons.refresh,
                            ),
                          ],
                        ),
                  // The child of the Slidable is what the user sees when the
                  // component is not dragged.
                  child: InkWell(
                    onTap: () {
                      switch (name) {
                        case "Attribute":
                          settingsBloc.updateScreenStatus(10);
                          break;
                        case "Products":
                          settingsBloc.updateScreenStatus(11);
                          break;
                        default:
                          settingsBloc.updateScreenStatus(1);
                          break;
                      }
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: SizeConfig.safeBlockHorizontal!,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: SizeConfig.safeBlockHorizontal! * 6,
                              backgroundColor: Colors.grey,
                              backgroundImage: NetworkImage(state.model.results![0].icon!),
                            ),
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal! * 3,
                            ),
                            TextWidget(
                              text: state.model.results![0].categoryName,
                              scale: 1.2,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockHorizontal!,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: SizeConfig.screenWidth! * 0.9,
                              child: const Divider(),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        }
        return Container();
      },
    );
  }
}
