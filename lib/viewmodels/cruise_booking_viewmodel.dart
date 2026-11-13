
import 'package:flutter/foundation.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  // Cruise destination data
  final CruiseDestination cruise = CruiseDestination.sample;

  // Available cruise packages
  static const List<String> cruisePackages = [
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  // Application states
  late DateTime _selectedVisitDate = cruise.initialVisitDate;

  String _selectedPackage = cruisePackages.first;

  late int _starCount = cruise.initialStarCount;

  bool _isDarkMode = false;

  // Getters
  DateTime get selectedVisitDate => _selectedVisitDate;

  String get selectedPackage => _selectedPackage;

  int get starCount => _starCount;

  bool get isDarkMode => _isDarkMode;

  // Update Visit Date
  void updateVisitDate(DateTime newDate) {
    _selectedVisitDate = newDate;
    notifyListeners();
  }

  // Update Cruise Package
  void updateCruisePackage(String? newPackage) {
    if (newPackage == null ||
        !cruisePackages.contains(newPackage)) {
      return;
    }

    _selectedPackage = newPackage;
    notifyListeners();
  }

  // Increase Star Rating
  void increaseStarCount() {
    _starCount++;
    notifyListeners();
  }

  // Toggle Light / Dark Theme
  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}
