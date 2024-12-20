import 'package:flutter_test/flutter_test.dart';

String calculateSalary(int hours) {
  if (hours <= 40) {
    return 'Amount: ${hours * 400} Tk';
  } else {
    int extraHours = hours - 40;
    return 'Amount: ${(40 * 400) + (extraHours * 600)} Tk';
  }
}

void main() {
  test('Salary calculation for 35 hours', () {
    expect(calculateSalary(35), 'Amount: 14000 Tk');
  });

  test('Salary calculation for 45 hours', () {
    expect(calculateSalary(45), 'Amount: 23000 Tk');
  });
}