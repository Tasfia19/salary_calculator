import 'package:flutter/material.dart';
import 'package:test/test.dart'; // Import the test package for unit testing

void main() {
  // Run the Flutter app
  runApp(MyApp());

  // Run the unit tests
  runUnitTests();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salary Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SalaryCalculatorScreen(),
    );
  }
}

class SalaryCalculatorScreen extends StatefulWidget {
  @override
  _SalaryCalculatorScreenState createState() => _SalaryCalculatorScreenState();
}

class _SalaryCalculatorScreenState extends State<SalaryCalculatorScreen> {
  final TextEditingController _hourController = TextEditingController();
  String _result = '';

  void _calculateSalary() {
    final int hours = int.tryParse(_hourController.text) ?? 0;
    final int salary = calculateSalary(hours);

    setState(() {
      _result = 'Salary: Tk $salary';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salary Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _hourController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Hours',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateSalary,
              child: Text('Calculate'),
            ),
            SizedBox(height: 16),
            Text(_result),
          ],
        ),
      ),
    );
  }
}

// Function to calculate salary
int calculateSalary(int hours) {
  if (hours <= 40) {
    return hours * 400;
  } else {
    return (40 * 400) + ((hours - 40) * 600);
  }
}

// Unit test function
void runUnitTests() {
  test('Calculate salary for 35 hours', () {
    expect(calculateSalary(35), 14000); // 35 * 400
  });

  test('Calculate salary for 45 hours', () {
    expect(calculateSalary(45), 19000); // (40 * 400) + (5 * 600)
  });
}