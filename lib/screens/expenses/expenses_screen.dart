import 'package:flutter/material.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            icon: const Icon(Icons.pie_chart_outline),
            onPressed: () {},
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Budget Overview Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).colorScheme.primaryContainer,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  const Text("Total Spent", style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 8),
                  const Text(
                    "LKR 45,200", 
                    style: TextStyle(
                      fontSize: 36, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.white
                    )
                  ),
                  const SizedBox(height: 16),
                  
                   LinearProgressIndicator(
                    value: 0.7,
                    backgroundColor: Colors.white24,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Budget: LKR 65,000", style: TextStyle(color: Colors.white70)),
                      Text("70% Used", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Recent Transactions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recent Expenses", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                TextButton(onPressed: (){}, child: const Text("See All")),
              ],
            ),
            
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildExpenseItem(context, index);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpenseItem(BuildContext context, int index) {
     final expenses = [
      {'title': 'Train to Ella', 'cat': 'Transport', 'amount': 'LKR 800', 'icon': Icons.train},
      {'title': 'Dinner at Cafe', 'cat': 'Food', 'amount': 'LKR 2500', 'icon': Icons.restaurant},
      {'title': 'Hotel Stay', 'cat': 'Accommodation', 'amount': 'LKR 4500', 'icon': Icons.hotel},
      {'title': 'Tuk Tuk Ride', 'cat': 'Transport', 'amount': 'LKR 300', 'icon': Icons.directions_transit}, 
      {'title': 'Souvenirs', 'cat': 'Shopping', 'amount': 'LKR 1200', 'icon': Icons.shopping_bag},
    ];

    final item = expenses[index];

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
          child: Icon(item['icon'] as IconData, color: Theme.of(context).primaryColor),
        ),
        title: Text(item['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(item['cat'] as String),
        trailing: Text(
          "- ${item['amount']}", 
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)
        ),
      ),
    );
  }
}
