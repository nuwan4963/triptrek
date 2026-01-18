class OfficeMap {
  final String region;
  final String mapData; // Could be JSON string or reference to map file
  final DateTime lastUpdated;
  final List<MapMarker> markers;
  
  OfficeMap({
    required this.region,
    required this.mapData,
    required this.lastUpdated,
    this.markers = const [],
  });
  
  bool get isOutdated => 
      DateTime.now().difference(lastUpdated).inDays > 30;
}

class MapMarker {
  final double latitude;
  final double longitude;
  final String title;
  final String type; // e.g., 'office', 'hotel', 'attraction'
  
  MapMarker({
    required this.latitude,
    required this.longitude,
    required this.title,
    required this.type,
  });
}