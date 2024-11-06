import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapp/features/authentication/models/snapp_user.dart';

final sessionProvider = StateNotifierProvider<SessionViewModel, SnappUser?>(
  (ref) => SessionViewModel(),
);

class SessionViewModel extends StateNotifier<SnappUser?> {
  SessionViewModel() : super(null);

  SnappUser? getCurrentUser() => state;

  void setCurrentUser(SnappUser user) {
    state = user;
  }

  void clearSession() {
    state = null;
  }
}
