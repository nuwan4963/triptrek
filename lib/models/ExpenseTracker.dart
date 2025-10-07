class ExpenseTracker {
  List<Expense> expenses = [];
  
  double get total => expenses.fold(0.0, (sum, expense) => sum + expense.amount);
  
  double get remainingBudget {
    // This would need reference to Preferences budget
    return 0.0; // Placeholder
  }
  
  void addExpense(Expense expense) {
    expenses.add(expense);
    _sortExpenses();
  }
  
  void removeExpense(String id) {
    expenses.removeWhere((expense) => expense.id == id);
  }
  
  void _sortExpenses() {
    expenses.sort((a, b) => b.date.compareTo(a.date));
  }
  
  List<Expense> getExpensesByCategory(String category) {
    return expenses.where((expense) => expense.category == category).toList();
  }
}

class Expense {
  final String id;
  final String description;
  final double amount;
  final String category;
  final DateTime date;
  final String currency;
  
  Expense({
    required this.id,
    required this.description,
    required this.amount,
    required this.category,
    required this.date,
    this.currency = 'USD',
  });
}