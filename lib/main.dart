import 'package:flutter/material.dart';
import 'package:fweb/app/fweb_app.dart';

import 'package:js/js.dart';

import 'models/fwebmodel.dart';

// JSToDartApp theApp = const JSToDartApp();
// final _AppKey = GlobalKey();

void main() {
  // _updateAppWithWebContent = allowInterop(updateAppWithWebContent);  
  runApp(
    FWebModel(
      child: const JSToDartApp(),
    )
  );
}

/* @JS('updateAppWithWebContent')
external set _updateAppWithWebContent(void Function(String content) f);

updateAppWithWebContent(String webcontent)
{
  // print("A call made to the updateAppWithWebContent() with $webcontent");
  JSToDartApp.updateWebContent(webcontent);
} */

