import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/colors.dart';
import 'package:shoppos/core/util/widget/custom_button.dart';
import 'package:shoppos/features/add_products/presentation/bloc/add_product_bloc.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productcreate_bloc.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productcreate_event.dart';
import 'package:shoppos/features/add_products/presentation/pages/add_product_page.dart';

class AddProductPageStateContainer extends StatelessWidget {
  const AddProductPageStateContainer({
    Key? key,
    required this.subAttribute,
    required this.formGlobalKey,
    required this.productName,
    required this.costPrice,
    required this.quantity,
    required this.barcode,
    required this.description,
  }) : super(key: key);

  final List<SubAttribute> subAttribute;
  final GlobalKey<FormState> formGlobalKey;
  final TextEditingController productName;
  final TextEditingController costPrice;
  final TextEditingController quantity;
  final TextEditingController barcode;
  final TextEditingController description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: SizeConfig.safeBlockHorizontal! * 3),
      width: SizeConfig.screenWidth,
      child: Center(
        child: CustomButton(
          onTap: () {
            List _list = [];
            for (int i in addProductBloc.getSelectedSubAttribute()) {
              _list.add({"attribute": addProductBloc.getSelectedAttribute().id!, "value": subAttribute[i].name});
            }
            if (formGlobalKey.currentState!.validate()) {
              if (!addProductBloc.getImageHasValue()) {
                Fluttertoast.showToast(
                    msg: "Thumbnail Image is empty !!!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: infoColor,
                    textColor: Colors.white,
                    fontSize: SizeConfig.safeBlockHorizontal! * 3.5);
              } else if (!addProductBloc.getCategoryHasValue()) {
                Fluttertoast.showToast(
                    msg: "Category is empty !!!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: infoColor,
                    textColor: Colors.white,
                    fontSize: SizeConfig.safeBlockHorizontal! * 3.5);
              } else if (!addProductBloc.getBrandHasValue()) {
                Fluttertoast.showToast(
                    msg: "Brand is empty !!!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: infoColor,
                    textColor: Colors.white,
                    fontSize: SizeConfig.safeBlockHorizontal! * 3.5);
              } else if (!addProductBloc.getAttributeHasValue()) {
                Fluttertoast.showToast(
                    msg: "Attribute is empty !!!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: infoColor,
                    textColor: Colors.white,
                    fontSize: SizeConfig.safeBlockHorizontal! * 3.5);
              } else if (!addProductBloc.getStatusHasValue()) {
                Fluttertoast.showToast(
                    msg: "Status is empty !!!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: infoColor,
                    textColor: Colors.white,
                    fontSize: SizeConfig.safeBlockHorizontal! * 3.5);
              } else if (!addProductBloc.getMultipleImageHasValue()) {
                Fluttertoast.showToast(
                    msg: "Product Image is empty !!!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: infoColor,
                    textColor: Colors.white,
                    fontSize: SizeConfig.safeBlockHorizontal! * 3.5);
              } else {
                print(addProductBloc.getSelectedSubAttribute());
                BlocProvider.of<ProductCreateBloc>(context).add(GetProductCreateData(
                    addProductBloc.getImage(),
                    productName.text,
                    int.parse(costPrice.text),
                    int.parse(quantity.text),
                    addProductBloc.getSelectedCategory().id!,
                    addProductBloc.getSelectedBrand().id!,
                    addProductBloc.getSelectedAttribute().id!,
                    barcode.text,
                    description.text,
                    addProductBloc.getMultipleImage(),
                    addProductBloc.getStatus() == "Positive" ? true : false,
                    _list));
              }
            }
          },
          width: SizeConfig.screenWidth! * 0.9,
          buttonText: "Save",
          buttonColor: Theme.of(context).primaryColor,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
