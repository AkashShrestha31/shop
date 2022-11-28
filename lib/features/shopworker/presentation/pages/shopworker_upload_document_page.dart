import 'package:flutter/material.dart';
import 'package:shoppos/core/constants/SizeConfig.dart';
import 'package:shoppos/features/upload_document/presentation/widgets/upload_document_widget.dart';

class ShopworkerUploadDocumentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      child: SingleChildScrollView(child: UploadDocumentWidget()),
    );
  }
}
