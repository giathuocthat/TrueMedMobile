import 'package:riverpod/riverpod.dart';
import 'user_notifier.dart';
import 'user_state.dart';

final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier();
});
