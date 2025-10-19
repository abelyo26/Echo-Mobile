import 'package:flutter/material.dart';
import '../widgets/svg_background.dart';
import '../constants/app_theme.dart';
import 'package:go_router/go_router.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({super.key});

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  bool _isSearching = false;
  final List<Device> _discoveredDevices = [];

  @override
  void initState() {
    super.initState();
    _startDeviceDiscovery();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _startDeviceDiscovery() {
    setState(() {
      _isSearching = true;
    });

    // Simulate device discovery with some mock data after a delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _discoveredDevices.addAll([
            Device(
              id: 'laptop-1',
              name: 'MacBook Pro',
              type: DeviceType.mac,
              isConnected: false,
              lastConnected: DateTime.now().subtract(const Duration(hours: 2)),
            ),
            Device(
              id: 'pc-1',
              name: 'Office PC',
              type: DeviceType.windows,
              isConnected: false,
              lastConnected: DateTime.now().subtract(const Duration(days: 1)),
            ),
            Device(
              id: 'laptop-2',
              name: 'Dell XPS',
              type: DeviceType.windows,
              isConnected: false,
              lastConnected: DateTime.now().subtract(const Duration(days: 3)),
            ),
            Device(
              id: 'laptop-2',
              name: 'Dell XPS',
              type: DeviceType.windows,
              isConnected: false,
              lastConnected: DateTime.now().subtract(const Duration(days: 3)),
            ),
            Device(
              id: 'laptop-2',
              name: 'Dell XPS',
              type: DeviceType.windows,
              isConnected: false,
              lastConnected: DateTime.now().subtract(const Duration(days: 3)),
            ),
            Device(
              id: 'laptop-2',
              name: 'Dell XPS',
              type: DeviceType.windows,
              isConnected: false,
              lastConnected: DateTime.now().subtract(const Duration(days: 3)),
            ),
            Device(
              id: 'laptop-2',
              name: 'Dell XPS',
              type: DeviceType.windows,
              isConnected: false,
              lastConnected: DateTime.now().subtract(const Duration(days: 3)),
            ),
          ]);
          _isSearching = false;
        });
      }
    });
  }

  void _connectToDevice(Device device) {
    // Show a loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    // Simulate connection process
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pop(); // Remove loading indicator
        setState(() {
          for (var d in _discoveredDevices) {
            if (d.id == device.id) {
              d.isConnected = true;
            } else {
              d.isConnected = false;
            }
          }
        });

        // Show success dialog
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Text('Connected to ${device.name}'),
                content: const Text(
                  'Your phone is now connected to this device.',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.go('/files'); // Navigate to files screen
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWithSvgBackground(
      appBar: AppBar(
        title: const Text('Connect Device'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // QR Code Scanner Section
            _buildQRCodeSection(),

            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),

            // Nearby Devices Section
            Expanded(child: _buildNearbyDevicesSection()),
          ],
        ),
      ),
    );
  }

  Widget _buildQRCodeSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.qr_code_scanner,
          size: 80,
          color: AppTheme.primaryGreen,
        ),
        const SizedBox(height: 24),
        const Text(
          'Scan QR Code from Desktop',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const Text(
          'Open Echo on your desktop and click "Pair New Device" to display a QR code.',
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        ElevatedButton.icon(
          onPressed: () {
            // This would trigger the camera to scan a QR code
            // For now, we'll just show a demo message
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Camera would open to scan QR code'),
              ),
            );
          },
          icon: const Icon(Icons.camera_alt),
          label: const Text('Start Scanning'),
        ),
      ],
    );
  }

  Widget _buildNearbyDevicesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Available Devices',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () {
                setState(() {
                  _isSearching = true;
                  _discoveredDevices.clear();
                });
                _startDeviceDiscovery();
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (_isSearching)
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 32),
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Searching for nearby devices...'),
              ],
            ),
          )
        else if (_discoveredDevices.isEmpty)
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 32),
                Icon(Icons.devices_other, size: 48, color: Colors.grey),
                SizedBox(height: 16),
                Text('No devices found'),
                SizedBox(height: 8),
                Text(
                  'Make sure Echo is running on your desktop',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          )
        else
          Expanded(
            child: ListView.builder(
              itemCount: _discoveredDevices.length,
              itemBuilder: (context, index) {
                final device = _discoveredDevices[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: _getDeviceIcon(device.type),
                    title: Text(device.name),
                    subtitle: Text(
                      device.isConnected
                          ? 'Connected'
                          : 'Last connected: ${_formatLastConnected(device.lastConnected)}',
                    ),
                    trailing:
                        device.isConnected
                            ? const Icon(
                              Icons.check_circle,
                              color: AppTheme.primaryGreen,
                            )
                            : OutlinedButton(
                              onPressed: () => _connectToDevice(device),
                              child: const Text('Connect'),
                            ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _getDeviceIcon(DeviceType type) {
    IconData iconData;
    switch (type) {
      case DeviceType.windows:
        iconData = Icons.laptop_windows;
        break;
      case DeviceType.mac:
        iconData = Icons.laptop_mac;
        break;
      case DeviceType.linux:
        iconData = Icons.laptop;
        break;
    }

    return CircleAvatar(
      backgroundColor: AppTheme.darkSecondary,
      child: Icon(iconData, color: AppTheme.textLight),
    );
  }

  String _formatLastConnected(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
}

class Device {
  final String id;
  final String name;
  final DeviceType type;
  bool isConnected;
  final DateTime lastConnected;

  Device({
    required this.id,
    required this.name,
    required this.type,
    required this.isConnected,
    required this.lastConnected,
  });
}

enum DeviceType { windows, mac, linux }
