
import 'package:flutter/material.dart';

class ActionBarWidget extends StatelessWidget {
  final VoidCallback onCall;
  final VoidCallback onRoute;
  final VoidCallback onShare;

  const ActionBarWidget({
    super.key,
    required this.onCall,
    required this.onRoute,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // CALL Button
        _buildActionButton(
          icon: Icons.call,
          label: 'CALL',
          onPressed: onCall,
        ),

        // ROUTE Button
        _buildActionButton(
          icon: Icons.directions,
          label: 'ROUTE',
          onPressed: onRoute,
        ),

        // SHARE Button
        _buildActionButton(
          icon: Icons.share,
          label: 'SHARE',
          onPressed: onShare,
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 26,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
