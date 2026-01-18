import 'package:flutter/material.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emergency & Safety"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // SOS Button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.error.withOpacity(0.1),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Theme.of(context).colorScheme.error),
              ),
              child: Column(
                children: [
                  Icon(Icons.warning_amber_rounded, size: 48, color: Theme.of(context).colorScheme.error),
                  const SizedBox(height: 16),
                  Text("Keep this information handy", style: TextStyle(color: Theme.of(context).colorScheme.error, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text(
                    "Quick access to local police, hospitals, and your emergency contacts.",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Emergency Numbers
            _buildSectionHeader(context, "Emergency Numbers"),
            _buildEmergencyContact(context, "Police", "119", Icons.local_police),
            _buildEmergencyContact(context, "Ambulance", "1990", Icons.medical_services),
            _buildEmergencyContact(context, "Tourist Police", "1912", Icons.security),
            
            const SizedBox(height: 24),
            
            // Hospitals
             _buildSectionHeader(context, "Nearby Hospitals"),
             _buildHospitalItem(context, "Bangkok Hospital", "2 km away", "Open 24/7"),
             _buildHospitalItem(context, "General Hospital", "5 km away", "Open 24/7"),

             const SizedBox(height: 24),

             // Embassies
             _buildSectionHeader(context, "Embassy Info"),
             Card(
               child: ListTile(
                 leading: const Icon(Icons.flag),
                 title: const Text("US Embassy"),
                 subtitle: const Text("Colombo 03"),
                 trailing: IconButton(icon: const Icon(Icons.call), onPressed: (){}),
               ),
             ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold))
      ),
    );
  }

  Widget _buildEmergencyContact(BuildContext context, String name, String number, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white10,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(name),
        subtitle: Text(number, style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
        trailing: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(12),
          ),
          child: const Icon(Icons.call, color: Colors.white, size: 20),
        ),
      ),
    );
  }

  Widget _buildHospitalItem(BuildContext context, String name, String distance, String status) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(name),
        subtitle: Row(
          children: [
            Text(distance),
            const SizedBox(width: 8),
            const Icon(Icons.circle, size: 4, color: Colors.grey),
            const SizedBox(width: 8),
            Text(status, style: const TextStyle(color: Colors.green)),
          ],
        ),
        trailing: TextButton(onPressed: (){}, child: const Text("Directions")),
      ),
    );
  }
}
