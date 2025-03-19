import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valorant_intel/config/themes/app_colors.dart';
import 'package:valorant_intel/core/extensions/string_extensions.dart';
import 'package:valorant_intel/features/feature_agent/data/models/ability.dart';
import 'package:valorant_intel/features/feature_agent/data/models/agent.dart';

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
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                  ),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: -10,
                      bottom: 0,
                      top: 0,
                      child: Opacity(
                        opacity: 0.7,
                        child: Transform.scale(
                          scale: 1.1,
                          child: CachedNetworkImage(
                            imageUrl: agent.background,
                            fit: BoxFit.contain,
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                    CachedNetworkImage(
                      imageUrl: agent.fullPortrait,
                      fit: BoxFit.fitHeight,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ],
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
              child: SizedBox(
                height: 110,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: AnimatedDisplayIcon(agent: agent),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 4,
                            child: FittedBox(
                              child: CachedNetworkImage(
                                color: Colors.grey,
                                width: 100,
                                height: 100,
                                imageUrl: agent.role.displayIcon,
                                placeholder: (context, url) {
                                  return Shimmer.fromColors(
                                    baseColor: AppColors.grey,
                                    highlightColor: AppColors.white,
                                    child: Container(
                                      width: 100,
                                      height: 100,
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
                            ),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Expanded(
                            flex: 1,
                            child: FittedBox(
                              child: Text(
                                agent.role.displayName,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(
              indent: 20,
              endIndent: 20,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverToBoxAdapter(
              child: AgentDescribtion(description: agent.description),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 10),
            sliver: SliverToBoxAdapter(
              child: AbilityList(abilities: agent.abilities),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.only(top: 50),
          ),
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
                  const Expanded(
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.white,
                        size: 45,
                      ),
                    ),
                  ),
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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (ability.displayIcon != "") ...{
            CachedNetworkImage(
              imageUrl: ability.displayIcon,
              height: 80,
              width: 80,
            ),
          } else ...{
            const Icon(
              Icons.image_not_supported,
              color: Colors.white,
              size: 75,
            )
          },
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              ability.displayName,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 20,
                    color: AppColors.mainRed,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              ability.description,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class AgentDescribtion extends StatelessWidget {
  const AgentDescribtion({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        text: TextSpan(
          text: 'Description: ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.mainRed,
              ),
          children: [
            TextSpan(
              text: description,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
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
