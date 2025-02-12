import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityService {
  // Initialize connectivity checker
  void initialize(BuildContext context) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _showSnackbar(result, context);
    });
  }

  void _showSnackbar(ConnectivityResult result, BuildContext context) {
    if (result == ConnectivityResult.none) {
      final snackBar = SnackBar(
        content: const Text(
          'Check your internet connection',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
