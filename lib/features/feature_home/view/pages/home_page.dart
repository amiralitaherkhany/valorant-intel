import 'package:flutter/material.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';
import 'package:valorant_intel/core/widgets/simple_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: Text(context.localizations.home)),
      body: const CustomScrollView(
        slivers: [SliverList(delegate: SliverChildListDelegate.fixed([]))],
      ),
    );
  }
}
