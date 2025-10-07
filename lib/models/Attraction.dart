class Attraction {
  final String id;
  final String name;
  final Location location;
  final double rating;
  final String description;
  final List<String> images;
  final String category;
  final double entranceFee;
  final List<String> openingHours;
  
  Attraction({
    required this.id,
    required this.name,
    required this.location,
    required this.rating,
    required this.description,
    required this.images,
    required this.category,
    required this.entranceFee,
    required this.openingHours,
  });
  
  bool get isFree => entranceFee == 0;
  bool get isHighlyRated => rating >= 4.0;
}

class Location {
  final String address;
  final double latitude;
  final double longitude;
  
  Location({
    required this.address,
    required this.latitude,
    required this.longitude,
  });
}