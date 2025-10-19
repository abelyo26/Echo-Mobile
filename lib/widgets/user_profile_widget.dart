import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserProfileWidget extends StatelessWidget {
  final User user;

  const UserProfileWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (user.avatarUrl != null)
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.avatarUrl!),
                onBackgroundImageError: (_, __) {},
                child:
                    user.avatarUrl == null
                        ? Text(user.name.substring(0, 1).toUpperCase())
                        : null,
              ),
            ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              user.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              user.email,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 24),
          const Divider(),
          ListTile(
            leading: Icon(
              user.isActive ? Icons.check_circle : Icons.cancel,
              color: user.isActive ? Colors.green : Colors.red,
            ),
            title: Text('Status: ${user.isActive ? "Active" : "Inactive"}'),
          ),
        ],
      ),
    );
  }
}
