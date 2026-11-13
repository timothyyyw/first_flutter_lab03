
import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

class TitleSectionWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const TitleSectionWidget({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Cruise Name and Location
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  viewModel.cruise.cruiseName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  viewModel.cruise.location,
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Dynamic Star Rating
          ListenableBuilder(
            listenable: viewModel,
            builder: (context, child) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    tooltip: 'Increase star rating',
                    onPressed: viewModel.increaseStarCount,
                    icon: const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 28,
                    ),
                  ),

                  Text(
                    '${viewModel.starCount}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
