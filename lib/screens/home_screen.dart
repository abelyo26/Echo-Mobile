import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/svg_background.dart';
import '../constants/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Automatically navigate to devices screen after a short delay
    // Future.delayed(const Duration(seconds: 2), () {
    //   if (mounted) {
    //     context.go('/devices');
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWithSvgBackground(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.device_hub,
              size: 80,
              color: AppTheme.primaryGreen,
            ),
            const SizedBox(height: 24),
            const Text(
              'ECHO',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Your phone and PC, finally in sync.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () => context.go('/connect'),
              child: const Text('Connect'),
            ),
          ],
        ),
      ),
    );
  }
}
