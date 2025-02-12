import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_todo/screens/splash_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart'; // Import connectivity package
import 'package:user_todo/auths/connectivity_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: 'AIzaSyDn4BG357OxFle4LbC_4ZOfs03szSTqCtk',
        appId: '1:1075629369168:android:e3489d7fcae49711b52e55',
        messagingSenderId: '1075629369168',
        projectId: 'flutter-application-2-df821'),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[100],
          primarySwatch: Colors.blue,
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.blueAccent),
            ),
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.blue,
            selectionColor: Colors.blue,
            selectionHandleColor: Colors.blue,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEAF4FF),
              foregroundColor: Colors.blue,
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: ConnectivityWrapper(
            child: SplashScreen()), // Wrap with ConnectivityWrapper
      ),
    );
  }
}

// ConnectivityWrapper Widget
class ConnectivityWrapper extends StatefulWidget {
  final Widget child;

  const ConnectivityWrapper({required this.child});

  @override
  _ConnectivityWrapperState createState() => _ConnectivityWrapperState();
}

class _ConnectivityWrapperState extends State<ConnectivityWrapper> {
  final ConnectivityService connectivityService = ConnectivityService();

  @override
  void initState() {
    super.initState();
    // Initialize internet connectivity check
    WidgetsBinding.instance.addPostFrameCallback((_) {
      connectivityService.initialize(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child; // Return the child widget, in this case, SplashScreen
  }
}
