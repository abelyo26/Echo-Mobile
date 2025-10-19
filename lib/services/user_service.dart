import '../models/user_model.dart';

class UserService {
  // This is a mock implementation - in a real app, this would call an API
  Future<User> getCurrentUser() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Return mock user data
    return const User(
      id: '1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      avatarUrl: 'https://example.com/avatar.jpg',
      isActive: true,
    );
  }

  Future<List<User>> getUsers() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      const User(id: '1', name: 'John Doe', email: 'john.doe@example.com'),
      const User(id: '2', name: 'Jane Smith', email: 'jane.smith@example.com'),
    ];
  }
}
