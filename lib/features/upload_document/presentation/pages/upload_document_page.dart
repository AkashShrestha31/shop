import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/core/util/widget/custom_button.dart';
import 'package:shoppos/features/upload_document/presentation/widgets/upload_document_widget.dart';

class UploadDocumentPage extends StatefulWidget {
  @override
  State<UploadDocumentPage> createState() => _UploadDocumentPageState();
}

class _UploadDocumentPageState extends State<UploadDocumentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
            child: Text(
          "Upload your documents",
          textScaleFactor: 1,
        )),
        actions: [
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 6,
          ),
        ],
      ),
      body: Container(
        height: SizeConfig.screenHeight,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: UploadDocumentWidget(),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(bottom: SizeConfig.safeBlockHorizontal! * 3),
                width: SizeConfig.screenWidth,
                child: Center(
                  child: CustomButton(
                    onTap: () {},
                    width: SizeConfig.screenWidth! * 0.9,
                    buttonText: "Save",
                    buttonColor: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
