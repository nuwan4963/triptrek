import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  final String destinationName;
  final String price;

  const BookingScreen({
    super.key, 
    this.destinationName = "Blue Beach Island", 
    this.price = "LKR 4500"
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int _guests = 2;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Selection
            Text("Select Dates", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildDateCard(context, "Check-in", "Dec 20", Icons.calendar_today),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildDateCard(context, "Check-out", "Dec 23", Icons.calendar_today),
                ),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Guests
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Number of Guests", style: Theme.of(context).textTheme.titleMedium),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        if (_guests > 1) setState(() => _guests--);
                      },
                    ),
                    Text("$_guests", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () {
                         setState(() => _guests++);
                      },
                    ),
                  ],
                ),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Price Details
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Price Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 16),
                  _buildPriceRow("LKR 4500 x $_guests guests", "LKR ${4500 * _guests}"),
                  const SizedBox(height: 8),
                  const _buildPriceRow("Service Fee", "LKR 150"),
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      Text(
                        "LKR ${4500 * _guests + 150}", 
                        style: TextStyle(
                            color: Theme.of(context).primaryColor, 
                            fontWeight: FontWeight.bold, 
                            fontSize: 18
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const Spacer(),
            
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Booking confirmed for ${widget.destinationName}!"))
                  );
                  Navigator.pop(context);
                },
                child: const Text("Confirm Booking", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateCard(BuildContext context, String label, String date, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(icon, size: 16, color: Theme.of(context).primaryColor),
              const SizedBox(width: 8),
              Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

class _buildPriceRow extends StatelessWidget {
  final String label;
  final String value;
  
  const _buildPriceRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
