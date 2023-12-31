// @dart=2.9
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:salesiq_mobilisten/salesiq_mobilisten.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage( ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ key });
 
 
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isIOS || Platform.isAndroid) {
    String appKey;
    String accessKey;
    if (Platform.isIOS) {
        appKey = "INSERT_IOS_APP_KEY";
        accessKey = "INSERT_IOS_ACCESS_KEY";
    } else {
        appKey = "44b7v0hsqBZGdFygN9D0%2BIBAx99M5SIIqVuvgA264PuQ7bIxfMInpeVXSI3ITUDmu4qmYKCiYOGREuC4uyYeD290mNjS6htZ_in";
        accessKey = "VXYedrQX8SlVCETi4BG1v%2Fv6ful4rU%2FflRJ%2F%2B9Uh9pdDgG7p9WqlGwPImHQ7hKqC%2F3hNbdCZFjNecs68X7teNUuUQmjfp8ux0cxc2dFvLm%2BGBUAFp7rsp2vUZ6iJ4knuydszumRsB3ASiaGCtgZ0nduwIujkqzHT3pJ5O%2B0QkBrts0Z0umpbKY7GboUsDjvlfVR1XFfJ%2BpV9gD%2BgXFp6vQ%3D%3D";
    }
    ZohoSalesIQ.init(appKey, accessKey).then((_) {
        // initialization successful
        ZohoSalesIQ.showLauncher(true);
        ZohoSalesIQ.setVisitorName("Guest"); // Invoking showLauncher is optional.
    }).catchError((error) {
        // initialization failed
        print(error);
    });
}
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
