import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:valorant_intel/config/themes/app_colors.dart';
import 'package:valorant_intel/core/extensions/context_extensions.dart';

class CustomSliverRefreshControl extends StatefulWidget {
  const CustomSliverRefreshControl({
    super.key,
    required this.onRefresh,
    required this.controller,
  });
  final ScrollController controller;
  final void Function() onRefresh;
  @override
  State<CustomSliverRefreshControl> createState() =>
      _CustomSliverRefreshControlState();
}

class _CustomSliverRefreshControlState
    extends State<CustomSliverRefreshControl> {
  final _isAtTop = ValueNotifier(true);
  @override
  void initState() {
    super.initState();
    widget.controller.position.isScrollingNotifier.addListener(() {
      final isScrolling = widget.controller.position.isScrollingNotifier.value;
      if (isScrolling) {
        if (widget.controller.offset <= 0 && !_isAtTop.value) {
          scheduleMicrotask(() {
            if (mounted) {
              _isAtTop.value = true;
            }
          });
        } else if (widget.controller.offset > 0 && _isAtTop.value) {
          scheduleMicrotask(() {
            if (mounted) {
              _isAtTop.value = false;
            }
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
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
            builder: (context, refreshState, pulledExtent,
                    refreshTriggerPullDistance, refreshIndicatorExtent) =>
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
      },
    );
  }
}
