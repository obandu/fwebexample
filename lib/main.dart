import 'package:flutter/material.dart';
import 'package:js/js.dart';

import 'package:fweb/app/fweb_app.dart';
import 'package:provider/provider.dart';

import 'models/fwebmodel.dart';

class NavigationService { 
  static GlobalKey<NavigatorState> navigatorKey = 
  GlobalKey<NavigatorState>();
}

void main() {
  _updateAppWithWebContent = allowInterop(updateAppWithWebContent);    
  runApp(
    ChangeNotifierProvider(
      create: (_) => FWebModel(child: Text("main model here ..."),),
      builder: (context, child) {
        return JSToDartApp(globalKey: NavigationService.navigatorKey,);
      }, 
      lazy: false,
      // child: JSToDartApp(globalKey: globalNavigatorKey,)
    )
  );
}

@JS('updateAppWithWebContent')
external set _updateAppWithWebContent(void Function(String content) f);

updateAppWithWebContent(String webcontent)
{
  print("A call made to the updateAppWithWebContent() with $webcontent");
  BuildContext? bcontext = NavigationService.navigatorKey.currentContext;
  // ChangeNotifierProvider cnp = Provider.of(bcontext!, listen:false);
  print("BuildContext is $bcontext and provider is ");
  if (bcontext != null)
  {
    FWebModel webModel = FWebModel.of(bcontext!);
    print("Fweb model is $webModel\n");    
    // FWebModel webModel = FWebModel.of(bcontext, listen:false);

    /* FWebModel webModel = cnp.builder
    print("Fweb model is $webModel\n");
    webModel.add({'EVENTNAME':'ADDDATAITEM', 'DATAITEMNAME' : 'WEBCONTENT', 'DATAITEMVALUE' :  webcontent});  */
  } 
  else
  {
    print("Fweb model is NOT FOUND IN CONTEXT and context is $bcontext\n");
  } 
} 

 

