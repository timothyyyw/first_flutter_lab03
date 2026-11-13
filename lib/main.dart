
import 'package:flutter/material.dart';

import 'viewmodels/cruise_booking_viewmodel.dart';
import 'views/cruise_booking_screen.dart';

void main() {
  runApp(const RajangRiverCruiseApp());
}

class RajangRiverCruiseApp extends StatefulWidget {
  const RajangRiverCruiseApp({super.key});

  @override
  State<RajangRiverCruiseApp> createState() =>
      _RajangRiverCruiseAppState();
}

class _RajangRiverCruiseAppState
    extends State<RajangRiverCruiseApp> {

  late final CruiseBookingViewModel _viewModel;

  @override
  void initState() {
    super.initState();

    // Create ViewModel
    _viewModel = CruiseBookingViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          title: 'Sibu River Cruise & Heritage',

          // Light Theme
          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.indigo,
            brightness: Brightness.light,
          ),

          // Dark Theme
          darkTheme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.indigo,
            brightness: Brightness.dark,
          ),

          // Dynamic Theme Selection
          themeMode: _viewModel.isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,

          // Main Screen
          home: CruiseBookingScreen(
            viewModel: _viewModel,
          ),
        );
      },
    );
  }
}
