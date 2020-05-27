
class Employee {
   final int id;
   final String name;
    final int unitID;
   final String applicationUserID;

  Employee({this.id,
      this.name,
      this.unitID,
      this.applicationUserID,
      });

   

  factory Employee.fromJson( Map<String, dynamic> json) {
    return Employee(
    id: json['id'],
    name: json['name'],
    applicationUserID: json['applicationUserID']
    );
  }

}