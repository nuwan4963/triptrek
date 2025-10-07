class Itinerary {
  final String id;
  final String title;
  List<String> tripDates;
  List<Destination> destinations;
  List<Activity> activities;
  
  Itinerary({
    required this.id,
    required this.title,
    required this.tripDates,
    required this.destinations,
    required this.activities,
  });
  
  double get totalEstimatedCost {
    return activities.fold(0.0, (sum, activity) => sum + activity.cost);
  }
  
  void addActivity(Activity activity) {
    activities.add(activity);
  }
}

class Destination {
  final String name;
  final String city;
  final String country;
  
  Destination({required this.name, required this.city, required this.country});
}

class Activity {
  final String name;
  final DateTime dateTime;
  final double cost;
  final String type; // e.g., 'sightseeing', 'dining', 'transport'
  
  Activity({
    required this.name,
    required this.dateTime,
    required this.cost,
    required this.type,
  });
}