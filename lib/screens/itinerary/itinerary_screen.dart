import 'package:flutter/material.dart';

class ItineraryScreen extends StatelessWidget {
  const ItineraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Itinerary"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3, // Dummy itineraries
        itemBuilder: (context, index) {
          return _buildItineraryCard(context, index);
        },
      ),
    );
  }

  Widget _buildItineraryCard(BuildContext context, int index) {
    List<Map<String, dynamic>> itineraries = [
      {
        "title": "Sri Lanka Adventure",
        "dates": "Aug 12 - Aug 18",
        "destinations": "Colombo, Ella, Mirissa",
        "image": "assets/images/ella.jpg", // Placeholder
        "progress": 0.4
      },
      {
        "title": "Thailand Backpacking",
        "dates": "Dec 10 - Dec 25",
        "destinations": "Bangkok, Phuket, Chiang Mai",
        "image": "assets/images/thailand.jpg", // Placeholder
        "progress": 0.0
      },
      {
        "title": "Japan Cherry Blossom",
        "dates": "Apr 01 - Apr 15",
        "destinations": "Tokyo, Kyoto, Osaka",
        "image": "assets/images/japan.jpg", // Placeholder
        "progress": 0.8
      }
    ];

    final item = itineraries[index];

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // TODO: Navigate to detail view
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.grey[800], // Placeholder for image
              child: Stack(
                children: [
                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        item["title"],
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                   Expanded(
                     child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_today, size: 16, color: Theme.of(context).primaryColor),
                            const SizedBox(width: 8),
                            Text(item["dates"], style: const TextStyle(fontWeight: FontWeight.w500)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, size: 16, color: Theme.of(context).primaryColor),
                            const SizedBox(width: 8),
                            Expanded(child: Text(item["destinations"], overflow: TextOverflow.ellipsis)),
                          ],
                        ),
                      ],
                     ),
                   ),
                   CircularProgressIndicator(
                     value: item["progress"],
                     backgroundColor: Colors.grey[800],
                     color: Theme.of(context).primaryColor,
                   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
