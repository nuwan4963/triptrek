import 'package:flutter/material.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  String _selectedBudget = 'Moderate';
  final List<String> _budgets = ['Budget', 'Moderate', 'Luxury'];
  
  final List<String> _selectedInterests = [];
  final List<String> _interests = [
    'Beach', 'Nature', 'Adventure', 
    'Culture', 'Food', 'Wildlife', 
    'Shopping', 'Nightlife'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Set Your Preferences"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Help us personalize your experience", 
              style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 32),
            
            // Budget Section
            const Text("💰 Budget", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              children: _budgets.map((budget) {
                final isSelected = _selectedBudget == budget;
                return ChoiceChip(
                  label: Text(budget),
                  selected: isSelected,
                  selectedColor: Theme.of(context).primaryColor,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.white70,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                  onSelected: (selected) {
                    setState(() {
                      _selectedBudget = budget;
                    });
                  },
                );
              }).toList(),
            ),
            
            const SizedBox(height: 32),

            // Interests Section
            const Text("❤️ Interests", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: _interests.map((interest) {
                final isSelected = _selectedInterests.contains(interest);
                return FilterChip(
                  label: Text(interest),
                  selected: isSelected,
                  selectedColor: Theme.of(context).primaryColor.withOpacity(0.3),
                  checkmarkColor: Theme.of(context).primaryColor,
                  labelStyle: TextStyle(
                    color: isSelected ? Theme.of(context).primaryColor : Colors.white70,
                  ),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedInterests.add(interest);
                      } else {
                        _selectedInterests.remove(interest);
                      }
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 48),

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: const Text("Continue", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
