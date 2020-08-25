import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'dart:ui';

import 'package:flutter/rendering.dart';

class QrGenerator extends StatefulWidget {
  static String id = 'Qr Generator';
  @override
  _QrGeneratorState createState() => _QrGeneratorState();
}

class _QrGeneratorState extends State<QrGenerator> {
  static const double _topSectionTopPadding = 50.0;
  static const double _topSectionBottomPadding = 50.0;
  static const double _topSectionHeight = 50.0;

  GlobalKey globalKey = new GlobalKey();
  String _dataString = "https://www.linkedin.com/in/shikumi";
  String _inputErrorText;
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text('Generator', style: TextStyle(color: Color(0xff616161))),
          centerTitle: true,
          backgroundColor: Color(0xffeeeeee)),
      body: _buildContent(),
    );
  }

  Container _buildContent() {
    final bodyHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;
    return Container(
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: Center(
              child: RepaintBoundary(
                key: globalKey,
                child: QrImage(data: _dataString, size: 0.4 * bodyHeight),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: _topSectionTopPadding,
                  left: 20.0,
                  right: 10.0,
                  bottom: _topSectionBottomPadding),
              child: Container(
                height: _topSectionHeight,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                            hintText: "Enter Data/Link",
                            errorText: _inputErrorText),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: CupertinoButton(
                        child: Text("CREATE"),
                        onPressed: () {
                          setState(() {
                            if (_textController.text.isNotEmpty) {
                              _dataString = _textController.text;
                            } else {
                              _inputErrorText = 'Text Field Empty';
                            }
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
