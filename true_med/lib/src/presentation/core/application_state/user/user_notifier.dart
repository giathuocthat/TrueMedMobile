import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/entities/customer_entity.dart';
import 'user_state.dart';

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(const UserState());

  void setUser(CustomerResponseEntity user) {
    state = UserState(user: user);
  }

  void clear() {
    state = const UserState();
  }
}
