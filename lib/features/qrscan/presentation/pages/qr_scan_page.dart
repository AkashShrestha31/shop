import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shoppos/features/qrscan/presentation/widgets/qr_widget.dart';

class QRScanPage extends StatefulWidget {
  @override
  State<QRScanPage> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  Future<PermissionStatus> _getCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      final result = await Permission.camera.request();
      return result;
    } else {
      return status;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // PermissionStatus status = await _getCameraPermission();
    // print("The status is $status");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRViewExample(),
    );
  }
}
