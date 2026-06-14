import 'dart:convert';

class Employee{
      final String id;
      final String name;
      final String age;


      Employee({
        required this.id,
        required this.name,
        required this.age
      });

      Map<String,dynamic> toJson(){
          return {
            'id' : id,
            'name' : name,
            'age' : age,
          };
      }

      factory Employee.fromJson(Map<String,dynamic> json){
                return Employee(
                  id: json['id'],
                   name: json['name'],
                    age: json['age']
                    );
      }

      // encoded data to json string
            static String encoded(List<Employee> employee) => json.encode(employee.map((e)=> e.toJson()).toList());


      // decoded from jsonString to data UI
            static List<Employee> decoded(String emp) => (json.decode(emp) as List<dynamic>).map((e)=> Employee.fromJson(e)).toList();


}