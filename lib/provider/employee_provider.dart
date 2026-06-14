// CRUD OPERATION Logic + shared preferences + Providers

import 'package:flutter/material.dart';
import 'package:self_learn7/model/employee.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class EmployeeProvider extends ChangeNotifier{
      List<Employee> _employee = [];

      // inherite methods
        List<Employee> get employee => _employee;

        EmployeeProvider(){
          loadEmployee();
        }


        Future<void> addEmployee(Employee employee) async{
            _employee.add(employee);

            await saveEmployee();
            notifyListeners();
        }


        Future<void> saveEmployee()async{
            SharedPreferences prefs = await SharedPreferences.getInstance();

            await prefs.setString('employees', Employee.encoded(employee));
        }

          Future<void> deleteEmployee(String id)async{
              _employee.removeWhere((s) => s.id == id);

              await saveEmployee();
              notifyListeners();
          }

          Future<void> updateEmployee(String id, Employee updated)async{
              final index = _employee.indexWhere((s) => s.id == id);

              if(index != -1){
                  _employee[index] = updated;

                  await saveEmployee();

                  notifyListeners();
              }
          }

        Future<void> loadEmployee()async{
            SharedPreferences prefs = await SharedPreferences.getInstance();
            
            String? data = await prefs.getString('employees');
            
            if(data != null){
                _employee = Employee.decoded(data);

                notifyListeners();
            }
        }


}