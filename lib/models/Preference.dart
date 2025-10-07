class Preferences {
  double budget;
  List<String> interests;
  String travelStyle; // e.g., 'budget', 'luxury', 'adventure'
  
  Preferences({
    required this.budget,
    required this.interests,
    required this.travelStyle,
  });
  
  Preferences.defaultPreferences()
    : budget = 1000.0,
      interests = ['sightseeing', 'food'],
      travelStyle = 'moderate';
  
  bool isInterestSelected(String interest) => interests.contains(interest);
  
  void addInterest(String interest) {
    if (!interests.contains(interest)) {
      interests.add(interest);
    }
  }
}