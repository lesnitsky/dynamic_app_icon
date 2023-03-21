import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

import 'dynamic_app_icon_platform_interface.dart';

Future<void> _setIcon(Uint8List imageSource) {
  return DynamicAppIconPlatform.instance.setIcon(imageSource);
}

class AppIcon extends StatefulWidget {
  final Widget icon;
  final Color iconBackgroundColor;
  final BorderRadiusGeometry iconBorderRadius;
  final Listenable? animation;
  final int size;
  final Widget child;

  const AppIcon({
    super.key,
    required this.icon,
    required this.child,
    this.size = 256,
    this.animation,
    this.iconBackgroundColor = const Color(0xffffffff),
    this.iconBorderRadius = const BorderRadius.all(Radius.circular(32)),
  });

  @override
  State<AppIcon> createState() => _AppIconState();
}

class _AppIconState extends State<AppIcon> {
  final key = GlobalKey();

  @override
  void initState() {
    super.initState();

    updateIcon();
    widget.animation?.addListener(updateIcon);
  }

  void updateIcon() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final ro = key.currentContext!.findRenderObject();
      final rb = ro as RenderRepaintBoundary;
      final image = await rb.toImage(pixelRatio: 2);
      final byteData = await image.toByteData(format: ImageByteFormat.png);
      await _setIcon(byteData!.buffer.asUint8List());
    });
  }

  @override
  void didUpdateWidget(covariant AppIcon oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.icon != oldWidget.icon) {
      SchedulerBinding.instance.addPostFrameCallback((_) => updateIcon());
    }

    if (widget.animation != oldWidget.animation) {
      oldWidget.animation?.removeListener(updateIcon);
      widget.animation?.addListener(updateIcon);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final size = widget.size.toDouble();

    return Stack(
      children: [
        Transform.translate(
          offset: Offset(mq.size.width, mq.size.height),
          child: OverflowBox(
            maxWidth: size,
            maxHeight: size,
            child: SizedBox(
              width: size,
              height: size,
              child: RepaintBoundary(
                key: key,
                child: widget.icon,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: widget.child,
        ),
      ],
    );
  }
}
