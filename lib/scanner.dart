import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'component/button.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:toast/toast.dart';
import 'package:flutter_icons/flutter_icons.dart';

class QrScanner extends StatefulWidget {
  static String id = 'Qr Scanner';
  @override
  _QrScannerState createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  ScanResult result;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Scanner',
          style: TextStyle(color: Color(0xff616161)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffeeeeee),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BuildButton(
                text: 'Start Scan',
                onPressed: () {
                  scan();
                }),
            if (result != null)
              GestureDetector(
                onLongPress: () {
                  Clipboard.setData(new ClipboardData(text: result.rawContent));
                  showToast("Copied to Clipboard!", gravity: Toast.BOTTOM);
                },
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: ListTile(
                    trailing: Icon(FontAwesome.qrcode),
                    title: Text('PRODUCT'),
                    subtitle: Text(result.rawContent,
                        style: TextStyle(color: Color(0xff616161))),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future scan() async {
    try {
      var result = await BarcodeScanner.scan();
      setState(() => this.result = result);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          this.result.rawContent =
              'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.result.rawContent = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.result.rawContent =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.result.rawContent = 'Unknown error: $e');
    }
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}
