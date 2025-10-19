import 'package:echo/widgets/svg_background.dart';
import 'package:flutter/material.dart';

class ClipboardScreen extends StatefulWidget {
  const ClipboardScreen({super.key});

  @override
  State<ClipboardScreen> createState() => _ClipboardScreenState();
}

class _ClipboardScreenState extends State<ClipboardScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffoldWithSvgBackground(
      appBar: AppBar(title: const Text('Clipboard')),
      body: const Center(child: Text('Clipboard Screen')),
    );
  }
}
