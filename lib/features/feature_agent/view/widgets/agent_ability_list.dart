import 'package:flutter/material.dart';
import 'package:valorant_intel/features/feature_agent/data/models/ability.dart';
import 'package:valorant_intel/features/feature_agent/view/widgets/agent_ability_item.dart';

class AgentAbilityList extends StatelessWidget {
  const AgentAbilityList({super.key, required this.abilities});
  final List<Ability> abilities;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        clipBehavior: Clip.none,
        itemCount: abilities.length,
        scrollDirection: Axis.horizontal,
        itemExtent: 120,
        itemBuilder: (context, index) {
          return AgentAbilityItem(ability: abilities[index]);
        },
      ),
    );
  }
}
