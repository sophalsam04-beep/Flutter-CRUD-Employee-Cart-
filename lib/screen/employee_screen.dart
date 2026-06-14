import 'package:flutter/material.dart';
import 'package:self_learn7/model/employee.dart';
import 'package:self_learn7/provider/employee_provider.dart';
import 'package:self_learn7/screen/AddStudent_screen.dart';
import 'package:self_learn7/screen/EditStudent_screen.dart';
import 'package:self_learn7/screen/employee_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EmployeeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("CRUD Students")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddstudentScreen()),
          );
        },
        child: Icon(Icons.redeem_rounded, size: 40),
      ),

      body: provider.employee.isEmpty
          ? const Center(child: Text("No students"))
          : ListView.builder(
              itemCount: provider.employee.length,
              itemBuilder: (context, index) {
                final emp = provider.employee[index];

                return ListTile(
                  leading: Text("${emp.id}"),
                  title: Text("${emp.name}"),
                  subtitle: Text("${emp.age}"),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditstudentScreen(emp: emp),
                      ),
                    );
                  },

                  trailing: IconButton(
                    onPressed: () {
                      provider.deleteEmployee(emp.id);
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
    );
  }
}
