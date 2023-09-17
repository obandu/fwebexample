import 'package:flutter/material.dart';
import 'package:fweb/models/fwebmodel.dart';
import 'package:js/js.dart';

@JS()
class JSToDartApp extends StatelessWidget {

  const JSToDartApp({super.key});

  // The application state
  static final modelContainer = {};

  @override
  Widget build(BuildContext context) {
    // print("A call made to the build APP ................ ");
  _updateAppWithWebContent = allowInterop(updateAppWithWebContent);      
    modelContainer["WEBMODEL"] = FWebModel.of(context);
    return MaterialApp(
      title: 'JAVASCRIPT TO DART DEMO',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'JAVASCRIPT TO DART DEMO'),
    );
  }

  static updateWebContent(var newState)
  {
    FWebModel webModel = JSToDartApp.modelContainer["WEBMODEL"];
    webModel.add({'EVENTNAME':'ADDDATAITEM', 'DATAITEMNAME' : 'WEBCONTENT', 'DATAITEMVALUE' :  newState});
    // print("State update called in the app and the new state is $newState");
  }

  @JS('updateAppWithWebContent')
  external set _updateAppWithWebContent(void Function(String content) f);

  updateAppWithWebContent(String webcontent)
  {
    // print("A call made to the updateAppWithWebContent() with $webcontent");
    JSToDartApp.updateWebContent(webcontent);
  }  
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
 
}


class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    // JUST CONFIRMING THAT WITH EVERY CALL TO APPLICATION
    // A STATE REBUILD IS CALLED ON THE HOME PAGE i.e. setState()
    print("A call made to the Init state of MyHomePage ................ ");
  }

  @override
  Widget build(BuildContext context) {
    FWebModel webModel = FWebModel.of(context);
    // JSLibs jslibs = JSLibs();

    // SHORTHAND - IF NO CONTENT FROM SERVER YET, JUST SHOW THE TEXT 'NOTHING FROM WEB'
    // IF SOMETHING HAS BEEN LOADED, SHOW CONTENT
    String theTextFromServer = webModel.getDataItemByName('WEBCONTENT') ?? "NOTHING FROM WEB YET !!!";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'THE TEXT FROM SERVER IS ::',
            ),
            Text(
              '$theTextFromServer',
              style: Theme.of(context).textTheme.headlineMedium,
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
 
}
