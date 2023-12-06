import 'package:eduguard/ui/registration_connexion/registration/model/authentificated_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<User?> {
  UserNotifier(User user) : super(user);

  void updateUser(User user) {
    state = user;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, User?>(
  (ref) => UserNotifier(User()),
);
