import 'package:flutter/material.dart';
import 'package:triptrek/screens/booking/booking_screen.dart';

class DestinationDetailsScreen extends StatelessWidget {
  final Map<String, String> destination;

  const DestinationDetailsScreen({
    super.key,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
             child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), 
                  BlendMode.darken
                ),
               child: Container(
                 color: Colors.grey[850],
                 // child: Image.asset(destination['image']!, fit: BoxFit.cover),
               ),
             ),
          ),
          
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Actions
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      IconButton(
                        icon: const Icon(Icons.favorite_border, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                
                const Spacer(),
                
                // Content Sheet
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              destination['name'] ?? "Destination", 
                              style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold)
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 20),
                              const SizedBox(width: 4),
                              Text(destination['rating'] ?? "4.5", style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 16, color: Theme.of(context).primaryColor),
                          const SizedBox(width: 4),
                          Text(destination['location'] ?? "Sri Lanka", style: const TextStyle(color: Colors.white70)),
                        ],
                      ),
                      const SizedBox(height: 24),
                      
                      const Text("Description", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(height: 8),
                      const Text(
                        "Experience the breathtaking beauty of this place. Perfect for backpackers and nature lovers. Enjoy local cuisines, hiking trails, and vibrant night life.",
                        style: TextStyle(color: Colors.white70, height: 1.5),
                      ),
                      
                      const SizedBox(height: 24),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildInfoChip(context, Icons.timer, "5 Days"),
                          _buildInfoChip(context, Icons.directions_walk, "12 km"),
                          _buildInfoChip(context, Icons.thermostat, "26° C"),
                        ],
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Bottom Action
                      Row(
                        children: [
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               const Text("Price per person", style: TextStyle(fontSize: 12, color: Colors.grey)),
                               Text(
                                 destination['price'] ?? "LKR 4500", 
                                 style: TextStyle(
                                   fontSize: 24, 
                                   fontWeight: FontWeight.bold, 
                                   color: Theme.of(context).primaryColor
                                  )
                                ),
                             ],
                           ),
                           const Spacer(),
                           ElevatedButton(
                             onPressed: () {
                               Navigator.push(
                                 context, 
                                 MaterialPageRoute(builder: (_) => BookingScreen(
                                   destinationName: destination['name'] ?? "",
                                   price: destination['price'] ?? "",
                                 ))
                               );
                             },
                             style: ElevatedButton.styleFrom(
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                               padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                             ),
                             child: const Text("Book Now", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                           ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(BuildContext context, IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: Theme.of(context).primaryColor, size: 20),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }
}
