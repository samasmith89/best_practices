// we recommend using the modified analysis_options.yaml file from this project
// to assist you in writing clean code

// libraries, packages, directories, and source files name should be in
// lowercase_with_underscores (a.k.a snake_case)

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// use relative imports for files within the lib folder
import 'components/very_special_button.dart';
import 'data/extra_good_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Generally a good idea to lock the screen orientation unless you
  // intend to support all four orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // manually setting the colors for the status bar and navigation bar can
  // really improve the professionalism of your app.  These elements show up
  // on every page!  These can also be set dynamically per page
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor:
          Colors.white, // navigation bar doesn't accept Colors.transparent
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // always wrap your app in a MaterialApp widget
    return MaterialApp(
      title: 'Best Practices',
      // I like to hide the debug banner while working on the app
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white,
      ),
      // wrap your app (or individual pages) in a Scaffold
      home: const HomePage(title: 'Best Practices'),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title; // use final if not planning to mutate variable
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variable names are lowerCamelCase
  // Dart variable types - sometimes UpperCamelCase, sometimes lowerCamelCase
  // Number (int, double, num), String, bool, List, etc.
  String myString = '';
  Color myColor = const Color(0xFFFF0000);
  int myInt = 2;
  double myDouble = 4.0;

  // class instance lowerCamelCase, class name UpperCamelCase
  ExtraGoodData myData = ExtraGoodData();

  @override
  Widget build(BuildContext context) {
    // keep the build function as clean as possible

    return Scaffold(
      // Widgets are always UpperCamelCase "Scaffold"
      body: Center(
        // widget properties lowerCamelCase "body", "child", etc.
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title, // stateful widget, use "widget.title", not "title"
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            Text(
              'Count: ${myData.count}', // ${} if variable has a dot in it
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            // use SizedBox to create spacing in Rows and Columns
            const SizedBox(height: 20),
            VerySpecialButton(
              onPressed: () {
                setState(() {
                  myData.addToCount(1);
                });
              },
              label: 'Increase count',
              color: myData.count > 0 ? Colors.green : null, // ternary operator
            ),
            if (myData.count > 0) // if statement
              VerySpecialButton(
                onPressed: () {
                  setState(() {
                    myData.resetCount();
                  });
                },
                label: 'Reset count',
                color: Colors.red, // ternary operator
              ),
          ],
        ),
      ),
    );
  }
}
