import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/constants/colors.dart';
import 'package:shoppos/core/constants/constant.dart';
import 'package:shoppos/core/constants/strings.dart';
import 'package:shoppos/core/util/widget/box_form_field.dart';
import 'package:shoppos/core/util/widget/custom_button.dart';
import 'package:shoppos/core/util/widget/custom_button_with_icon.dart';
import 'package:shoppos/core/util/widget/custom_formfield_with_icon.dart';
import 'package:shoppos/core/util/widget/dropdown/custom_dropdown_button2.dart';
import 'package:shoppos/core/util/widget/loading_trasparent_screen.dart';
import 'package:shoppos/features/add_products/presentation/bloc/add_product_bloc.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productattribute_bloc.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productattribute_event.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productattribute_state.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productbrand_bloc.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productbrand_event.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productbrand_state.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productcategory_bloc.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productcategory_event.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productcategory_state.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productcreate_bloc.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productcreate_state.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productsubattribute_bloc.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productsubattribute_event.dart';
import 'package:shoppos/features/add_products/presentation/bloc/productsubattribute_state.dart';
import 'package:shoppos/features/add_products/presentation/widgets/__add_product_page_state_container.dart';
import 'package:shoppos/features/setting_items_description/presentation/bloc/settings_bloc.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/delete_product_widget.dart';
import 'package:shoppos/features/setting_items_description/presentation/widgets/text_widget.dart';
import 'package:shoppos/injection_container.dart';

class SubAttribute {
  final int? id;
  final String? name;
  final String? status;

  SubAttribute({required this.id, required this.name, required this.status});
}

class AddProductPage extends StatefulWidget {
  String? title;

  AddProductPage({required this.title});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController productName = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController barcode = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController costPrice = TextEditingController();
  GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();
  List<String>? attribute = [];
  List<int>? attributeid = [];
  List<String> status = ["Positive", "Negative"];
  List<SubAttribute> subAttribute = [];
  List<String>? brand = [];
  List<int>? brandid = [];
  List<String>? category = [];
  List<int>? categoryid = [];
  String? selectedAttribute;

  _loadPicker(ImageSource source, bool single) async {
    final _picker = ImagePicker();
    var picked = await _picker.pickImage(source: source);
    final File file = File(picked!.path);
    if (picked != null) {
      _cropImage(file, single);
    }
    Navigator.pop(context);
  }

