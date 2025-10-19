import 'package:flutter/material.dart';
import '../widgets/svg_background.dart';

class FilesScreen extends StatelessWidget {
  const FilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWithSvgBackground(
      appBar: AppBar(title: const Text('File Sharing')),
      body: const Center(child: Text('Files & Sharing')),
    );
  }
}
