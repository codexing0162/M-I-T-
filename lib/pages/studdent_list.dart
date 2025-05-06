import 'dart:convert';
import 'studentdetail.dart';
import 'package:pdf/pdf.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({super.key});

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  List<dynamic> _students = [];
  List<dynamic> _filteredStudents = [];
  bool _isLoading = true;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchStudentList();
  }

  Future<void> _fetchStudentList() async {
    setState(() {
      _isLoading = true; // Show loading indicator while fetching data
    });

    final url = Uri.parse(
      'https://script.google.com/macros/s/AKfycbx75cUXW12-R7JJns7ok_7NttXnCvAv2vDyhjWFZIydY2xLgrxvtJgSN6Lnud3RXsl_/exec', // Replace with your deployment URL
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);

        setState(() {
          _students = responseData;
          _filteredStudents = responseData; // Initialize filtered list
          _isLoading = false;
        });
      } else {
        throw Exception(
          'Failed to load student list: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  void _filterStudents(String query) {
    setState(() {
      _filteredStudents =
          _students.where((student) {
            final fullName = '${student['fullName']}'.toLowerCase();
            return fullName.contains(query.toLowerCase());
          }).toList();
    });
  }

  Future<void> _exportToPDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Table.fromTextArray(
            headers: [
              'Student ID',
              'Full Name',
              'DOB',
              'Gender',
              'Postal Address',
              'Phone',
              'Emergency Phone',
              'Education Level',
              'Course Name',
              'Trainer Name',
              'Admission Date',
              'Completion Date',
              'Duration',
              'Price',
              'Amount Paid',
              'Balance',
            ],
            data:
                _students.map((student) {
                  return [
                    student['StudentID'],
                    student['fullName'],
                    student['dob'],
                    student['gender'],
                    student['postalAddress'],
                    student['phone'],
                    student['emergencyPhone'],
                    student['educationLevel'],
                    student['courseName'],
                    student['trainerName'],
                    student['admissionDate'],
                    student['completionDate'],
                    student['duration'],
                    student['price'],
                    student['PaidPrice'],
                    student['Balance'],
                  ];
                }).toList(),
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  void _showStudentDetails(Map<String, dynamic> student) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentDetailPage(student: student),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchStudentList, // Refresh button to fetch data
          ),
        ],
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        labelText: 'Search by Full Name',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: _filterStudents,
                    ),
                  ),
                  Expanded(
                    child:
                        _filteredStudents.isEmpty
                            ? const Center(child: Text('No students found'))
                            : ListView.builder(
                              itemCount: _filteredStudents.length,
                              itemBuilder: (context, index) {
                                final student = _filteredStudents[index];
                                return ListTile(
                                  title: Text(student['fullName']),
                                  subtitle: Text(
                                    'Course: ${student['courseName']}',
                                  ),
                                  trailing: Text('Price: ${student['price']}'),
                                  onTap: () => _showStudentDetails(student),
                                );
                              },
                            ),
                  ),
                ],
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: _exportToPDF,
        child: const Icon(Icons.picture_as_pdf),
      ),
    );
  }
}
