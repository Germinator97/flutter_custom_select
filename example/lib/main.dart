import 'package:flutter/material.dart';
import 'package:flutter_custom_selector/flutter_custom_selector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: const MyHomePage(title: 'Flutter_Custom_Selector Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> dataString = [
    "Pakistan",
    "Saudi Arabia",
    "UAE",
    "USA",
    "Turkey",
    "Brazil",
    "Tunisia",
    'Canada'
  ];
  String? selectedString;
  List<String>? selectedDataString;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        height: deviceHeight,
        width: deviceWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomSingleSelectField<String>(
              isBarrierDismissible: false,
              items: dataString,
              cancelText: "Fermer",
              cancelBackgroundColor: Colors.green,
              itemBackgroundColor: Colors.white,
              titleBackgroundColor: Colors.orange,
              separatorColor: Colors.blueGrey,
              separatorHeight: 3,
              cancelTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              itemTextStyle: const TextStyle(
                color: Colors.deepPurple,
                fontSize: 20,
              ),
              title: "Countries",
              titleTextStyle: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                // decoration: TextDecoration.underline,
              ),
              onSelectionDone: (value) {
                selectedString = value;
                setState(() {});
              },
              itemAsString: (item) => item,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomMultiSelectField<String>(
              title: "Country",
              items: dataString,
              enableAllOptionSelect: true,
              onSelectionDone: _onCountriesSelectionComplete,
              itemAsString: (item) => item.toString(),
            ),
          ],
        ),
      ),
    );
  }

  void _onCountriesSelectionComplete(value) {
    selectedDataString?.addAll(value);
    setState(() {});
  }
}
