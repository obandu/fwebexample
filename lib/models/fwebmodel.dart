import 'package:flutter/material.dart';

import '../utils/logger.dart';

class FWebModel extends InheritedWidget with ChangeNotifier 
{
  static final _state = {};

  FWebModel({required super.child});

  static FWebModel? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FWebModel>();
  }

  static FWebModel of(BuildContext context) {
    final FWebModel? result = maybeOf(context);
    assert(result != null, 'The FWebModel is not found in context');
    // Logger.doConsoleLog("The result/model is $result");
    return result!;
  } 

  @override
  // NOTIFY ON ALL UPDATES REGARDLESS
  bool updateShouldNotify(Widget oldWidget) {
    // Logger.doConsoleLog('Update should notify is called with state as  $_state and \n Old widget state is ${oldWidget}');
    return true; // jsReceiverStub.contentContainer != oldWidget.jsReceiverStub.contentContainer;
  }

  void add(Map event)
  {
    var eventName = event['EVENTNAME'];
    // Logger.doConsoleLog('Event called with $eventName');
    switch(eventName)
    {
      case 'SIGNIN' :
        Logger.doConsoleLog('Call to sign in');
        _state['SIGNIN_STATUS'] = 'LOGGED IN';
        break;
      case 'ADDDATAITEM':
        var dataItemName = event['DATAITEMNAME'];
        var dataItemValue = event['DATAITEMVALUE'];
        _state[dataItemName] = dataItemValue;
        notifyListeners();
      default:
        Logger.doConsoleLog('Event called but not named $eventName');
    }
  }

  getDataItemByName(var dataItemName)
  {
    if (_state.containsKey(dataItemName))
    {
      return _state[dataItemName];
    }
    else
    {
      return null;
    }
  }
  
}