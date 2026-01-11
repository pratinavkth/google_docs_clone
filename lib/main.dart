import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/app/app.dart';
// import 'package:riverpod_app/screens/login.dart';

void main() {
  runApp(ProviderScope(child: const App()));
}

