import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.1,
      widthFactor: 0.1,
      child: FittedBox(
        fit: BoxFit.cover,
        child: SpinKitDancingSquare(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
