import 'package:flutter/material.dart';
import '../widgets/svg_background.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWithSvgBackground(
      appBar: AppBar(title: const Text('Notifications')),
      body: const Center(child: Text('Notification Mirroring')),
    );
  }
}
