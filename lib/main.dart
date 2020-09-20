import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:work_app/dependency.dart' as dep;
import 'app_view.dart';

void main() async {
  dep.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(
    AppView(),
  );
}
