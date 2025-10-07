class TravelMode {
  final String modeType; // e.g., 'tourist', 'business', 'backpacker'
  final Map<String, dynamic> settings;
  
  TravelMode({
    required this.modeType,
    required this.settings,
  });
  
  bool get isBusinessMode => modeType == 'business';
  bool get isTouristMode => modeType == 'tourist';
  
  void updateSetting(String key, dynamic value) {
    settings[key] = value;
  }
}