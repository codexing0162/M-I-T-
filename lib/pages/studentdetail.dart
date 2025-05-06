import 'package:flutter/material.dart';

class StudentDetailPage extends StatelessWidget {
  final Map<String, dynamic> student;

  const StudentDetailPage({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student['fullName']?.toString() ?? 'Student Details'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Field')),
                  DataColumn(label: Text('Value')),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('Full Name')),
                      DataCell(Text(student['fullName']?.toString() ?? '')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('DOB')),
                      DataCell(Text(student['dob']?.toString() ?? '')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Gender')),
                      DataCell(Text(student['gender']?.toString() ?? '')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Postal Address')),
                      DataCell(
                        Text(student['postalAddress']?.toString() ?? ''),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Phone')),
                      DataCell(Text(student['phone']?.toString() ?? '')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Emergency Phone')),
                      DataCell(
                        Text(student['emergencyPhone']?.toString() ?? ''),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Education Level')),
                      DataCell(
                        Text(student['educationLevel']?.toString() ?? ''),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Course Name')),
                      DataCell(Text(student['courseName']?.toString() ?? '')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Trainer Name')),
                      DataCell(Text(student['trainerName']?.toString() ?? '')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Admission Date')),
                      DataCell(
                        Text(student['admissionDate']?.toString() ?? ''),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Completion Date')),
                      DataCell(
                        Text(student['completionDate']?.toString() ?? ''),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Duration')),
                      DataCell(Text(student['duration']?.toString() ?? '')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Price')),
                      DataCell(Text(student['price']?.toString() ?? '')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Amount Paid')),
                      DataCell(Text(student['PaidPrice']?.toString() ?? '')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Balance')),
                      DataCell(Text(student['Balance']?.toString() ?? '')),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
