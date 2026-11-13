
import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

class BookingControlsWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const BookingControlsWidget({
    super.key,
    required this.viewModel,
  });

  // Format selected date
  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');

    return '$day/$month/${date.year}';
  }

  // Visit Date Picker
  Future<void> _selectVisitDate(BuildContext context) async {
    final now = DateTime.now();

    final today = DateTime(
      now.year,
      now.month,
      now.day,
    );

    final lastDate = DateTime(
      today.year + 2,
      today.month,
      today.day,
    );

    var initialDate = viewModel.selectedVisitDate;

    if (initialDate.isBefore(today)) {
      initialDate = today;
    } else if (initialDate.isAfter(lastDate)) {
      initialDate = lastDate;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: today,
      lastDate: lastDate,
    );

    if (picked != null) {
      viewModel.updateVisitDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Card(
          margin: const EdgeInsets.all(16),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Section Title
                const Text(
                  'Interactive Booking Controls',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Divider(height: 24),

                // Visit Date Picker
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    Icons.calendar_month,
                    color: Colors.indigo,
                  ),
                  title: const Text(
                    'Visit Date',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    _formatDate(viewModel.selectedVisitDate),
                  ),
                  trailing: const Icon(Icons.edit_calendar),
                  onTap: () => _selectVisitDate(context),
                ),

                const Divider(),

                // Cruise Package Selection
                const Text(
                  'Cruise Package',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 8),

                DropdownButton<String>(
                  value: viewModel.selectedPackage,
                  isExpanded: true,
                  items: CruiseBookingViewModel.cruisePackages
                      .map((String package) {
                    return DropdownMenuItem<String>(
                      value: package,
                      child: Text(package),
                    );
                  }).toList(),
                  onChanged: viewModel.updateCruisePackage,
                ),

                const Divider(height: 24),

                // Dark Mode Switch
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    'Dark Mode',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    viewModel.isDarkMode
                        ? 'Dark theme enabled'
                        : 'Light theme enabled',
                  ),
                  secondary: const Icon(
                    Icons.dark_mode,
                  ),
                  value: viewModel.isDarkMode,
                  onChanged: viewModel.toggleDarkMode,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
