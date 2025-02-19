import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:user_todo/screens/splash_screen.dart';
import 'package:user_todo/auths/connectivity_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBJlELeZ_tp1PDdW13La4KWliStBLb_0N4",
          authDomain: "todo-list-387f6.firebaseapp.com",
          projectId: "todo-list-387f6",
          storageBucket: "todo-list-387f6.firebasestorage.app",
          messagingSenderId: "58816975422",
          appId: "1:58816975422:web:6461f856b557ecf538f76f",
          measurementId: "G-T4KSBGSTDR"),
    );
  } else {
    // Mobile Firebase Initialization
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
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
              foregroundColor: WidgetStateProperty.all(Colors.blueAccent),
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
