import 'package:self_learn7/provider/employee_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:self_learn7/screen/employee_screen.dart';
import 'package:flutter/material.dart';
import 'package:self_learn7/model/employee.dart';

class AddstudentScreen extends StatefulWidget {
  const AddstudentScreen({super.key});

  @override
  State<AddstudentScreen> createState() => _AddstudentScreenState();
}

class _AddstudentScreenState extends State<AddstudentScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EmployeeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("Add students")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: "Age"),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                final employee = Employee(
                  id: "101",
                  name: nameController.text,
                  age: ageController.text,
                );

                provider.addEmployee(employee);
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
