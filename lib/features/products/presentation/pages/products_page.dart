import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/colors.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/loading_trasparent_screen.dart';
import 'package:shoppos/features/add_products/presentation/bloc/add_product_bloc.dart';
import 'package:shoppos/features/products/presentation/bloc/products.dart';
import 'package:shoppos/features/products/presentation/bloc/products_bloc.dart';
import 'package:shoppos/features/products/presentation/bloc/products_event.dart';
import 'package:shoppos/features/products/presentation/bloc/products_state.dart';
import 'package:shoppos/features/products/presentation/widgets/product_body_widget.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/settings_bloc.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/delete_product_widget.dart';
import 'package:shoppos/injection_container.dart';
import 'package:shoppos/routes/app_router.gr.dart';

class ProductsPage extends StatelessWidget {
  final String? name;

  ProductsPage({required this.name});

  @override
  Widget build(BuildContext context) {
    settingsBloc.updateScreenStatus(3);
    productsCRUDBloc.updateCurrentPage(1);
    productsCRUDBloc.updateTotalPage(1);
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<ProductsBloc>()..add(GetProductsData(1)),
          ),
          BlocProvider(
            create: (context) => sl<GetDeleteProductsBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<GetSearchProductsBloc>(),
          )
        ],
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0,
                title: Center(
                    child: Text(
                  name!,
                  textScaleFactor: 1,
                )),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal! * 3),
                    child: GestureDetector(
                        onTap: () {
                          // AutoRouter.of(context).push(CategoryArchiveRoute(name: name!));
                        },
                        child: SvgPicture.asset(scan, color: Colors.white, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown)),
                  ),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal! * 3,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal! * 3),
                    child: GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).push(CategoryArchiveRoute(name: name!));
                        },
                        child: SvgPicture.asset(archive, color: Colors.white, semanticsLabel: 'App Logo', fit: BoxFit.scaleDown)),
                  )
                ],
              ),
              body: const ProductBodyWidget(),
              floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
              floatingActionButton: Padding(
                padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
                child: FloatingActionButton(
                  // isExtended: true,
                  child: const Icon(Icons.add),
                  backgroundColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    addProductBloc.disposeFile();
                    AutoRouter.of(context).push(AddProductRoute(title: "Add Products"));
                  },
                ),
              ),
            ),
            StreamBuilder<int>(
                stream: settingsBloc.screen,
                initialData: 3,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    switch (snapshot.data) {
                      case 0:
                        return BlocBuilder<GetDeleteProductsBloc, ProductsState>(builder: (context, state) {
                          if (state is ProductsEmpty) {
                            return DeleteProductWidget(
                              name: "product",
                            );
                          } else if (state is ProductsLoading) {
                            return const LoadingTransparentScreen();
                          } else if (state is ProductsDeleteLoaded) {
                            productsCRUDBloc.deleteResult(productsCRUDBloc.getDeleteProduct());
                            settingsBloc.updateScreenStatus(3);
                            Fluttertoast.showToast(
                                msg: state.model.message!,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: infoColor,
                                textColor: Colors.white,
                                fontSize: SizeConfig.safeBlockHorizontal! * 3.5);
                          }
                          return Container();
                        });

                      case 11:
                        AutoRouter.of(context).push(const ProductDetailsRoute());
                        break;
                      case 13:
                        return LoadingTransparentScreen();
                      default:
                        return Container();
                    }
                  }
                  return Container();
                })
          ],
        ));
  }
}
