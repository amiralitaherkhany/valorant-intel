import 'package:flutter/material.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';

class CustomErrorView extends StatelessWidget {
  const CustomErrorView({
    super.key,
    required this.message,
    required this.onTryAgain,
  });

  final String message;
  final void Function() onTryAgain;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.translateError(message),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: onTryAgain,
            child: Text(
              context.localizations.tryAgain,
            ),
          ),
        ],
      ),
    );
  }
}
