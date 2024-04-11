import 'package:flutter/material.dart';
import 'package:fweb/models/fwebmodel.dart';
import 'package:js/js.dart';
import 'package:provider/provider.dart';

class JSToDartApp extends StatefulWidget {

  GlobalKey<NavigatorState> globalKey;
  JSToDartApp({super.key, required this.globalKey});
 
  @override
  State<StatefulWidget> createState() => JSToDartAppState();
}

class JSToDartAppState extends State<JSToDartApp>{

  @override
  void initState() {
    super.initState();
    // JUST CONFIRMING THAT WITH EVERY CALL TO APPLICATION
    // A STATE REBUILD IS CALLED ON THE HOME PAGE i.e. setState()    
    print("A call made to the Init state of MyHomePage ................ ");
  }

    @override
  Widget build(BuildContext context) {
    print("A call is made to rebuild +++++++++++++++");    
    // FWebModel webModel = FWebModel.of(context);
    // JSLibs jslibs = JSLibs();

    // SHORTHAND - IF NO CONTENT FROM SERVER YET, JUST SHOW THE TEXT 'NOTHING FROM WEB'
    // IF SOMETHING HAS BEEN LOADED, SHOW CONTENT
    // String theTextFromServer = webModel.getDataItemByName('WEBCONTENT') ?? "NOTHING FROM WEB YET !!!";

    return MaterialApp(
      title: 'JAVASCRIPT TO DART DEMO',
      navigatorKey: widget.globalKey, 
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('JAVASCRIPT TO DART DEMO'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'THE TEXT FROM SERVER IS ::',
              ),
              Consumer<FWebModel> (
                builder : (context, webModel, _) {
                  String theTextFromServer = webModel.getDataItemByName('WEBCONTENT') ?? "NOTHING FROM WEB YET !!!";
                  return Text('$theTextFromServer', style: Theme.of(context).textTheme.headlineMedium);
                },
                
              ),
            ],
          ),
        ),
        // USE THIS BUTTON TO ALSO CALL THE SERVER TO CHECK FOR
        // UPDATES FROM WITHIN APP
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          tooltip: 'Check Server',
          child: const Icon(Icons.add),
        ), 
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
