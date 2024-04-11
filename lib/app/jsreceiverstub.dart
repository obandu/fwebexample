import 'package:flutter/material.dart';
import 'package:fweb/models/fwebmodel.dart';

import 'fweb_app.dart';

class JSReceiverStub{

  // The container fro the content from the web
  static final _contentContainer = {};

  const JSReceiverStub ();

  /* static updateWebContent(var contentFromWeb)
  {
    // _contentContainer['CONTENTFROMWEB'] = contentFromWeb;
    print("Data passed into receiver stub as  $contentFromWeb\n");
    print("---print context: ${NavigationService.navigatorKey.currentContext}\n");
    BuildContext? bcontext = NavigationService.navigatorKey.currentContext;
    if (bcontext != null)
    {
      FWebModel webModel = FWebModel.of(bcontext);
      print("Fweb model is $webModel\n");
    }
    // FWebModel webModel = FWebModel.of(NavigationService.navigatorKey.currentContext);
    // webModel.add({'EVENTNAME':'ADDDATAITEM', 'DATAITEMNAME' : 'WEBCONTENT', 'DATAITEMVALUE' :  contentFromWeb});    
  }

  get contentContainer => _contentContainer; */
  
}