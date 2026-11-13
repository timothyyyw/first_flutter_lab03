
import 'package:flutter/material.dart';

import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/booking_controls_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({
    super.key,
    required this.viewModel,
  });

  // Display feedback for action buttons
  void _showActionFeedback(
      BuildContext context,
      String action,
      ) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('$action action selected'),
          duration: const Duration(seconds: 2),
        ),
      );
  }

  // Action Bar
  Widget _buildActionBar(BuildContext context) {
    return ActionBarWidget(
      onCall: () => _showActionFeedback(context, 'CALL'),
      onRoute: () => _showActionFeedback(context, 'ROUTE'),
      onShare: () => _showActionFeedback(context, 'SHARE'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.cruise.appTitle),
        centerTitle: true,
        backgroundColor:
        Theme.of(context).colorScheme.primaryContainer,
      ),

      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitView(context)
              : _buildLandscapeView(context);
        },
      ),
    );
  }

  // Portrait Layout - Vertical Arrangement
  Widget _buildPortraitView(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        HeaderImageWidget(
          imagePath: viewModel.cruise.imagePath,
          caption: viewModel.cruise.imageCaption,
        ),

        const SizedBox(height: 12),

        TitleSectionWidget(
          viewModel: viewModel,
        ),

        _buildActionBar(context),

        const Divider(height: 24),

        DescriptionWidget(
          description: viewModel.cruise.description,
        ),

        BookingControlsWidget(
          viewModel: viewModel,
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  // Landscape Layout - Side-by-Side Arrangement
  Widget _buildLandscapeView(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Left Pane - Header Image
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return HeaderImageWidget(
                  imagePath: viewModel.cruise.imagePath,
                  caption: viewModel.cruise.imageCaption,
                  height: constraints.maxHeight,
                );
              },
            ),
          ),
        ),

        // Right Pane - Scrollable Details
        Expanded(
          flex: 6,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(8, 16, 16, 16),
            children: [
              TitleSectionWidget(
                viewModel: viewModel,
              ),

              _buildActionBar(context),

              const Divider(height: 24),

              DescriptionWidget(
                description: viewModel.cruise.description,
              ),

              BookingControlsWidget(
                viewModel: viewModel,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
