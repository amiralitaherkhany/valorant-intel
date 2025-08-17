import 'package:flutter/material.dart';
import 'package:valorant_intel/config/theme/app_color_scheme.dart';

class AgentDescribtion extends StatelessWidget {
  const AgentDescribtion({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          text: 'Description: ',
          style:
              Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(
                color: AppColorScheme.mainRed,
              ),
          children: [
            TextSpan(
              text: description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
