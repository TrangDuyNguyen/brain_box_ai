import 'package:brain_box_ai/domain/repositories/profile_setting_repository.dart';
import 'package:brain_box_ai/providers/profile/profile_provider.dart';
import 'package:brain_box_ai/providers/profile/state/update_profile_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileNotifier extends StateNotifier<ProfileState> {
  final ProfileSettingRepository repository;

  ProfileNotifier(this.repository) : super(const ProfileInitial()) {
    getProfile();
  }

  Future<void> getProfile() async {
    final result = await repository.getProfile();
    result.fold((error) {
      state = ProfileError(error.toString());
    }, (data) {
      state = ProfileSuccess(data);
    });
  }

  Future<void> updateProfile() async {

  }
}

final profileNotifierProvider = StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
  final repository = ref.read(profileSettingRepositoryProvider);
  return ProfileNotifier(repository);
});
