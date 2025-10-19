import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgBackground extends StatelessWidget {
  final Widget child;
  final String svgPath;
  final BoxFit fit;
  final Color? color;
  final double opacity;

  const SvgBackground({
    super.key,
    required this.child,
    this.svgPath = 'assets/images/background.svg',
    this.fit = BoxFit.cover,
    this.color,
    this.opacity = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // SVG Background
        Positioned.fill(
          child: Opacity(
            opacity: opacity,
            child: SvgPicture.asset(
              svgPath,
              fit: fit,
              colorFilter:
                  color != null
                      ? ColorFilter.mode(color!, BlendMode.srcIn)
                      : null,
            ),
          ),
        ),
        // Content
        child,
      ],
    );
  }
}

class AppScaffoldWithSvgBackground extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final String svgPath;
  final BoxFit fit;
  final Color? color;
  final double opacity;
  final bool? resizeToAvoidBottomInset;

  const AppScaffoldWithSvgBackground({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.svgPath = 'assets/images/background.svg',
    this.fit = BoxFit.cover,
    this.color,
    this.opacity = 0.15,
    this.resizeToAvoidBottomInset,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: SvgBackground(
        svgPath: svgPath,
        fit: fit,
        color: color,
        opacity: opacity,
        child: body,
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
