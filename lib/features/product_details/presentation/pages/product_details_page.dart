import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/util/widget/custom_button.dart';
import 'package:shoppos/features/add_products/presentation/bloc/add_product_bloc.dart';
import 'package:shoppos/features/products/data/models/products_model.dart';
import 'package:shoppos/features/products/presentation/bloc/products.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/details_row_widget.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';
import 'package:shoppos/routes/app_router.gr.dart';

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Results result = productsCRUDBloc.getDeleteProduct();
    List<String> subattribute = [];
    for (int i = 0; i < result.variants!.length; i++) {
      subattribute.add(result.variants![i].value!);
    }
    String varient = subattribute.join(",");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Center(
            child: Text(
          "Product Details",
          textScaleFactor: 1,
        )),
        actions: [
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 6,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(text: "Thumbnail", scale: SizeConfig.safeBlockHorizontal! * 0.3),
                    result.thumbnail != null
                        ? Container(
                            height: SizeConfig.screenHeight! * 0.08,
                            width: SizeConfig.screenHeight! * 0.08,
                            decoration:
                                BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 3)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 2),
                              child: Image.network(
                                result.thumbnail!,
                                height: SizeConfig.screenHeight! * 0.08,
                                width: SizeConfig.screenHeight! * 0.08,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        : TextWidget(text: "No Thumbnail", scale: 1.2),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal! * 4,
              ),
              Column(
                children: [
                  DetailsRowWidget(
                    leftText: "Product Name",
                    rightText: result.productName,
                    textAlign: TextAlign.right,
                    padding: SizeConfig.safeBlockHorizontal! * 4,
                    backgroundColor: Colors.grey[200],
                  ),
                  DetailsRowWidget(
                    leftText: "Category Name",
                    rightText: result.categoryName,
                    textAlign: TextAlign.right,
                    padding: SizeConfig.safeBlockHorizontal! * 4,
                    backgroundColor: Colors.white,
                  ),
                  DetailsRowWidget(
                    leftText: "Attribute Name",
                    rightText: result.attribute ?? "",
                    textAlign: TextAlign.right,
                    padding: SizeConfig.safeBlockHorizontal! * 4,
                    backgroundColor: Colors.grey[200],
                  ),
                  DetailsRowWidget(
                    leftText: "Sub-attribute Name",
                    rightText: varient,
                    textAlign: TextAlign.right,
                    padding: SizeConfig.safeBlockHorizontal! * 4,
                    backgroundColor: Colors.white,
                  ),
                  DetailsRowWidget(
                    leftText: "Quantity",
                    rightText: result.quantity.toString() + " Pieces",
                    textAlign: TextAlign.right,
                    padding: SizeConfig.safeBlockHorizontal! * 4,
                    backgroundColor: Colors.grey[200],
                  ),
                  DetailsRowWidget(
                    leftText: "Status",
                    rightText: result.status! ? "Active" : "InActive",
                    rightTextColor: Colors.green,
                    textAlign: TextAlign.right,
                    padding: SizeConfig.safeBlockHorizontal! * 4,
                    backgroundColor: Colors.white,
                  ),
                  DetailsRowWidget(
                    leftText: "Barcode",
                    rightText: result.barcode ?? "No Barcode found",
                    textAlign: TextAlign.right,
                    padding: SizeConfig.safeBlockHorizontal! * 4,
                    backgroundColor: Colors.grey[200],
                  ),
                  DetailsRowWidget(
                    leftText: "Description",
                    textAlign: TextAlign.right,
                    padding: SizeConfig.safeBlockHorizontal! * 4,
                    rightText: result.description ?? "No Description",
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal! * 4,
              ),
              Row(
                children: [
                  Container(
                    height: SizeConfig.screenHeight! * 0.15,
                    width: SizeConfig.screenWidth! * 0.92,
                    decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 1)),
                    child: Padding(
                      padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(text: "Images", scale: SizeConfig.safeBlockHorizontal! * 0.3),
                          result.productImage!.length != 0
                              ? SizedBox(
                                  height: SizeConfig.screenHeight! * 0.08,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: result.productImage!.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return SizedBox(
                                            height: SizeConfig.screenHeight! * 0.08,
                                            width: SizeConfig.screenWidth! * 0.18,
                                            child: Image.network(result.productImage![index].image!));
                                      }),
                                )
                              : TextWidget(text: "No Image Found.", scale: 1.2)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.safeBlockHorizontal! * 4,
              ),
              Container(
                padding: EdgeInsets.only(bottom: SizeConfig.safeBlockHorizontal! * 3),
                width: SizeConfig.screenWidth,
                child: Center(
                  child: CustomButton(
                    onTap: () {
                      addProductBloc.disposeFile();
                      addProductBloc.updateStatus(result.status! ? "Positive" : "Negative");
                      addProductBloc.updateSelectCategory(Data(name: result.categoryName, id: result.categoryid));
                      addProductBloc.updateSelectBrand(Data(name: result.brandName, id: result.brandid));
                      addProductBloc.updateSelectAtribute(Data(name: result.attribute, id: result.attributeid));
                      addProductBloc.updateProductName(result.productName!);
                      addProductBloc.updateQuantity(result.quantity.toString());
                      addProductBloc.updateCost(result.costPrice.toString());
                      addProductBloc.updateDescription(result.description ?? " ");
                      addProductBloc.updateThumbnailImageLink(result.thumbnail ?? "");
                      for (int i = 0; i < result.productImage!.length; i++) {
                        addProductBloc.updateMultipleImage(result.productImage![i].image!);
                      }
                      AutoRouter.of(context).push(AddProductRoute(title: "Update Products"));
                    },
                    width: SizeConfig.screenWidth! * 0.9,
                    buttonText: "Update",
                    buttonColor: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
