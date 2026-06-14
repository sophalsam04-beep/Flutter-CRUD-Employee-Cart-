// Demo CRUD Operation in flutter using Shared Preferences + Provider
// CREATE
// READ
// UPDATE
// DELETE

import 'package:self_learn7/screen/employee_screen.dart';
import 'package:flutter/material.dart';
import 'package:self_learn7/provider/employee_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:self_learn7/model/employee.dart';
import 'package:self_learn7/provider/employee_provider.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider<EmployeeProvider>(
      create: (context) => EmployeeProvider(),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmployeeScreen(),
    );
  }
}
