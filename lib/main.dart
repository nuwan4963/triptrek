import 'package:triptrek/ExpenseTracker.dart';
import 'package:triptrek/Preference.dart';
import 'package:triptrek/UserProfile.dart';

void main() {
  // Create user profile
  var user = UserProfile(
    name: 'John Doe',
    age: 30,
    email: 'john@example.com',
  );
  
  // Create preferences
  var prefs = Preferences(
    budget: 5000.0,
    interests: ['beaches', 'hiking'],
    travelStyle: 'adventure',
  );
  
  // Create expense tracker
  var tracker = ExpenseTracker();
  tracker.addExpense(Expense(
    id: '1',
    description: 'Flight ticket',
    amount: 1500.0,
    category: 'transport',
    date: DateTime.now(),
  ));
  
  print('Total expenses: \$${tracker.total}');
  print('Budget progress: ${tracker.total / prefs.budget * 100}%');
  
}