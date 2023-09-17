import 'package:js/js.dart';

@JS()
class JSLibs
{
  @JS('checkServer')
  external String checkServer();  
}