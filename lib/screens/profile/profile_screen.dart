import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Profile Header
            const Center(
              child: Column(
                children: [
                   CircleAvatar(
                     radius: 50,
                     backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'), // Placeholder
                   ),
                   SizedBox(height: 16),
                   Text("Alex Explorer", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                   Text("alex@triptrek.com", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatItem(context, "12", "Trips"),
                _buildStatItem(context, "5", "Countries"),
                _buildStatItem(context, "4.2k", "Photos"),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Menu
            _buildMenuItem(context, Icons.person_outline, "Edit Profile"),
            _buildMenuItem(context, Icons.favorite_outline, "Wishlist"),
            _buildMenuItem(context, Icons.history, "Travel History"),
            _buildMenuItem(context, Icons.payment, "Payment Methods"),
            _buildMenuItem(context, Icons.logout, "Log Out", isDestructive: true),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String value, String label) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String label, {bool isDestructive = false}) {
    return ListTile(
      leading: Icon(icon, color: isDestructive ? Colors.red : Colors.white),
      title: Text(label, style: TextStyle(color: isDestructive ? Colors.red : Colors.white)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        if (isDestructive) {
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
    );
  }
}
