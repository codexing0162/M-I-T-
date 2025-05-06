import 'package:mit/pages/for.dart';
import 'package:flutter/material.dart';
import 'package:mit/pages/studdent_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontFamily: 'Serif',
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        elevation: 5,
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.blueGrey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: Center(
                child: Text(
                  'M I T',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Register Student'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterForm()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Registered Students'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StudentListPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.assignment_outlined, size: 80, color: Colors.blueGrey),
              const SizedBox(height: 20),
              const Text(
                'Welcome to M I T',
                style: TextStyle(fontSize: 20, fontFamily: 'Serif'),
              ),
              const SizedBox(height: 8),
              const Text(
                'Moshi Institute Of Technology',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Serif',
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  //Navigate to Student Registration Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterForm(),
                    ),
                  );
                },
                icon: const Icon(Icons.person_add_alt),
                label: const Text('Add New Student'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontFamily: 'Serif'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// This code creates a simple customer dashboard screen with an app bar, a message indicating no customers are present, and a button to add a new customer. The bottom navigation bar allows switching between different sections of the app.