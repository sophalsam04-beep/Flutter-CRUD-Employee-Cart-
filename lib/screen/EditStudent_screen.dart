import 'package:self_learn7/screen/AddStudent_screen.dart';
import 'package:self_learn7/screen/employee_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_learn7/provider/employee_provider.dart';
import 'package:self_learn7/model/employee.dart';

class EditstudentScreen extends StatefulWidget {
  final Employee emp;
  const EditstudentScreen({super.key, required this.emp});

  @override
  State<EditstudentScreen> createState() => _EditstudentScreenState();
}

class _EditstudentScreenState extends State<EditstudentScreen> {
  late TextEditingController namecontroller;
  late TextEditingController agecontroller;

  @override
  void initState() {
    super.initState();
    namecontroller = TextEditingController(text: widget.emp.name);
    agecontroller = TextEditingController(text: widget.emp.age);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EmployeeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("Edit & Update")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: namecontroller,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: agecontroller,
              decoration: const InputDecoration(labelText: "Age"),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                final updated = Employee(
                  id: widget.emp.id,
                  name: namecontroller.text,
                  age: agecontroller.text,
                );

                provider.updateEmployee(widget.emp.id, updated);
                Navigator.pop(context);
              },
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}
