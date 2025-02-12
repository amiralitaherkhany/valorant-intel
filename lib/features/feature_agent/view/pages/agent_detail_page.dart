import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_intel/config/themes/app_colors.dart';
import 'package:valorant_intel/core/extensions/string_extensions.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent/ability.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent/agent.dart';

class AgentDetailPage extends StatelessWidget {
  const AgentDetailPage({
    super.key,
    required this.agent,
  });
  final Agent agent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              title: Hero(
                transitionOnUserGestures: true,
                tag: agent.displayName,
                flightShuttleBuilder: (flightContext, animation,
                    flightDirection, fromHeroContext, toHeroContext) {
                  Animation<double> textAnimation =
                      Tween<double>(begin: 14.0, end: 30.0).animate(animation);
                  return RepaintBoundary(
                    child: FittedBox(
                      child: Text(
                        "${agent.displayName} ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: textAnimation.value),
                      ),
                    ),
                  );
                },
                child: FittedBox(
                  child: Text(
                    "${agent.displayName} ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 20.0),
                  ),
                ),
              ),
              centerTitle: true,
              background: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.viewPaddingOf(context).top, bottom: 50),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      for (var colorString
                          in agent.backgroundGradientColors) ...{
                        (colorString as String).parseToColor
                      }
                    ],
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl: agent.fullPortrait,
                  fit: BoxFit.fitHeight,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            elevation: 0,
            scrolledUnderElevation: 4,
            pinned: true,
            floating: false,
            expandedHeight: 450,
            snap: false,
            stretch: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: AnimatedDisplayIcon(agent: agent),
                  ),
                  Expanded(
                    flex: 2,
                    child: AgentDescribtion(agent: agent),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 10),
            sliver: SliverToBoxAdapter(
              child: AbilityList(abilities: agent.abilities),
            ),
          ),
          SliverList.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              return const ListTile(
                title: Text('data'),
              );
            },
          )
        ],
      ),
    );
  }
}

class AbilityList extends StatelessWidget {
  const AbilityList({
    super.key,
    required this.abilities,
  });
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
          return AbilityItem(ability: abilities[index]);
        },
      ),
    );
  }
}

class AbilityItem extends StatelessWidget {
  const AbilityItem({
    super.key,
    required this.ability,
  });

  final Ability ability;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => AbilityBottomSheetContent(ability: ability),
        );
      },
      child: SizedBox(
        height: 100,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          shadowColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (ability.displayIcon != "") ...{
                  CachedNetworkImage(
                    imageUrl: ability.displayIcon,
                    height: 50,
                    placeholder: (context, url) {
                      return Shimmer.fromColors(
                        baseColor: AppColors.grey,
                        highlightColor: AppColors.white,
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                } else ...{
                  const Text('No Image'),
                },
                const Spacer(),
                Text(
                  ability.displayName,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 11,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AbilityBottomSheetContent extends StatelessWidget {
  const AbilityBottomSheetContent({
    super.key,
    required this.ability,
  });

  final Ability ability;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, bottom: 20.0, left: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CachedNetworkImage(
                    imageUrl: ability.displayIcon,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(ability.displayName),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 6,
            child: Text(
              ability.description,
            ),
          ),
        ],
      ),
    );
  }
}

class AgentDescribtion extends StatelessWidget {
  const AgentDescribtion({
    super.key,
    required this.agent,
  });

  final Agent agent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        agent.description,
        textAlign: TextAlign.left,
      ),
    );
  }
}

class AnimatedDisplayIcon extends StatelessWidget {
  const AnimatedDisplayIcon({
    super.key,
    required this.agent,
  });

  final Agent agent;

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: agent.displayIcon,
      // flightShuttleBuilder: (flightContext, animation,
      //     flightDirection, fromHeroContext, toHeroContext) {
      //   Animation<double> scaleAnimation =
      //       TweenSequence<double>([
      //     TweenSequenceItem(
      //         tween: Tween(begin: 1, end: 1.5), weight: 0.5),
      //     TweenSequenceItem(
      //         tween: Tween(begin: 1.5, end: 1), weight: 0.5),
      //   ]).animate(animation);

      //   return RepaintBoundary(
      //     child: ScaleTransition(
      //       scale: scaleAnimation,
      //       child: fromHeroContext.widget,
      //     ),
      //   );
      // },
      // createRectTween: (begin, end) {
      //   return RectTween(begin: begin, end: end);
      // },
      child: FittedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            width: 100,
            height: 100,
            imageUrl: agent.displayIcon,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: AppColors.white,
              highlightColor: AppColors.grey,
              child: Container(
                color: Colors.grey,
                width: 100,
                height: 100,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
            ),
          ),
        ),
      ),
    );
  }
}
