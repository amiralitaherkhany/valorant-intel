import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:valorant_intel/config/themes/app_colors.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';

class CustomSliverRefreshWrapper extends StatefulWidget {
  const CustomSliverRefreshWrapper({
    super.key,
    required this.onRefresh,
    required this.slivers,
  });

  final VoidCallback onRefresh;
  final List<Widget> slivers;

  @override
  State<CustomSliverRefreshWrapper> createState() =>
      _CustomSliverRefreshWrapperState();
}

class _CustomSliverRefreshWrapperState
    extends State<CustomSliverRefreshWrapper> {
  final ValueNotifier<bool> _isAtTop = ValueNotifier(true);

  bool _handleScrollStart(ScrollStartNotification notification) {
    final metrics = notification.metrics;
    final offset = metrics.pixels;

    if (offset <= 0 && !_isAtTop.value) {
      scheduleMicrotask(() {
        if (mounted) _isAtTop.value = true;
      });
    } else if (offset > 0 && _isAtTop.value) {
      scheduleMicrotask(() {
        if (mounted) _isAtTop.value = false;
      });
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollStartNotification>(
      onNotification: _handleScrollStart,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          ListenableBuilder(
              listenable: _isAtTop,
              builder: (context, child) {
                return SliverVisibility(
                  visible: _isAtTop.value,
                  sliver: CupertinoSliverRefreshControl(
                    refreshIndicatorExtent: 50,
                    refreshTriggerPullDistance: 50,
                    onRefresh: () async {
                      HapticFeedback.vibrate();
                      widget.onRefresh();
                    },
                    builder: (context,
                            refreshState,
                            pulledExtent,
                            refreshTriggerPullDistance,
                            refreshIndicatorExtent) =>
                        Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: AppColors.mainRed,
                      child: Center(
                        child: Text(
                          context.localizations.pullToRefresh,
                        ),
                      ),
                    ),
                  ),
                );
              }),
          ...widget.slivers,
        ],
      ),
    );
  }
}
