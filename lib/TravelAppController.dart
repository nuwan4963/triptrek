import 'package:triptrek/EmergencyInfo.dart';
import 'package:triptrek/ExpenseTracker.dart';
import 'package:triptrek/Itinerary.dart';
import 'package:triptrek/OfficeMap.dart';
import 'package:triptrek/Preference.dart';
import 'package:triptrek/TravelMode.dart';
import 'package:triptrek/UserProfile.dart';

class TravelAppController {
  UserProfile userProfile;
  Preferences preferences;
  List<Itinerary> itineraries;
  OfficeMap officeMap;
  ExpenseTracker expenseTracker;
  EmergencyInfo emergencyInfo;
  TravelMode currentTravelMode;
  
  TravelAppController({
    required this.userProfile,
    required this.preferences,
    required this.itineraries,
    required this.officeMap,
    required this.expenseTracker,
    required this.emergencyInfo,
    required this.currentTravelMode,
  });
  
  // Business logic methods
  void switchTravelMode(String newMode) {
    currentTravelMode = TravelMode(
      modeType: newMode,
      settings: _getDefaultSettingsForMode(newMode),
    );
  }
  
  Map<String, dynamic> _getDefaultSettingsForMode(String mode) {
    switch (mode) {
      case 'business':
        return {'showBusinessHotels': true, 'priority': 'meetings'};
      case 'tourist':
        return {'showAttractions': true, 'priority': 'sightseeing'};
      default:
        return {};
    }
  }
  
  double get budgetProgress {
    return (expenseTracker.total / preferences.budget) * 100;
  }
  
  bool isWithinBudget() {
    return expenseTracker.total <= preferences.budget;
  }
}