import 'package:brain_box_ai/domain/entities/user_session.dart';
import 'package:brain_box_ai/providers/user_session/user_session_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/usecases/user_session_use_case.dart';

class UserSessionNotifier extends StateNotifier<UserSession> {
  final UserSessionUseCase useCase;
  UserSessionNotifier(this.useCase) : super(UserSession());

  Future<void> getUserSession() async {
    try {
      final result = await useCase.getUserSession();
      result.fold(
        (error) {
          print('Failed to get user session: $error');
        },
        (data) {
          state = data;
        },
      );
    } catch (e) {
      print('Exception occurred: $e');
    }
  }

  void setUserSession(UserSession model) {
    useCase.setUserSession(model);
  }

  void deleteUserSession() {}

  void getDeviceToken() {}

  void setDeviceToken() {}
}

final userSessionNotifierProvider =
    StateNotifierProvider<UserSessionNotifier, UserSession>((ref) {
  final useCase = ref.read(userSessionUseCaseProvider);
  return UserSessionNotifier(useCase);
});
