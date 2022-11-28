import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/colors.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/custom_button.dart';
import 'package:shoppos/core/util/widget/pagination/flutter_pagination_widget.dart';
import 'package:shoppos/core/util/widget/search_filter_sort_widget.dart';
import 'package:shoppos/core/util/widget/slidable/src/action_pane_motions.dart';
import 'package:shoppos/core/util/widget/slidable/src/actions.dart';
import 'package:shoppos/core/util/widget/slidable/src/slidable.dart';
import 'package:shoppos/core/util/widget/sort_widget.dart';
import 'package:shoppos/features/products/data/models/products_model.dart';
import 'package:shoppos/features/products/presentation/bloc/products.dart';
import 'package:shoppos/features/products/presentation/bloc/products_bloc.dart';
import 'package:shoppos/features/products/presentation/bloc/products_event.dart';
import 'package:shoppos/features/products/presentation/bloc/products_state.dart';
import 'package:shoppos/features/products/presentation/widgets/product_items_row.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/settings_bloc.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';

class ProductBodyWidget extends StatelessWidget {
  const ProductBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                BlocBuilder<GetSearchProductsBloc, ProductsState>(
                  builder: (context, state) {
                    if (state is ProductsLoaded) {
                      productsCRUDBloc.updateResults(state.model.results!);
                      settingsBloc.updateScreenStatus(1);
                      productsCRUDBloc.updateTotalPage(state.model.totalPages!);
                      productsCRUDBloc.updateCurrentPage(1);
                    }
                    return SearchFilterSortWidget(
                      name: "products",
                    );
                  },
                ),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal! * 7,
                ),
                GestureDetector(
                    onTap: () {
                      showMaterialModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) => Container(
                          height: SizeConfig.screenHeight! * 0.4,
                          width: SizeConfig.screenWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(SizeConfig.safeBlockHorizontal! * 8),
                                topLeft: Radius.circular(SizeConfig.safeBlockHorizontal! * 8)),
                            color: Colors.grey[200],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: SizeConfig.safeBlockHorizontal! * 6,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal! * 6, right: SizeConfig.safeBlockHorizontal! * 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      text: "Sort By",
                                      scale: SizeConfig.safeBlockHorizontal! * 0.3,
                                      weight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.safeBlockHorizontal! * 6,
                                      right: SizeConfig.safeBlockHorizontal! * 6,
                                      top: SizeConfig.safeBlockHorizontal! * 3,
                                      bottom: SizeConfig.safeBlockHorizontal! * 3),
                                  child: TextWidget(
                                    text: "Active",
                                    scale: SizeConfig.safeBlockHorizontal! * 0.3,
                                    weight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: SizeConfig.safeBlockHorizontal! * 6,
                                  right: SizeConfig.safeBlockHorizontal! * 6,
                                ),
                                child: Divider(
                                  color: Colors.grey[300],
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.safeBlockHorizontal! * 6,
                                      right: SizeConfig.safeBlockHorizontal! * 6,
                                      top: SizeConfig.safeBlockHorizontal! * 3,
                                      bottom: SizeConfig.safeBlockHorizontal! * 3),
                                  child: TextWidget(
                                    text: "Inactive",
                                    scale: SizeConfig.safeBlockHorizontal! * 0.3,
                                    weight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: SizeConfig.safeBlockHorizontal! * 6,
                                  right: SizeConfig.safeBlockHorizontal! * 6,
                                ),
                                child: Divider(
                                  color: Colors.grey[300],
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.safeBlockHorizontal! * 6,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CustomButton(
                                    onTap: () {},
                                    width: SizeConfig.screenWidth! * 0.4,
                                    borderColor: Theme.of(context).primaryColor,
                                    buttonText: "Reset",
                                    buttonColor: Colors.white,
                                    textColor: Colors.black,
                                  ),
                                  CustomButton(
                                    onTap: () {},
                                    width: SizeConfig.screenWidth! * 0.4,
                                    buttonText: "Apply",
                                    buttonColor: Theme.of(context).primaryColor,
                                    textColor: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: SvgPicture.asset(filter, color: iconColor, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown)),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal! * 7,
                ),
                SortWidget()
              ],
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 8,
            ),

            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return Container(
                    height: SizeConfig.screenHeight,
                    width: SizeConfig.screenWidth,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is ProductsLoaded) {
                  productsCRUDBloc.updateResults(state.model.results!);
                  productsCRUDBloc.updateTotalPage(state.model.totalPages!);
                  return Column(
                    children: [
                      const ProductItemsRow(),
                      SizedBox(
                        height: SizeConfig.safeBlockHorizontal! * 3,
                      ),
                      StreamBuilder<List<Results>>(
                          stream: productsCRUDBloc.results,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return SizedBox(
                                height: SizeConfig.screenHeight! * 0.61,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, i) {
                                      return Slidable(
                                        // Specify a key if the Slidable is dismissible.
                                        key: const ValueKey(0),

                                        // The start action pane is the one at the left or the top side.

                                        // The end action pane is the one at the right or the bottom side.
                                        endActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          children: [
                                            SlidableAction(
                                              onPressed: (value) {
                                                settingsBloc.updateScreenStatus(0);
                                                productsCRUDBloc.updateDeleteProduct(snapshot.data![i]);
                                                BlocProvider.of<GetDeleteProductsBloc>(context).emit(ProductsEmpty());
                                              },
                                              backgroundColor: const Color(0xFFFF4E4E),
                                              foregroundColor: Colors.white,
                                              icon: Icons.delete,
                                            ),
                                            const SlidableAction(
                                              onPressed: null,
                                              backgroundColor: Color(0xFFFF4E4E),
                                              foregroundColor: Colors.white,
                                              icon: Icons.cancel,
                                            ),
                                          ],
                                        ),
                                        // The child of the Slidable is what the user sees when the
                                        // component is not dragged.
                                        child: InkWell(
                                          onTap: () {
                                            productsCRUDBloc.updateDeleteProduct(snapshot.data![i]);
                                            settingsBloc.updateScreenStatus(11);
                                          },
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: SizeConfig.safeBlockHorizontal! * 3,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: SizeConfig.screenWidth! * 0.3,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: SizeConfig.screenHeight! * 0.06,
                                                          width: SizeConfig.screenHeight! * 0.06,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(SizeConfig.blockSizeHorizontal! * 3),
                                                              color: Colors.grey[200]),
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 2),
                                                            child: Image.network(
                                                              'https://img.freepik.com/free-photo/close-up-portrait-wonderful-child-with-shiny-brown-eyes-looking-with-interest-enthusiastic-little-girl-vintage-straw-hat-decorated-with-ribbon-posing-during-game-park_197531-3960.jpg?w=2000',
                                                              height: SizeConfig.screenHeight! * 0.06,
                                                              width: SizeConfig.screenHeight! * 0.06,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: SizeConfig.safeBlockHorizontal! * 3,
                                                        ),
                                                        Expanded(
                                                          child: TextWidget(
                                                            text: snapshot.data![i].productName,
                                                            scale: 1.2,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: SizeConfig.screenWidth! * 0.26,
                                                    child: TextWidget(
                                                      text: snapshot.data![i].categoryName,
                                                      scale: 1.2,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: SizeConfig.screenWidth! * 0.18,
                                                    child: TextWidget(
                                                      text: snapshot.data![i].brandName,
                                                      scale: 1.2,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: SizeConfig.screenWidth! * 0.18,
                                                    child: TextWidget(
                                                      text: snapshot.data![i].quantity.toString(),
                                                      scale: 1.2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: SizeConfig.safeBlockHorizontal! * 3,
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
                                    }),
                              );
                            }
                            return Container();
                          }),
                    ],
                  );
                }
                return Container();
              },
            ),
            // SizedBox(height: SizeConfig.screenHeight! * 0.65, child: ProductBodyWidget()),
            StreamBuilder<int>(
                stream: productsCRUDBloc.totalPage,
                builder: (context, snapshot) {
                  return Container(
                      height: SizeConfig.safeBlockHorizontal! * 10,
                      child: WebPagination(
                          currentPage: productsCRUDBloc.getCurrentPage(),
                          totalPage: productsCRUDBloc.getTotalPage(),
                          onPageChanged: (page) {
                            productsCRUDBloc.updateCurrentPage(page);
                            BlocProvider.of<ProductsBloc>(context).add(GetProductsData(page));
                          }));
                })
          ],
        ),
      ),
    );
  }
}