  _cropImage(File? picked, bool single) async {
    CroppedFile? cropped = await ImageCropper().cropImage(
      uiSettings: [
        AndroidUiSettings(
          statusBarColor: Colors.red,
          toolbarColor: Colors.red,
          toolbarTitle: "Crop Image",
          toolbarWidgetColor: Colors.white,
        ),
      ],
      sourcePath: picked!.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio4x3,
      ],
      maxWidth: 800,
    );
    if (cropped != null && single) {
      addProductBloc.updateThumbnailImage(File(cropped.path));
    } else if (cropped != null && !single) {
      addProductBloc.updateMultipleImage(File(cropped.path));
    }
  }

  void _showPickOptionsDialog(BuildContext context, bool single) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(
              onTap: () {
                _loadPicker(ImageSource.gallery, single);
              },
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.image,
                    size: SizeConfig.safeBlockHorizontal! * 5,
                  ),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal! * 3,
                  ),
                  const Text("Pick From Gallery",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal! * 4,
            ),
            InkWell(
              onTap: () {
                _loadPicker(ImageSource.camera, single);
              },
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.camera,
                    size: SizeConfig.safeBlockHorizontal! * 5,
                  ),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal! * 3,
                  ),
                  const Text("Take from Camera",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    productName.text = addProductBloc.getProductName();
    quantity.text = addProductBloc.getQuantity();
    costPrice.text = addProductBloc.getCost();
    description.text = addProductBloc.getDescription();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ProductAttributeBloc>()..add(GetProductAttributeData())),
        BlocProvider(create: (_) => sl<ProductBrandBloc>()..add(GetProductBrandData())),
        BlocProvider(create: (_) => sl<ProductCategoryBloc>()..add(GetProductCategoryData())),
        BlocProvider(
          create: (context) => sl<ProductSubAttributeBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<ProductCreateBloc>(),
        )
      ],
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Center(
                  child: Text(
                widget.title!,
                textScaleFactor: 1,
              )),
              actions: [
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal! * 6,
                ),
              ],
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Form(
                    key: formGlobalKey,
                    child: Container(
                      padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal! * 4),
                      width: SizeConfig.screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextWidget(text: "Thumbnail img", scale: SizeConfig.safeBlockHorizontal! * 0.3),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 4,
                          ),
                          Row(
                            children: [
                              CustomButtonIcon(
                                onTap: () {
                                  _showPickOptionsDialog(context, true);
                                },
                                width: SizeConfig.screenWidth! * 0.3,
                                height: SizeConfig.screenHeight! * 0.05,
                                buttonText: "Upload",
                                buttonColor: Colors.white,
                                borderColor: Colors.grey,
                                textColor: Colors.black,
                                icon: upload,
                                iconColor: Colors.black,
                              ),
                              SizedBox(
                                width: SizeConfig.blockSizeHorizontal! * 4,
                              ),
                              addProductBloc.getImageLink().isEmpty
                                  ? StreamBuilder<File>(
                                      stream: addProductBloc.thumbnailImage,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return snapshot.data!.path != "empty"
                                              ? Container(
                                                  height: SizeConfig.screenHeight! * 0.05,
                                                  width: SizeConfig.screenHeight! * 0.05,
                                                  child: Image.file(snapshot.data!))
                                              : Container();
                                        }
                                        return Container();
                                      })
                                  : Container(
                                      height: SizeConfig.screenHeight! * 0.05,
                                      width: SizeConfig.screenHeight! * 0.05,
                                      child: Image.network(addProductBloc.getImageLink()))
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 6,
                          ),
                          TextWidget(text: "Product Name", scale: 1.3),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 4,
                          ),
                          BoxTextField(
                            controller: productName,
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            hint: "Product Name",
                            validator: (name) {
                              if (name!.isEmpty) {
                                return "Name is empty !!!";
                              }
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 6,
                          ),
                          TextWidget(text: "Category Name", scale: 1.3),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 4,
                          ),
                          BlocBuilder<ProductCategoryBloc, ProductCategoryState>(builder: (context, state) {
                            if (state is ProductCategoryLoaded) {
                              for (int i = 0; i < state.model.results!.length; i++) {
                                category!.add(state.model.results![i].categoryName!);
                                categoryid!.add(state.model.results![i].id!);
                              }
                              category = [
                                ...{...category!}
                              ];
                            }
                            return StreamBuilder<Data>(
                                stream: addProductBloc.selectCategory,
                                initialData: null,
                                builder: (context, snapshot) {
                                  return CustomDropdownButton2(
                                    buttonWidth: SizeConfig.screenWidth!,
                                    buttonHeight: SizeConfig.screenHeight! * 0.06,
                                    dropdownWidth: SizeConfig.screenWidth! * 0.9,
                                    hint: 'Select Category',
                                    dropdownItems: category!,
                                    value: snapshot.hasData ? (addProductBloc.getSelectedCategory().name == null ? null : snapshot.data!.name) : null,
                                    onChanged: (value) {
                                      addProductBloc.updateSelectCategory(Data(id: categoryid![category!.indexOf(value!)], name: value));
                                    },
                                  );
                                });
                          }),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 6,
                          ),
                          TextWidget(text: "Brand Name", scale: 1.3),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 4,
                          ),
                          BlocBuilder<ProductBrandBloc, ProductBrandState>(builder: (context, state) {
                            if (state is ProductBrandLoaded) {
                              for (int i = 0; i < state.model.results!.length; i++) {
                                brand!.add(state.model.results![i].brandName!);
                                brandid!.add(state.model.results![i].id!);
                              }

                              brand = [
                                ...{...brand!}
                              ];
                            }
                            return StreamBuilder<Data>(
                                stream: addProductBloc.selectBrand,
                                initialData: null,
                                builder: (context, snapshot) {
                                  return CustomDropdownButton2(
                                    buttonWidth: SizeConfig.screenWidth!,
                                    buttonHeight: SizeConfig.screenHeight! * 0.06,
                                    dropdownWidth: SizeConfig.screenWidth! * 0.9,
                                    hint: 'Select Brand',
                                    dropdownItems: brand!,
                                    value: snapshot.hasData ? (addProductBloc.getSelectedBrand().name == null ? null : snapshot.data!.name) : null,
                                    onChanged: (value) {
                                      addProductBloc.updateSelectBrand(Data(id: brandid![brand!.indexOf(value!)], name: value));
                                    },
                                  );
                                });
                          }),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 6,
                          ),
                          TextWidget(text: "Attribute Name", scale: 1.3),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 4,
                          ),
                          BlocBuilder<ProductAttributeBloc, ProductAttributeState>(builder: (context, state) {
                            if (state is ProductAttributeLoaded) {
                              for (int i = 0; i < state.model.results!.length; i++) {
                                attribute!.add(state.model.results![i].attributeName!);
                                attributeid!.add(state.model.results![i].id!);
                              }
                              attribute = [
                                ...{...attribute!}
                              ];
                            }
                            return StreamBuilder<Data>(
                                stream: addProductBloc.selectAttribute,
                                builder: (context, snapshot) {
                                  return CustomDropdownButton2(
                                    buttonWidth: SizeConfig.screenWidth!,
                                    buttonHeight: SizeConfig.screenHeight! * 0.06,
                                    dropdownWidth: SizeConfig.screenWidth! * 0.9,
                                    hint: 'Select Attribute',
                                    dropdownItems: attribute!,
                                    value:
                                        snapshot.hasData ? (addProductBloc.getSelectedAttribute().name == null ? null : snapshot.data!.name) : null,
                                    onChanged: (value) {
                                      addProductBloc.updateSelectAtribute(Data(id: attributeid![attribute!.indexOf(value!)], name: value));
                                      BlocProvider.of<ProductSubAttributeBloc>(context).add(GetProductSubAttributeData(value));
                                    },
                                  );
                                });
                          }),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 6,
                          ),
                          BlocBuilder<ProductSubAttributeBloc, ProductSubAttributeState>(builder: (context, state) {
                            if (state is ProductSubAttributeLoaded) {
                              for (int i = 0; i < state.model.results!.length; i++) {
                                subAttribute.add(SubAttribute(
                                    id: state.model.results![i].id,
                                    name: state.model.results![i].value,
                                    status: state.model.results![i].status! ? "Active" : "InActive"));
                              }
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(text: "Sub-attribute", scale: 1.4),
                                  SizedBox(
                                    height: SizeConfig.safeBlockHorizontal! * 4,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showMaterialModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) => Container(
                                                height: SizeConfig.screenHeight! * 0.5,
                                                width: SizeConfig.screenWidth,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                      topRight: Radius.circular(SizeConfig.safeBlockHorizontal! * 8),
                                                      topLeft: Radius.circular(SizeConfig.safeBlockHorizontal! * 8)),
                                                  color: Constant.textFieldBackgroundColor,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: SizeConfig.safeBlockHorizontal! * 6,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: SizeConfig.safeBlockHorizontal! * 6, right: SizeConfig.safeBlockHorizontal! * 6),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          IconButton(
                                                              onPressed: () {
                                                                Navigator.of(context).pop();
                                                              },
                                                              icon: const Icon(
                                                                Icons.close,
                                                                color: Colors.black,
                                                              )),
                                                          TextWidget(
                                                            text: "Select Sub-attribute",
                                                            scale: SizeConfig.safeBlockHorizontal! * 0.3,
                                                            weight: FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                          SizedBox(
                                                            width: SizeConfig.safeBlockHorizontal! * 6,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    const Divider(
                                                      color: Colors.grey,
                                                    ),
                                                    SizedBox(
                                                      height: SizeConfig.safeBlockHorizontal! * 6,
                                                    ),
                                                    Container(
                                                      height: SizeConfig.screenHeight! * 0.25,
                                                      margin: EdgeInsets.only(
                                                          left: SizeConfig.safeBlockHorizontal! * 4, right: SizeConfig.safeBlockHorizontal! * 4),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 2),
                                                        color: Colors.white,
                                                      ),
                                                      child: StreamBuilder<List<int>>(
                                                          stream: addProductBloc.selectSubAttribute,
                                                          builder: (context, snapshot) {
                                                            return ListView.builder(
                                                                padding: const EdgeInsets.all(0),
                                                                shrinkWrap: true,
                                                                itemCount: subAttribute.length,
                                                                itemBuilder: (context, i) {
                                                                  return InkWell(
                                                                    onTap: () {
                                                                      if (addProductBloc.getSelectedSubAttribute().contains(i)) {
                                                                        addProductBloc.removeSelectSubAtribute(i);
                                                                      } else {
                                                                        addProductBloc.updateSelectSubAtribute(i);
                                                                      }
                                                                    },
                                                                    child: Container(
                                                                      color: addProductBloc.getSelectedSubAttribute().contains(i)
                                                                          ? Colors.grey
                                                                          : Colors.white,
                                                                      child: Padding(
                                                                        padding: EdgeInsets.only(
                                                                            left: SizeConfig.safeBlockHorizontal! * 6,
                                                                            right: SizeConfig.safeBlockHorizontal! * 6,
                                                                            top: SizeConfig.safeBlockHorizontal! * 4,
                                                                            bottom: SizeConfig.safeBlockHorizontal! * 4),
                                                                        child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.check_circle,
                                                                                  color: Theme.of(context).primaryColor,
                                                                                ),
                                                                                SizedBox(
                                                                                  width: SizeConfig.safeBlockHorizontal! * 4,
                                                                                ),
                                                                                TextWidget(
                                                                                  text: subAttribute[i].name,
                                                                                  scale: 1.2,
                                                                                  color: Colors.black,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            TextWidget(
                                                                              text: subAttribute[i].status!,
                                                                              scale: 1.2,
                                                                              color: Colors.black,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                });
                                                          }),
                                                    ),
                                                    SizedBox(
                                                      height: SizeConfig.safeBlockHorizontal! * 4,
                                                    ),
                                                    Center(
                                                      child: CustomButton(
                                                        onTap: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        width: SizeConfig.screenWidth! * 0.9,
                                                        buttonText: "Done",
                                                        buttonColor: Theme.of(context).primaryColor,
                                                        textColor: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ));
                                    },
                                    child: Container(
                                      height: SizeConfig.screenHeight! * 0.06,
                                      width: SizeConfig.screenWidth,
                                      decoration: BoxDecoration(
                                          color: Constant.textFieldBackgroundColor,
                                          borderRadius: BorderRadius.all(Radius.circular(SizeConfig.safeBlockHorizontal! * 2))),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(left: SizeConfig.safeBlockHorizontal! * 6, right: SizeConfig.safeBlockHorizontal! * 6),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.check_circle,
                                                  color: Theme.of(context).primaryColor,
                                                ),
                                                SizedBox(
                                                  width: SizeConfig.safeBlockHorizontal! * 5,
                                                ),
                                                TextWidget(text: "Sub-attribute", scale: 1.3),
                                              ],
                                            ),
                                            const Icon(Icons.keyboard_arrow_down)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.safeBlockHorizontal! * 6,
                                  ),
                                  TextWidget(text: "Barcode", scale: 1.3),
                                  SizedBox(
                                    height: SizeConfig.safeBlockHorizontal! * 4,
                                  ),
                                  CustomFormFieldWithIcon(
                                    controller: barcode,
                                    suffix: Padding(
                                      padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal! * 3),
                                      child: SvgPicture.asset(frame, fit: BoxFit.scaleDown),
                                    ),
                                    hint: "Barcode",
                                    validator: (password) {},
                                  ),
                                  SizedBox(
                                    height: SizeConfig.safeBlockHorizontal! * 6,
                                  ),
                                ],
                              );
                            }
                            return Container();
                          }),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(text: "Quantity", scale: 1.2),
                                  SizedBox(
                                    height: SizeConfig.safeBlockHorizontal! * 4,
                                  ),
                                  BoxTextField(
                                    controller: quantity,
                                    keyboardType: TextInputType.number,
                                    width: SizeConfig.screenWidth! * 0.45,
                                    readOnly: false,
                                    hint: "Quantity",
                                    suffix: SvgPicture.asset(rate, fit: BoxFit.scaleDown),
                                    validator: (name) {
                                      if (name!.isEmpty) {
                                        return "Quantity is empty !!!";
                                      }
                                    },
                                    onTap: () async {},
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(text: "Status", scale: 1.2),
                                  SizedBox(
                                    height: SizeConfig.safeBlockHorizontal! * 4,
                                  ),
                                  StreamBuilder<String>(
                                      stream: addProductBloc.status,
                                      builder: (context, snapshot) {
                                        return CustomDropdownButton2(
                                          buttonWidth: SizeConfig.screenWidth! * 0.45,
                                          buttonHeight: SizeConfig.screenHeight! * 0.06,
                                          dropdownWidth: SizeConfig.screenWidth! * 0.4,
                                          hint: 'Select',
                                          dropdownItems: status,
                                          value: addProductBloc.getStatus() == "" ? null : snapshot.data,
                                          onChanged: (value) {
                                            // setState(() {
                                            //   selectedValue = value;
                                            // });
                                            addProductBloc.updateStatus(value!);
                                          },
                                        );
                                      }),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 6,
                          ),
                          TextWidget(text: "Cost Price", scale: 1.3),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 4,
                          ),
                          BoxTextField(
                            controller: costPrice,
                            autofocus: false,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            hint: "Cost Price",
                            validator: (name) {
                              if (name!.isEmpty) {
                                return "Cost Price is empty !!!";
                              }
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 6,
                          ),
                          TextWidget(text: "Description", scale: 1.3),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 4,
                          ),
                          BoxTextField(
                            controller: description,
                            isMulti: true,
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            hint: "Description",
                            validator: (name) {
                              if (name!.isEmpty) {
                                return "Description is empty !!!";
                              }
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 4,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(text: "Images", scale: SizeConfig.safeBlockHorizontal! * 0.3),
                              SizedBox(
                                height: SizeConfig.safeBlockHorizontal! * 4,
                              ),
                              InkWell(
                                onTap: () {
                                  _showPickOptionsDialog(context, false);
                                },
                                child: Container(
                                  height: SizeConfig.screenHeight! * 0.08,
                                  width: SizeConfig.screenWidth! * 0.18,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200], borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal! * 3)),
                                  child: const Icon(Icons.add_a_photo),
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.safeBlockHorizontal! * 4,
                              ),
                              StreamBuilder<List<dynamic>>(
                                  stream: addProductBloc.multipleImage,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return SizedBox(
                                        height: SizeConfig.screenHeight! * 0.08,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: snapshot.data!.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return SizedBox(
                                                  height: SizeConfig.screenHeight! * 0.08,
                                                  width: SizeConfig.screenWidth! * 0.18,
                                                  child: snapshot.data![index].runtimeType == String
                                                      ? Stack(
                                                          alignment: Alignment.center,
                                                          children: [
                                                            Image.network(snapshot.data![index]),
                                                            InkWell(
                                                              onTap: () {
                                                                settingsBloc.updateScreenStatus(20);
                                                              },
                                                              child: CircleAvatar(
                                                                radius: SizeConfig.blockSizeHorizontal! * 3,
                                                                child: const Icon(Icons.close),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      : Image.file(snapshot.data![index]));
                                            }),
                                      );
                                    }
                                    return Container();
                                  })
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockHorizontal! * 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: BlocBuilder<ProductCreateBloc, ProductCreateState>(
                    builder: (context, state) {
                      if (state is ProductCreateLoading) {
                        return LoadingTransparentScreen();
                      }
                      if (state is ProductCreateLoaded) {
                        context.router.pop();
                        Fluttertoast.showToast(
                            msg: state.model.message!,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: infoColor,
                            textColor: Colors.white,
                            fontSize: SizeConfig.safeBlockHorizontal! * 3.5);
                      }
                      return AddProductPageStateContainer(
                          subAttribute: subAttribute,
                          formGlobalKey: formGlobalKey,
                          productName: productName,
                          costPrice: costPrice,
                          quantity: quantity,
                          barcode: barcode,
                          description: description);
                    },
                  ),
                ),
              ],
            ),
          ),
          StreamBuilder<int>(
              stream: settingsBloc.screen,
              initialData: 3,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  switch (snapshot.data) {
                    case 20:
                      return DeleteProductWidget(name: "image");
                    case 23:
                      return const LoadingTransparentScreen();
                    default:
                      return Container();
                  }
                }
                return Container();
              })
        ],
      ),
    );
  }
}
