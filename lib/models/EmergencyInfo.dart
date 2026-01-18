class EmergencyInfo {
  List<EmergencyContact> contacts;
  List<Hospital> hospitals;
  List<Embassy> embassies;
  
  EmergencyInfo({
    required this.contacts,
    required this.hospitals,
    required this.embassies,
  });
  
  EmergencyContact get primaryContact => contacts.first;
  
  List<Hospital> getNearbyHospitals(double userLat, double userLon) {
    // Implementation for sorting by distance
    return hospitals;
  }
}

class EmergencyContact {
  final String name;
  final String phoneNumber;
  final String relationship;
  
  EmergencyContact({
    required this.name,
    required this.phoneNumber,
    required this.relationship,
  });
}

class Hospital {
  final String name;
  final String address;
  final String phoneNumber;
  final double latitude;
  final double longitude;
  
  Hospital({
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.latitude,
    required this.longitude,
  });
}

class Embassy {
  final String country;
  final String address;
  final String phoneNumber;
  final String emergencyPhone;
  
  Embassy({
    required this.country,
    required this.address,
    required this.phoneNumber,
    required this.emergencyPhone,
  });
}