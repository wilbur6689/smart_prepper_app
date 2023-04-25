import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:preperlist/src/ui/home_page.dart';
import '/firebase_options.dart';

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final ThemeData themeData =
      ThemeData(canvasColor: const Color.fromARGB(255, 189, 225, 242));

  MyApp({super.key});

  // MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Smart Prepper App',
        theme: themeData,
        home: FutureBuilder(
          future: _fbApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('You have an error ${snapshot.error.toString()}');
              return const Text('Something broke 1');
            } else if (snapshot.hasData) {
              return const MyHomePage(title: 'Smart Prepper App');
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
